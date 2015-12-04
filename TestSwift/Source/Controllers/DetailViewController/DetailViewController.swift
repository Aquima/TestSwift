//
//  DetailViewController.swift
//  TestSwift
//
//  Created by Raul Quispe on 3/12/15.
//  Copyright © 2015 RaulQuispe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var lastNameTextField:UITextField!
    var btnGoBack:UIButton!
    var currentUser:UserEntity!
    var sizeView: CGSize = CGSize(width: 0, height: 0)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        sizeView = self.view.frame.size

        btnGoBack = UIButton()
        btnGoBack.setTitle("back", forState: .Normal)
        btnGoBack.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnGoBack.frame = CGRectMake(20, 50, 40, 40)
        btnGoBack.backgroundColor = UIColor.orangeColor()
        btnGoBack.titleLabel!.font =  UIFont(name: "Helvetica", size: 12)
        btnGoBack.addTarget(self, action: "backAction:", forControlEvents: UIControlEvents.TouchUpInside)
        btnGoBack.layer.cornerRadius = 20
        btnGoBack.layer.masksToBounds = true
        self.view.addSubview(btnGoBack)
        
        //this is for enbled = false
        let rect = CGRectMake(0, 0, btnGoBack.frame.width, btnGoBack.frame.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColor(context, CGColorGetComponents(UIColor.lightGrayColor().CGColor))
        CGContextFillRect(context, rect)
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        view.drawViewHierarchyInRect(view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        btnGoBack .setBackgroundImage(image, forState: .Disabled)
        
        btnGoBack.enabled = false
        
        lastNameTextField = UITextField(frame:  CGRectMake((sizeView.width-150)/2, 200, 150, 40))
        lastNameTextField.placeholder = "Change LatsName"
        lastNameTextField.font = UIFont.systemFontOfSize(15)
        lastNameTextField.borderStyle = UITextBorderStyle.RoundedRect
        lastNameTextField.autocorrectionType = UITextAutocorrectionType.No
        lastNameTextField.keyboardType = UIKeyboardType.Default
        lastNameTextField.returnKeyType = UIReturnKeyType.Next
        lastNameTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        lastNameTextField.textAlignment = NSTextAlignment.Center
        lastNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        lastNameTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        self.view.addSubview(lastNameTextField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    func backAction(sender:UIButton!)
    {
        self.lastNameTextField.resignFirstResponder()
        self.navigationController?.popViewControllerAnimated(true)
    }
    func textFieldDidChange(textField: UITextField) {
        if self.lastNameTextField.text?.isEmpty == false{
            currentUser.lastName = textField.text
            btnGoBack.enabled = true
        }else{
            btnGoBack.enabled = false
        }
    }
}
