//
//  ResponseUserObject.swift
//  PruebaIosIntergroup
//
//  Created by Pedro Alonso Daza B on 27/07/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit

class ResponseUserObject: NSObject
{
    var success = false
    var authToken = ""
    var email = ""
    var zone = ""
    var code = 134
    var error = ""
    
    init(dic:NSDictionary) {
        success = ValueJsonBool(dic: dic, key: "success")
        authToken = ValueJsonString(dic: dic, key: "authToken")
        email = ValueJsonString(dic: dic, key: "email")
        zone = ValueJsonString(dic: dic, key: "zone")
        code = ValueJsonInt(dic: dic, key: "code")
        error = ValueJsonString(dic: dic, key: "error")
    }
    
    

    
}
