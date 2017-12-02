//
//  AuthVC.swift
//  breakpoint
//
//  Created by Andras on 1/12/17.
//  Copyright © 2017 Andras. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

   
    @IBAction func signInWithEmailBtnWasPressed(_ sender: Any) {
        
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    @IBAction func googleSignInBtnWasPressed(_ sender: Any) {
    }
    @IBAction func facebookSignInBtnWasPressed(_ sender: Any) {
    }
    
}
