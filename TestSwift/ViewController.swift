//
//  ViewController.swift
//  TestSwift
//
//  Created by Raul Quispe on 3/12/15.
//  Copyright © 2015 Quimadevelopers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let btnLogin = UIButton()
        btnLogin.setTitle("✸", forState: .Normal)
        btnLogin.setTitleColor(UIColor.blueColor(), forState: .Normal)
        btnLogin.frame = CGRectMake(15, -50, 300, 500)
        btnLogin.addTarget(self, action: "pressed", forControlEvents: .TouchUpInside)
        self.view.addSubview(btnLogin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

