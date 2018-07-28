//
//  ProspectosController.swift
//  PruebaIosIntergroup
//
//  Created by Pedro Alonso Daza B on 28/07/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit
import Material

class ProspectoTableCell:UITableViewCell
{
    @IBOutlet weak var imState: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbSurname: UILabel!
    @IBOutlet weak var lbId: UILabel!
    @IBOutlet weak var lbCell: UILabel!
    
    func setProspectos(pospecto:ResponseProspectoObject)
    {
        
        lbName.text = pospecto.name
        lbSurname.text = pospecto.surname
        lbId.text = pospecto.id
        lbCell.text = pospecto.telephone
        
        var imDato = UIImage(named: "ic_history_white")
        switch pospecto.statusCd
        {
        case 0:
            imDato = UIImage(named: "ic_history_white")
            
        case 1:
            imDato = UIImage(named: "cm_check_white")
            
        case 2:
            imDato = UIImage(named: "cm_bell_white")
        case 3:
           imDato = UIImage(named: "cm_close_white")
        case 4:
           imDato = UIImage(named: "cm_star_white")
            
        default:
            imDato = UIImage(named: "cm_star_white")
        }
        
        imState.image = imDato
    }
}
class ProspectosController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var dataSourceItems: [DataSourceItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btCerrar: Button!
    
    var prospectos = [ResponseProspectoObject]()
    var prospecto = ResponseProspectoObject(dic: ["":""])
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getProspectos(control: self, token: USER.authToken, Ok: {res in
            
            self.prospectos = res
            
            self.tableView.reloadData()
            
        })
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.prospectos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Borrar") { (action, indexPath) in
            // delete item at indexPath
            self.prospectos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(self.prospectos)
        }
        
        let share = UITableViewRowAction(style: .default, title: "Editar") { (action, indexPath) in
            // share item at indexPath
            print("I want to share: \(self.prospectos[indexPath.row])")
            self.prospecto = self.prospectos[indexPath.row]
            self.performSegue(withIdentifier: "triEditar", sender: self)
        }
        
        
        share.backgroundColor = UIColor.lightGray
        
        return [delete, share]
    
    
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "triEditar" {
            if let destinationVC = segue.destination as? EditingController {
                destinationVC.prospecto = prospecto
                destinationVC.prospectoSend = { res in
                    var i = 0
                    var pross = [ResponseProspectoObject]()
                    for pro in self.prospectos
                    {
                        if pro.id == res.id
                        {
                            self.prospectos.remove(at: i)
                            self.prospectos.append(res)
                            
                            pross.append(res)
                            
                            
                            
                           
                        }
                        else
                        {
                            pross.append(pro)
                        }
                        i = i + 1
                    }
                    self.prospectos = pross
                    var dicc = [NSDictionary]()
                    for dd in self.prospectos
                    {
                        dicc.append(dd.getDic())
                    }
                    SetData(Object: dicc)
                    
                    self.tableView.reloadData()
                }
            
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prospectos.count
    }
    

    var cambiocolor = true


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath as IndexPath) as! ProspectoTableCell
        
        let row = indexPath.row
        
        
        cell.setProspectos(pospecto: prospectos[row])
        
        return cell
    }
    
    
    private func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
    }
    
    
     @IBAction func triEnter(_ sender: UIButton) {

        
        removeDataStorage()
        self.performSegue(withIdentifier: "triLogin", sender: self)
        
    }
    
    
}
