//
//  ViewController.swift
//  ShopSun
//
//  Created by sun on 23/4/2562 BE.
//  Copyright © 2562 sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        print("You Click Login")
    }
    
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        print("You Click Register")
    }
    


}

