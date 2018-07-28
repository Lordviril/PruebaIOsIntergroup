//
//  GlobalVar.swift
//  PruebaIosIntergroup
//
//  Created by Pedro Alonso Daza B on 27/07/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation

let KUrl = "http://directotesting.igapps.co/"
let KUrlLogIn = KUrl + "application/login"
let KUrlProspectos = KUrl + "sch/prospects.json"

let ArrayStates = ["Pendiente", "Aprovado", "Aceptado", "Rechazado", "Desactivado"]

var USER = ResponseUserObject(dic: ["":""])

func removeDataStorage()
{
    print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
    
    for key in Array(UserDefaults.standard.dictionaryRepresentation().keys) {
        
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    UserDefaults.standard.synchronize()
    
    print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
}
