//
//  UserRest.swift
//  PruebaIosIntergroup
//
//  Created by Pedro Alonso Daza B on 27/07/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit
import SwiftSpinner

func GetLogIn(control:UIViewController, email:String, pass:String, Ok:@escaping ((ResponseUserObject) -> Void))
{
    let url = KUrlLogIn + "?email=\(email)&password=\(pass)"
    SwiftSpinner.show("Connecting to satellite...")
    getDictionary(url: url, Ok: {res in
        
        let user = ResponseUserObject (dic: res)
        
        if user.success
        {
            USER = user
            
            Ok(USER)
        }else
        {
            showAlertError(View: control, Men: user.error)
        }
        SwiftSpinner.hide()
        
    }, Error: {res in
        SwiftSpinner.hide()
        showAlertError(View: control, Men: res)
        
    })
}
