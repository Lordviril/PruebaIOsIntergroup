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

func getProspectos(control:UIViewController, token:String, Ok:@escaping (([ResponseProspectoObject]) -> Void))
{

    SwiftSpinner.show("Cargando...")
    let Data = GetDataObject()
    if Data.count <= 0
    {
    
        getArrayWhitToken(url: KUrlProspectos, token: token, Ok: {res in
            var prospectosObjexts = [ResponseProspectoObject]()
            
            if res.count >= 1
            {
                for dic in res
                {
                    prospectosObjexts.append(ResponseProspectoObject(dic: dic as! NSDictionary))
                }
                SetData(Object: res as! [NSDictionary])
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
    else
    {
        var prospectosObjexts = [ResponseProspectoObject]()
        for dic in Data
        {
            prospectosObjexts.append(ResponseProspectoObject(dic: dic as! NSDictionary))
        }
        Ok(prospectosObjexts)
        SwiftSpinner.hide()
    }

}
