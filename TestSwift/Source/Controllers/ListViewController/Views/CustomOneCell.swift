//
//  CustomOneCell.swift
//  TestSwift
//
//  Created by Raul Quispe on 3/12/15.
//  Copyright © 2015 Quimadevelopers. All rights reserved.
//

import UIKit

class CustomOneCell: UITableViewCell {
    var imageViewCell:UIImageView!
    var lblName:UILabel!
    var lblLastName:UILabel!
    
    internal var currentUser:UserEntity!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewCell = UIImageView()
        imageViewCell.backgroundColor = UIColor.greenColor()
        imageViewCell.frame = CGRectMake(10, 10, 100, 100)
        imageViewCell.layer.cornerRadius = 50;
        imageViewCell.layer.masksToBounds = true
        imageViewCell.clipsToBounds = true
        imageViewCell.contentMode = UIViewContentMode.ScaleAspectFit
        self.addSubview(imageViewCell)
        
        lblName = UILabel()
        lblName.frame = CGRectMake(125, 30, 200, 24)
        lblName.textAlignment = NSTextAlignment.Left
        lblName.textColor = UIColor.blackColor()
        lblName.font = UIFont(name: "Helvetica-Bold", size: 20)
        self.addSubview(lblName)
        
        lblLastName = UILabel()
        lblLastName.frame = CGRectMake(125, 60, 200, 24)
        lblLastName.textAlignment = NSTextAlignment.Left
        lblLastName.textColor = UIColor.darkGrayColor()
        lblLastName.font = UIFont(name: "Helvetica", size: 18)
        self.addSubview(lblLastName)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - internal Functions
    internal func loadWithUser(objUser:UserEntity) {
        // function implementation goes here
        let imageName = objUser.nameUser!
        let image = UIImage(named: imageName)
        imageViewCell.image = image
        lblName.text = objUser.nameUser
        lblLastName.text = objUser.lastName
        currentUser=objUser
    }
}
