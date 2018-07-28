//
//  EditingController.swift
//  PruebaIosIntergroup
//
//  Created by Pedro Alonso Daza B on 28/07/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit

class EditingController:UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    @IBOutlet weak var vGeneral: UIView!
    @IBOutlet weak var etName: CustomTextField!
    @IBOutlet weak var etLastName: CustomTextField!
    @IBOutlet weak var etId: CustomTextField!
    @IBOutlet weak var etPhone: CustomTextField!
    @IBOutlet weak var pState: UIPickerView!
    
    var prospecto = ResponseProspectoObject(dic: ["":""])
    
    var prospectoSend:((_ prospecto:ResponseProspectoObject)->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        etName.text = prospecto.name
        etLastName.text = prospecto.surname
        etId.text = prospecto.id
        etPhone.text = prospecto.telephone
        
        pState.delegate = self
        pState.dataSource = self
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    
    @IBAction func triGuardar(_ sender: UIButton) {

        if ValidationEmpty(viewc: vGeneral)
        {
            dismiss(animated: true, completion: {
                self.prospecto.name = self.etName.text!
                self.prospecto.surname = self.etLastName.text!
                self.prospecto.id = self.etId.text!
                self.prospecto.telephone = self.etPhone.text!
                
                self.prospectoSend?(self.prospecto)
            })
        }
        
        
    }
    
    @IBAction func triCerrar(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

            return ArrayStates.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

            return ArrayStates[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        prospecto.statusCd = row
    }
}
