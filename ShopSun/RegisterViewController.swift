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
            uploadDataToServer(name: name, user: user, password: password)
            
        }
        
    }
    
    func uploadDataToServer(name:String,user:String,password:String) -> Void {
      
        let urlString = "https://www.androidthai.in.th/ssm/addDataSun.php?isAdd=true&Name=\(name)&User=\(user)&Password=\(password)"
        
        let url = URL(string: urlString)
        let request = NSMutableURLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {data,response,error in
            if error != nil /* check error ว่าส่งได้ไหม */{
                print("Have Error")
            } else {
                
                if let testReadAble = data /* ถ้ากำหนดค่าใน testReadAble ได้ก็จะทำงานใน if */{
                    
                    let canReadData = NSString(data: testReadAble, encoding: String.Encoding.utf8.rawValue) //ถอยรหัสออกมาจากtestReadAble
                    
                    print("canReadData ==>> \(String(describing: canReadData))")
                    
                    let myResult = canReadData
                    if myResult == "true" {
                        
                        DispatchQueue.main.async /* ทำให้ performSegue ทำงานใน task ได้*/{
                        self.performSegue(withIdentifier: "BackToAuthen", sender: nil)
                        }
                        
                    }
                    
                    
                }else{
                    
                    print("Cannot Read Able")
                    
                }//if 2
                
            }// if 1
        } // End Task
        task.resume()
        
        
        
        
        
    }// uploadData
    

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
