//
//  RegisterViewController.swift
//  ShopSun
//
//  Created by sun on 23/4/2562 BE.
//  Copyright © 2562 sun. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func backToAuthen(_ sender: Any) {
        
        performSegue(withIdentifier: "BackToAuthen", sender: nil)
        
    }
    
    
    @IBAction func uploadButton(_ sender: UIBarButtonItem) {
        
        let name = nameTextField.text!
        let user = userTextField.text!
        let password = passwordTextField.text!
        
        print("name ==>> \(name)")
        print("user ==>> \(user)")
        print("password ==>> \(password)")
        
        if((name.count == 0) || (user.count == 0) || (password.count == 0)){
            print("Have Space")
            myAlert(titleString: "Have Space", messageString: "กรุณาใส่ข้อความให้ครบ")
        }else{
            print("No Space")
        }
        
    }
    

    func myAlert(titleString:String,messageString:String) -> Void {
        
        let objAlert = UIAlertController(title: titleString, message: messageString, preferredStyle: UIAlertController.Style.alert)
        
        objAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            objAlert.dismiss(animated: true, completion: nil)
        }))
        
        present(objAlert,animated: true,completion: nil)
        
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
