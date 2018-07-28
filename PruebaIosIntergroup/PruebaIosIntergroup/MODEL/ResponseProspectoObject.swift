//
//  ResponseProspectoObject.swift
//  PruebaIosIntergroup
//
//  Created by Pedro Alonso Daza B on 28/07/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation

class ResponseProspectoObject: NSObject
{

    var name = ""
    var surname = ""
    var id = ""

    var telephone = ""
    
    var statusCd = 0
    init(dic:NSDictionary) {
        name = ValueJsonString(dic: dic, key: "name")
        surname = ValueJsonString(dic: dic, key: "surname")
        id = ValueJsonString(dic: dic, key: "id")
        telephone = ValueJsonString(dic: dic, key: "telephone")
        statusCd = ValueJsonInt(dic: dic, key: "statusCd")
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        
        let dic = ["name":aDecoder.decodeObject(forKey: "name"),
                   "surname":aDecoder.decodeObject(forKey: "surname"),
                   "id":aDecoder.decodeObject(forKey: "id"),
                   "telephone":aDecoder.decodeObject(forKey: "telephone"),
                   "statusCd":aDecoder.decodeInteger(forKey: "statusCd")]
        
        self.init(dic: dic as NSDictionary)
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(name, forKey: "name")
        aCoder.encode(surname, forKey: "surname")
        aCoder.encode(id, forKey: "id")
        aCoder.encode(telephone, forKey: "telephone")
        aCoder.encode(statusCd, forKey: "statusCd")

        
    }
}
