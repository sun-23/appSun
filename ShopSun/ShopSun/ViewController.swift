//
//  ViewController.swift
//  ShopSun
//
//  Created by sun on 23/4/2562 BE.
//  Copyright © 2562 sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userTextField.delegate = self
        self.passwordTextField.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        let user = userTextField.text!
        let password = passwordTextField.text!
        
        if ((user.count == 0) || (password.count == 0)) {
           myAlert(titleString: "Have Space", messageString: "กรุณาใส่ข้อความให้ครบ")
        }else{
            chackUserAndPass(user: user, password: password)
        }
        
        print("You Click Login")
        
    }// loginbutton
    
    func chackUserAndPass(user:String,password:String) -> Void {
        
        let urlString:String = "https://www.androidthai.in.th/ssm/getUserWhereUserSun.php?isAdd=true&User=\(user)"
        
        guard let url = URL(string: urlString) else {
            print("Have Error")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let dataResponse = data,error == nil else {
                return
            }
            
            
            do{
                
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                print("jsonResponse ==>> \(jsonResponse)")
                
                guard let jsonArray = jsonResponse as? [[String:Any]] else {return}
                
                print("jsonArray ==>> \(jsonArray)")
                
                let jsonDictionary:Dictionary = jsonArray[0]
                let truePassword:String = jsonDictionary["Password"] as! String
                
                print("true password ==>> \(truePassword)")
                
                if password == truePassword{
                    print("welcome to app")
                }else{
                    DispatchQueue.main.async {
                        self.myAlert(titleString: "Password false", messageString: "Plase Try Again")
                    }
                }
                
            } catch let myError{
                DispatchQueue.main.async {
                    print(myError)
                    self.myAlert(titleString: "No User", messageString: "No \(user) in DataBase")
                }
            }
            
        }// end task
        
        task.resume()
        
        
        
        
    }
    
    func myAlert(titleString:String,messageString:String) -> Void {
        
        let alert = UIAlertController(title: titleString, message: messageString, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        present(alert,animated: true,completion: nil)
        
    }
    
    
    
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        print("You Click Register")
        performSegue(withIdentifier: "GoToRegister", sender: nil)
    }// registerbutton
    


}//main class

