//
//  CreateGroupsVC.swift
//  breakpoint
//
//  Created by Andras on 13/12/17.
//  Copyright © 2017 Andras. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var groupMemberLbl: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tableview: UITableView!
    
    var emailArray = [String]()
    var chosenUserArray = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doneButton.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    @objc func textFieldDidChange() {
        if emailSearchTextField.text == "" {
            emailArray = []
            tableview.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTextField.text!, handler: { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableview.reloadData()
            })
        }
    }

    @IBAction func doneBtnWasPressed(_ sender: Any) {
    }
    
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

  

}
extension CreateGroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else { return UITableViewCell() }
        let profileImage = UIImage(named: "defaultProfileImage")
        
        if chosenUserArray.contains(emailArray[indexPath.row]) {
        cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: true)
        } else {
            cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row], isSelected: false)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell =  tableview.cellForRow(at: indexPath) as? UserCell else { return }
        if !chosenUserArray.contains(cell.emailLbl.text!) {
            chosenUserArray.append(cell.emailLbl.text!)
            groupMemberLbl.text = chosenUserArray.joined(separator: ", ")
            doneButton.isHidden = false
        } else {
            chosenUserArray = chosenUserArray.filter({ $0 != cell.emailLbl.text! })
            if chosenUserArray.count >= 1 {
                groupMemberLbl.text = chosenUserArray.joined(separator: ", ")
            } else {
                groupMemberLbl.text = "add people to your group"
                doneButton.isHidden = true
            }
        }
    }
}
//Need this for the addTarget
extension CreateGroupsVC: UITextFieldDelegate {
    
}
