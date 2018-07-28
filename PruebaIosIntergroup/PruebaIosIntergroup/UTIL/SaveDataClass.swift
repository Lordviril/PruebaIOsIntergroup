//
//  SaveDataClass.swift
//  simulador
//
//  Created by Pedro Daza on 5/12/17.
//  Copyright © 2017 Pedro Daza. All rights reserved.
//

import Foundation
import UIKit
import Material

func SetData(User: String)//, product:String)
{
    let Id = "KIdUser"

    UserDefaults.standard.set(User, forKey: Id)
 
}

func SetData(Pass: String)//, product:String)
{
    let Id = "KIdPass"

    UserDefaults.standard.set(Pass, forKey: Id)

}

func SetData(Token: String)//, product:String)
{
    let Id = "KIdToken"
    
    UserDefaults.standard.set(Token, forKey: Id)
    
}

func SetData(Object: [NSDictionary])//, product:String)
{
    let Id = "KIdDataProspecto"
    
    UserDefaults.standard.set(Object, forKey: Id)
    
}
func GetDataUser() -> String
{
    
    let Id = "KIdUser"
    
    var Program = "";
    if let program = UserDefaults.standard.object(forKey: Id)
    {
        Program = program as! String
    }
    
    
    
    return Program
}

func GetDataPass() -> String
{
    
    let Id = "KIdPass"
    
    var Program = "";
    if let program = UserDefaults.standard.object(forKey: Id)
    {
        Program = program as! String
    }
    
    
    
    return Program
}

func GetDataToken() -> String
{
    
    let Id = "KIdToken"
    
    var Program = "";
    if let program = UserDefaults.standard.object(forKey: Id)
    {
        Program = program as! String
    }
    
    
    
    return Program
}

func GetDataObject() -> [NSDictionary]
{
    
    let Id = "KIdDataProspecto"
    
    var Program = [NSDictionary]();
    if let program = UserDefaults.standard.object(forKey: Id)
    {
        Program = program as! [NSDictionary]
    }
    
    
    
    return Program
}


