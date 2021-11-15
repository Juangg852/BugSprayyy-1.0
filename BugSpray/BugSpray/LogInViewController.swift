//
//  LogInViewController.swift
//  BugSpray
//
//  Created by Juan Gonzalez on 11/14/21.
//

import UIKit
import Parse

class LogInViewController: UIViewController {
  
    
    @IBAction func Password(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogIn(_ sender: Any) {
        let username = UserName.text!
        let password = Password.text!

        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
                    if (user != nil){
                        self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    } else{
                        print("Error onSignup (String(describing: error?.localizedDescription))")
                    

                }

            }
    }
    
    @IBAction func SignUp(_ sender: Any) {
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
