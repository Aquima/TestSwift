//
//  LogInViewController.swift
//  TestSwift
//
//  Created by Raul Quispe on 3/12/15.
//  Copyright © 2015 Quimadevelopers. All rights reserved.
//

import UIKit
public var sizeView: CGSize = CGSize(width: 0, height: 0)

class LogInViewController: UIViewController,UITextFieldDelegate {
    var scrollView: UIScrollView!
    var usernameTextField:UITextField!
    var passwordTextField:UITextField!
    var btnLogIn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        sizeView = self.view.frame.size
        
        self.scrollView = UIScrollView()
        self.scrollView.frame = CGRectMake(0, 0, sizeView.width, sizeView.height)
       // self.scrollView.delegate = self
        self.scrollView.contentSize = sizeView
        view.addSubview(scrollView)
        
        usernameTextField = UITextField(frame:  CGRectMake((sizeView.width-150)/2, sizeView.height-200, 150, 40))
        usernameTextField.placeholder = "Username"
        usernameTextField.font = UIFont.systemFontOfSize(15)
        usernameTextField.borderStyle = UITextBorderStyle.RoundedRect
        usernameTextField.autocorrectionType = UITextAutocorrectionType.No
        usernameTextField.keyboardType = UIKeyboardType.Default
        usernameTextField.returnKeyType = UIReturnKeyType.Next
        usernameTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        usernameTextField.textAlignment = NSTextAlignment.Center
        usernameTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        usernameTextField.delegate = self
        usernameTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        scrollView.addSubview(usernameTextField)
        
        passwordTextField = UITextField(frame:  CGRectMake((sizeView.width-150)/2, sizeView.height-150, 150, 40))
        passwordTextField.placeholder = "Password"
        passwordTextField.font = UIFont.systemFontOfSize(15)
        passwordTextField.borderStyle = UITextBorderStyle.RoundedRect
        passwordTextField.autocorrectionType = UITextAutocorrectionType.No
        passwordTextField.keyboardType = UIKeyboardType.Default
        passwordTextField.returnKeyType = UIReturnKeyType.Done
        passwordTextField.clearButtonMode = UITextFieldViewMode.WhileEditing
        passwordTextField.textAlignment = NSTextAlignment.Center
        passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        passwordTextField.secureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        scrollView.addSubview(passwordTextField)
        
        btnLogIn = UIButton()
        btnLogIn.setTitle("Log In", forState: .Normal)
        btnLogIn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btnLogIn.frame = CGRectMake((sizeView.width-150)/2, sizeView.height-100, 150, 40)
        btnLogIn.backgroundColor = UIColor.orangeColor()
        btnLogIn.titleLabel!.font =  UIFont(name: "Helvetica", size: 15)
        btnLogIn.addTarget(self, action: "logInAction:", forControlEvents: UIControlEvents.TouchUpInside)
        btnLogIn.layer.cornerRadius = 5
        btnLogIn.layer.masksToBounds = true

        scrollView.addSubview(btnLogIn)
        
        //this is for enbled = true
        let rect = CGRectMake(0, 0, btnLogIn.frame.width, btnLogIn.frame.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColor(context, CGColorGetComponents(UIColor.lightGrayColor().CGColor))
        CGContextFillRect(context, rect)
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        view.drawViewHierarchyInRect(view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        btnLogIn .setBackgroundImage(image, forState: .Disabled)
        
        btnLogIn.enabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK - Actions
    func logInAction(sender:UIButton!)
    {
        print("Button Log In")
        self.usernameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        let listVC: ListViewController = ListViewController()
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    func textFieldDidChange(textField: UITextField) {
        //your code
        if self.usernameTextField.text?.isEmpty == false && self.passwordTextField.text?.isEmpty == false{
            btnLogIn.enabled = true
        }else{
            btnLogIn.enabled = false
        }
    }
    // MARK:- Textfield Delegates
    func textFieldDidBeginEditing(textField: UITextField) {
        print("TextField did begin editing method called")
        if(textField==self.usernameTextField){
            self.scrollView.setContentOffset(CGPointMake(0, 120), animated: true)
        }
        if(textField==self.passwordTextField){
            self.scrollView.setContentOffset(CGPointMake(0, 170), animated: true)
        }
        
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("TextField should return method called")
        if(textField==self.usernameTextField){
            self.usernameTextField.resignFirstResponder()
            self.passwordTextField.becomeFirstResponder()
        }
        if(textField==self.passwordTextField){
            self.passwordTextField.resignFirstResponder()
            self.scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        }
        if self.usernameTextField.text?.isEmpty == false && self.passwordTextField.text?.isEmpty == false{
            btnLogIn.enabled = true
        }else{
            btnLogIn.enabled = false
        }
        return true;
    }
    

}
