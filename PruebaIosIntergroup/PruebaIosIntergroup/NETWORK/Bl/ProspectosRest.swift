//
//  ProspectosRest.swift
//  PruebaIosIntergroup
//
//  Created by Pedro Alonso Daza B on 28/07/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit
import SwiftSpinner

func GetLogIn(control:UIViewController, token:String, Ok:@escaping (([ResponseProspectoObject]) -> Void))
{

    SwiftSpinner.show("Connecting to satellite...")
    
    getArrayWhitToken(url: KUrlProspectos, token: token, Ok: {res in
        var prospectosObjexts = [ResponseProspectoObject]()
        
        if res.count >= 1
        {
            for dic in res
            {
                prospectosObjexts.append(ResponseProspectoObject(dic: dic as! NSDictionary))
            }
            
            Ok(prospectosObjexts)
        }
        else
        {
            showAlertError(View: control, Men: ErrorProspectos0)
        }
        

        SwiftSpinner.hide()
        
    }, Error: {res in
        SwiftSpinner.hide()
        showAlertError(View: control, Men: res)
        
    })

}
