//
//  ListViewController.swift
//  TestSwift
//
//  Created by Raul Quispe on 3/12/15.
//  Copyright © 2015 Raul Quispe. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView: UITableView!
    var sizeView: CGSize = CGSize(width: 0, height: 0)
    var items: NSArray = [
        ["userName": "Raul", "lastName": "Quispe"]
        ,   ["userName": "Samuel", "lastName": "Mamani"],
        ["userName": "Raul", "lastName": "Martinez"]
        ,   ["userName": "Samuel", "lastName": "Galindo"],
        ["userName": "Raul", "lastName": "Guitierrez"]
        ,   ["userName": "Samuel", "lastName": "Huanca"],
        ["userName": "Raul", "lastName": "Presley"]
        ,   ["userName": "Samuel", "lastName": "Ferrand"],
        ["userName": "Raul", "lastName": "Pierola"]
        ,   ["userName": "Samuel", "lastName": "Gil"]
    ]
    var userItems:NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        sizeView = self.view.frame.size
        userItems = NSMutableArray()
        for var index = 0; index < items.count; ++index {
            let dict = items.objectAtIndex(index) as! NSDictionary
            let newUser = UserEntity()
            newUser.loadWithData(dict)
            userItems.addObject(newUser)
        }
        tableView = UITableView()
        tableView.frame         =   CGRectMake(0, 0, sizeView.width, sizeView.height);
        tableView.delegate      =   self
        tableView.dataSource    =   self
        
      //  tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath)-> CGFloat{
        return 120
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let identifier = "CustomOneCell"
        var cell: CustomOneCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? CustomOneCell
        if cell == nil {
            tableView.registerNib(UINib(nibName: "CustomOneCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? CustomOneCell
        }
        let currentUser = userItems.objectAtIndex(indexPath.row) as! UserEntity
        cell.loadWithUser(currentUser)
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      //  print("You selected cell #\(indexPath.row)!")
        let cell:CustomOneCell = tableView.cellForRowAtIndexPath(indexPath) as! CustomOneCell
        let detailVC: DetailViewController = DetailViewController()
        detailVC.currentUser=cell.currentUser
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

    
    // MARK: - Navigation
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        tableView.reloadData()
    }

}
