//
//  GroupFeedVC.swift
//  breakpoint
//
//  Created by Andras on 27/1/18.
//  Copyright © 2018 Andras. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var groupTitleLbl: UILabel!
    
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIButton!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var messageTextField: InsetTextField!
    var group: Group?
    
    func initData(forGroup group: Group) {
        self.group = group
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLbl.text = group?.groupTitle
        DataService.instance.getEmailsFor(group: group!) { (returnedEmails) in
            self.membersLbl.text = returnedEmails.joined(separator: ", ")
        }
        membersLbl.text = group?.members.joined(separator: ", ")
        
    }

    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func sendBtnWasPressed(_ sender: Any) {
        
    }
}
