//
//  UserEntity.swift
//  TestSwift
//
//  Created by Nicolas Miranda on 4/12/15.
//  Copyright © 2015 RaulQuispe. All rights reserved.
//

import UIKit

public class UserEntity: NSObject {
    
    public var nameUser:String?
    public var lastName:String?
  
    internal func loadWithData(objDictionary:NSDictionary) {
        // function implementation goes here
        nameUser = objDictionary["userName"]! as? String
        lastName = objDictionary["lastName"]! as? String
    }
}
