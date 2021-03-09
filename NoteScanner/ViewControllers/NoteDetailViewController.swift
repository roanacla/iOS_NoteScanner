//
//  ListDetailViewController.swift
//  NoteScanner
//
//  Created by Roger Navarro on 5/2/20.
//  Copyright © 2020 Sheetal . All rights reserved.
//

import UIKit
import Combine
import AWSAppSync
import AWSMobileClient


protocol NoteDetailViewControllerDelegate{
    func dataDidSave(noteObject: Note)
    func newNoteCreated(noteObject: Note)
}

class NoteDetailViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var rightNavButton: UIBarButtonItem!
    
    //MARK: - Published | Data
    @Published private var dateData: String!
    @Published private var titleData: String!
    @Published private var textData: String!
    
    enum ViewMode {
        case addMode
        case editMode
    }
    
    var viewMode: ViewMode = .addMode
    
    //MARK: - Properties
    var noteObject: Note!
    var delegate: NoteDetailViewControllerDelegate?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.layer.cornerRadius = 17.0
        viewMode = noteObject == nil ? .addMode : .editMode
        addObservesToDataSources()
        loadDataInView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switch viewMode {
        case .addMode:
            let cancelButton = UIBarButtonItem()
            cancelButton.title = "Cancel"
            navigationItem.leftBarButtonItem = cancelButton
            cancelButton.target = self
            cancelButton.action = #selector(cancel)
            
        case .editMode:
            break
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        switch viewMode {
        case .addMode:
            break
        case .editMode:
            self.saveData()
            self.delegate?.dataDidSave(noteObject: noteObject)
        }
    }
    
    //MARK: - Functions
    
    func loadDataInView() {
        switch viewMode {
        case .addMode:
            navigationItem.rightBarButtonItem?.title = "Save"
            self.title = "New Note"
        case .editMode:
            titleData = noteObject.title
            dateData = noteObject.editedTime
            textData = noteObject.text
            rightNavButton.isEnabled = false
        }
    }
    
    func saveData() {
        switch viewMode {
        case .addMode:
            guard let identityID = AWSMobileClient.default().identityId else { return }
            noteObject = Note(id: UUID().uuidString, userId: identityID , title: titleData, text: textData, editedTime: dateData, type: "\(TextType.note)")
        case .editMode:
            noteObject.title = titleData
            noteObject.editedTime = dateData
            noteObject.text = textData
        }
    }
    
    //MARK: - Observers
    var observers: [AnyCancellable?] = []
    
    func addObservesToDataSources() { //Observer Pattern
        
        let dateDataObserver: AnyCancellable? = $dateData.sink() { newValue in
            guard let newValue = newValue else { return }
            self.dateLabel.text = DateUtils.convertToPrettyString(fromISOString: newValue)
            self.rightNavButton.isEnabled = true
        }
        
        let titleDataObserver: AnyCancellable? = $titleData.sink() { value in
            self.title = value
        }
        let textDataObserver: AnyCancellable? = $textData.sink() { value in
            self.textView.text = value
        }
        observers.append(dateDataObserver)
        observers.append(titleDataObserver)
        observers.append(textDataObserver)
    }
    
    //MARK: - IBActions
    @IBAction func pressRightNavButton(_ sender: Any) {
        switch viewMode {
        case .addMode: //Save Record
            saveData()
            delegate?.newNoteCreated(noteObject: noteObject)
            dismiss(animated: true)
        case .editMode: //Revert changes
            loadDataInView()
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }

}

extension NoteDetailViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        titleData = TextUtils.generateTitle(textView.text)
        dateData = DateUtils.convertToISOString(from: Date())
        textData = textView.text
    }
}
