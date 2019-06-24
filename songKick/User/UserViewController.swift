//
//  UserViewController.swift
//  YourConcertHelper
//
//  Created by Alexander Demidovich on 04/06/2019.
//  Copyright © 2019 Denys White. All rights reserved.
//

import UIKit
import Firebase

class UserViewController: UIViewController{

    
    

    @IBAction func logOutAction(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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

