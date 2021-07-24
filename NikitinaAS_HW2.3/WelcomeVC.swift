//
//  WelcomeVC.swift
//  NikitinaAS_HW2.3
//
//  Created by Анна Никитина on 24.07.2021.
//

import UIKit

class WelcomeVC: UIViewController {
    
//MARK: - IB Outlets
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var LogOutButton: UIButton!
    
    var user = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user)!"
    }
}
