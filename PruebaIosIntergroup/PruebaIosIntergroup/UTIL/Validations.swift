//
//  Validations.swift
//  PruebaIosIntergroup
//
//  Created by Pedro Alonso Daza B on 27/07/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit
import Material

func ValidationEmpty(viewc: UIView) -> Bool
{
    var permiso = true
    for vv in viewc.subviews as [UIView]
    {
        if vv is TextField
        {
            let textff = vv as! TextField
            let text = textff.placeholder!
            if text.range(of:"*") != nil
            {
                if textff.text == ""
                {
                    textff.detail = ErrorEmpty
                    permiso = false
                }
                else
                {
                    textff.detail = ""

                }
            }
            else
            {
                textff.detail = ""
                
            }
            
            
            
        }
    }
    
    return permiso
    
}
