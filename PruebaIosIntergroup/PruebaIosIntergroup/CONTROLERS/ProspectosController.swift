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
    }
}
class ProspectosController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var dataSourceItems: [DataSourceItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btCerrar: Button!
    
    var prospectos = [ResponseProspectoObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return dataSourceItems.count
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    var cambiocolor = true
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath as IndexPath) as! ProspectoTableCell
        
        let row = indexPath.row
        
        
        cell.setProspectos(pospecto: prospectos[row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
    }
    
    
     @IBAction func triEnter(_ sender: UIButton) {
        
        
    }
    
    
}
