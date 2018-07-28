//
//  CustomTextField.swift
//  PruebaIosIntergroup
//
//  Created by Pedro Alonso Daza B on 27/07/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import Material

class CustomTextField: TextField, TextFieldDelegate
{
    var isEmail = false;
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.detailColor = UIColor.red
        self.isClearIconButtonEnabled = true
        
        self.delegate = self
    }
    


    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if isEmail
        {
            if isValidEmail(testStr: self.text!)
            {
                self.detail = ""
            }
            else
            {
                self.detail = ErrorEmailEsit
                
            }
            
        }
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func setImage(named:String)
    {
        let email = Icon.icon(named)
        let leftView = UIImageView()
        let image = email
        leftView.image = image
        self.leftView = leftView
    }
    
    func setImage(icon:UIImage)
    {
        let leftView1 = UIImageView()
        let image1 = icon
        leftView1.image = image1
        self.leftView = leftView1
    }
}
