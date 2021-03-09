//
//  LogOutViewController.swift
//  LotteryApp
//
//  Created by Roger Navarro on 4/14/20.
//  Copyright © 2020 Roger Navarro. All rights reserved.
//

import UIKit
import AWSMobileClient

class LogOutViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.layer.cornerRadius = 10
        userNameLabel.layer.shadowColor = UIColor.black.cgColor
        userNameLabel.layer.shadowOpacity = 0.5
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userNameLabel.text = AWSMobileClient.default().username
    }
}
