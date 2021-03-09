//
//  ViewController.swift
//  NoteScanner
//
//  Created by Sheetal  on 3/30/20.
//  Copyright © 2020 Sheetal . All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        circularImage(circleImageView: circleIcon)
        circleIcon.layer.masksToBounds = true
    }
    
    //Circle Icon
    @IBOutlet weak var circleIcon: UIImageView!
    
    //Set Properties of Circle Icon
    func circularImage(circleImageView: UIImageView?)
    {
        circleIcon!.layer.frame = circleIcon!.layer.frame.insetBy(dx: 20, dy: 20)
        circleIcon!.layer.borderColor = UIColor.gray.cgColor
        circleIcon!.layer.cornerRadius = circleIcon!.frame.height/2
        circleIcon!.layer.masksToBounds = false
        circleIcon!.clipsToBounds = true
        circleIcon!.layer.borderWidth = 1.5
        circleIcon!.contentMode = UIView.ContentMode.scaleAspectFill
        
    }
   
}

