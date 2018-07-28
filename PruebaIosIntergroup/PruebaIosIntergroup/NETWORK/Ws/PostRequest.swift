//
//  PostRequest.swift
//  PruebaIosIntergroup
//
//  Created by Pedro Alonso Daza B on 27/07/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import Alamofire

func getDictionary(url:String, Ok:@escaping ((NSDictionary) -> Void), Error:@escaping ((String!) -> Void))
{


    print("Url: \(url)")
    request(url, method: .get, encoding: URLEncoding.default)
        .responseData {response in
            if let err = response.result.error {
                print("error code: \(err.localizedDescription)")
                print("error: \(err.localizedDescription)")
                Error( "En el momento la aplicación no está disponible intente más tarde")
            }
                
            else if (response.response?.statusCode == 200 || response.response?.statusCode == 422 || response.response?.statusCode == 422)
            {
                
                if let data = response.data{
                    
                    let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    print("Json muestra: \(str)")
                    var err: NSError?
                    var json:NSDictionary?// = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves) as? NSDictionary
                    
                    
                    do {
                        json = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                        // use anyObj here
                    } catch {
                        Error( "\(error)")
                        print("json error: \(error)")
                        return
                    }
                    
                    
                    print("error: \(json)")
                    
                    DispatchQueue.main.async() {
                    

                        if let data = json
                        {
                            Ok(json!)
                        }
                        else
                        {
                            Error("Error de codificacion")
                        }
                        

                        
                    }
                }
                
            }
            else
            {
                Error("Error de codificacion")
            }
    }
    
    
    
}

func getArrayWhitToken(url:String, token:String, Ok:@escaping ((NSArray) -> Void), Error:@escaping ((String!) -> Void))
{
    let headers: HTTPHeaders = [
        "Authorization": "Basic \(token)",
        "Content-Type": "application/json"
    ]
    
    print("Url: \(url)")
    request("https://geotopo-c60e2.firebaseio.com/Dispositivos.json", method: .get, encoding: URLEncoding.default, headers: headers)

        .responseData {response in
            if let err = response.result.error {
                print("error code: \(err.localizedDescription)")
                print("error: \(err.localizedDescription)")
                Error( "En el momento la aplicación no está disponible intente más tarde")
            }
                
            else if (response.response?.statusCode == 200)
            {
                
                if let data = response.data{
                    
                    let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    print("Json muestra: \(str)")
                    var err: NSError?
                    var json:NSArray?// = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves) as? NSDictionary
                    
                    
                    do {
                        json = try JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                        // use anyObj here
                    } catch {
                        Error( "\(error)")
                        print("json error: \(error)")
                        return
                    }
                    
                    
                    print("error: \(json)")
                    
                    DispatchQueue.main.async() {
                        
                        
                        if let data = json
                        {
                            Ok(json!)
                        }
                        else
                        {
                            Error("Error de codificacion")
                        }
                        
                        
                        
                    }
                }
                
            }
            else
            {
                Error("Error de codificacion")
            }
    }
    
    
    
}
