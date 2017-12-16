//
//  UserCell.swift
//  breakpoint
//
//  Created by Andras on 13/12/17.
//  Copyright © 2017 Andras. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    var showing = false
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.profileImage.image = image
        self.emailLbl.text = email
        if isSelected {
            self.checkImage.isHidden = false
        } else {
            self.checkImage.isHidden = true
        }
    }
    
    //When the cell is selected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            if showing == false {
            checkImage.isHidden = false
            showing = true
            }
            else {
            checkImage.isHidden = true
            showing = false
        }
    }
    }

}
