//
//  MeVC.swift
//  breakpoint
//
//  Created by Andras on 3/12/17.
//  Copyright © 2017 Andras. All rights reserved.
//

import UIKit

class MeVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
      

    }
    @IBAction func signOutBtnWasPressed(_ sender: Any) {
    }
}
