//
//  ScanViewController.swift
//  NoteScanner
//
//  Created by Roger Navarro on 4/16/20.
//  Copyright © 2020 Sheetal . All rights reserved.
//

import UIKit
import MobileCoreServices
import AWSAppSync
import AWSMobileClient
import os.log

func delay(seconds: Double, completion: @escaping ()-> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

class ScanViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var zoomOutConstraint: NSLayoutConstraint!
    @IBOutlet weak var zoomInConstraint: NSLayoutConstraint!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var stackView: UIStackView!
    
    //MARK: - Properties
    var appSyncClient: AWSAppSyncClient?
    let processor = ScaledElementProcessor()
    var frameSublayer = CALayer()
    var saveButton: UIButton?
    var scannedText: String = "Detected text can be edited here." {
      didSet {
        textView.text = scannedText
      }
    }
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.addSublayer(frameSublayer)
        self.appSyncClient = (UIApplication.shared.delegate as! AppDelegate).appSyncClient
        self.initializeAWSMobileClient()
        imageView.layer.cornerRadius = 5.0
        textView.layer.cornerRadius = 17.0
    }
    
    
    //MARK: - IBActions
    @IBAction func scanNote(_ sender: Any) {
        self.pickPhoto()
    }
    
    @IBAction func logOut(unwindSegue: UIStoryboardSegue) {
        clearPictureAndNotes()
        self.forceUpdateToListsAndNotes()
        AWSMobileClient.default().signOut()
        showLogInView()
    }
    
    // MARK: - Functions
    
    func toggleSaveButtonInView(add: Bool = true) {
        if add {
            saveButton = UIButton()
            saveButton?.setTitleColor(UIColor(red: 162/255, green: 132/255, blue: 94/255, alpha: 1), for: .normal)
            saveButton?.setTitle("   Save", for: .normal)
            saveButton?.addTarget(self, action: #selector(showSaveTextMenu), for: .touchUpInside)
            saveButton?.setImage(UIImage(systemName: "arrow.down.doc.fill"), for: .normal)
            saveButton?.setPreferredSymbolConfiguration(.init(pointSize: 30), forImageIn: .normal)
            if let saveButton = saveButton {
                stackView.insertArrangedSubview(saveButton, at: 0)
            }
        } else {
            saveButton?.removeFromSuperview()
        }
    }
    
    func pickPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
          showPhotoMenu() //The simulator will not get here.
        } else {
          choosePhotoFromLibrary()
        }
    }
    
    func showPhotoMenu() {
      let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
      
      let actCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      alert.addAction(actCancel)
      
      let actPhoto = UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
        self.takePhotoWithCamera()
      })
      alert.addAction(actPhoto)
      
      let actLibrary = UIAlertAction(title: "Choose From Library", style: .default, handler: { _ in
        self.choosePhotoFromLibrary()
      })
      alert.addAction(actLibrary)
      
      present(alert, animated: true, completion: nil)
    }
    
    func takePhotoWithCamera() {
      let imagePicker = UIImagePickerController()
      imagePicker.sourceType = .camera
      imagePicker.delegate = self
      imagePicker.allowsEditing = true
      imagePicker.view.tintColor = view.tintColor
      present(imagePicker, animated: true, completion: nil)
    }
    
    func choosePhotoFromLibrary() {
      let imagePicker = UIImagePickerController()
      imagePicker.sourceType = .photoLibrary
      imagePicker.delegate = self
      imagePicker.allowsEditing = true
      imagePicker.view.tintColor = view.tintColor
      present(imagePicker, animated: true, completion: nil)
    }
    
    func initializeAWSMobileClient() {
        AWSMobileClient.default().initialize{ (userState, error) in
            guard error == nil else {
                print("🔴 \(error!.localizedDescription)")
                return
            }
            if let userState = userState {
                if userState == .signedOut {
                    self.showLogInView()
                } else {
                    self.checkSignIn()
                }
            }
        }
    }
    
    func addBulletsToText(text: String?) -> String? {
        guard let text = text else { return nil }
        let array = text.split(separator: "\n")
        let bulletListText = array.map { "• \($0)" }.joined(separator: "\n")
        return bulletListText
    }
    
    @objc func showSaveTextMenu() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let actCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actCancel)
        
        let actPhoto = UIAlertAction(title: "Save as List", style: .default, handler: { _ in
            self.saveNote(as: .list)
        })
        alert.addAction(actPhoto)
        
        let actLibrary = UIAlertAction(title: "Save as Note", style: .default, handler: { _ in
            self.saveNote(as: .note)
        })
        alert.addAction(actLibrary)
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveNote(as type: TextType) {
        if textView.text.isEmpty {
            AlertUtils.showAlertWithOkButton(title: "Error", message: "A note cannot be saved without a text.", in: self)
            return
        }
        guard let userId = AWSMobileClient.default().identityId else {
            AlertUtils.showAlertWithOkButton(title: "Error", message: "Please log in again. ", in: self)
            return
        }
        let title = TextUtils.generateTitle(textView.text)
        let text: String
        let date = DateUtils.convertToISOString(from: Date())
        let textType: String
        switch type {
        case .list:
            text = addBulletsToText(text: textView.text) ?? ""
            textType = type.rawValue
        case .note:
            text = textView.text
            textType = type.rawValue
        }
        
        let noteInput = CreateNoteInput(id: UUID().uuidString, userId: userId, title: title, text: text, editedTime: date, type: textType)
        let noteMutation = CreateNoteMutation(input: noteInput)
        appSyncClient?.perform(mutation: noteMutation, resultHandler: {[weak self] result, error in
            guard let self = self else { return }
            if error != nil {
                AlertUtils.showAlertWithOkButton(title: "Error", message: "Error while saving the note", in: self)
            } else {
//                AlertUtils.showAlertWithOkButton(title: "Thanks and Good luck!", message: nil, in: self) {
//                    self.stopBuyButtonAnimation()
//                }
                print("🟢 Your note is saved")
                self.forceUpdateToListsAndNotes()
                self.showHudView()
                self.clearPictureAndNotes()
            }
        })
    }
    
    func forceUpdateToListsAndNotes() {
        if let secondTab = (self.tabBarController?.viewControllers![1] as? UINavigationController)?.topViewController as? ListsTableViewController {
            secondTab.needUpdateList = true
        }
        if let thirdTab = (self.tabBarController?.viewControllers![2] as? UINavigationController)?.topViewController as? NotesTableViewController {
            thirdTab.needUpdateNotes = true
        }
    }
    
    func clearPictureAndNotes() {
        self.textView.text = ""
        self.imageView.image = UIImage(systemName: "doc.text.viewfinder")
        self.removeFrames()
        self.toggleSaveButtonInView(add: false)
        self.toggleZoomOutImage(on: false)
    }
    
    func showHudView() {
        let hudView = HudView.hud(inView: self.view, animated: true)
        hudView.text = "Saved"
        delay(seconds: 0.6){
            hudView.hide()
        }
    }
    
    func showLogInView() {
        AWSMobileClient.default().showSignIn(navigationController: self.navigationController!, signInUIOptions: SignInUIOptions(canCancel: false,
        logoImage: UIImage(named: "cognito"),
        backgroundColor: UIColor(red: 253/255, green: 206/255, blue: 119/255, alpha: 1))) { (userState, error) in
            print("show Log In View after code")
            guard error == nil else {
                AlertUtils.showAlertWithOkButton(title: "Error", message: "Error signing in", in: self)
                print("🔴" + error!.localizedDescription)
                return
            }
            guard let state = userState else { return }
            if state == .signedIn {
                if AWSMobileClient.default().identityId != nil {
                    self.checkSignIn()
                }
            }
        }
    }
    
    func checkSignIn() {
        if AWSMobileClient.default().isSignedIn {
//            self.loadCurrentGameAndTickets()
            print("I logged in successfully")
        } else {
            self.showLogInView()
        }
    }
    
    func toggleZoomOutImage(on: Bool = true) {
        zoomInConstraint.isActive = on ? false : true
        zoomOutConstraint.isActive = on ? true : false
        imageView.layer.cornerRadius = on ? 17.0 : 5.0
        textView.layer.cornerRadius = on ? 5.0 : 17.0
    }
    
    func prepareViewForShowingImage() {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0, delay: 1.0, options: .curveEaseOut, animations: {
            self.toggleZoomOutImage()
            self.toggleSaveButtonInView()
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.drawFeatures(in: self.imageView)
        })
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
//MARK: - ML Kit Functions
extension ScanViewController {
    private func drawFeatures(in imageView: UIImageView, completion: (() -> Void)? = nil) {
      removeFrames()
      processor.process(in: imageView) { text, elements in
        elements.forEach() { element in
          self.frameSublayer.addSublayer(element.shapeLayer)
        }
        self.scannedText = text
        completion?()
      }
    }
    
    private func removeFrames() {
      guard let sublayers = frameSublayer.sublayers else { return }
      for sublayer in sublayers {
        sublayer.removeFromSuperlayer()
      }
    }
}


extension ScanViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverPresentationControllerDelegate {
  
    // MARK: UIImagePickerController Delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {            
            self.clearPictureAndNotes()
            imageView.contentMode = .scaleAspectFit
            let fixedImage = pickedImage.fixOrientation()
            imageView.image = fixedImage
        }
        dismiss(animated: true) {
            self.prepareViewForShowingImage()
        }
    }
}
