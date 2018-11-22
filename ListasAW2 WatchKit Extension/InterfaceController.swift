//
//  InterfaceController.swift
//  ListasAW2 WatchKit Extension
//
//  Created by molina on 29/02/16.
//  Copyright © 2016 Tec de Monterrey. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var laTable: WKInterfaceTable!
    
    var nuevoArray:[Any]?
    //let datosJSON = "[ {\"nombre\": \"Control numerico\", \"piso\": 1}, {\"nombre\": \"BMW\", \"piso\": 2} ]"
    
    func JSONParseArray(_ string: String) -> [AnyObject]{
        if let data = string.data(using: String.Encoding.utf8){
            
            do{
                
                if let array = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)  as? [AnyObject] {
                    return array
                }
            }catch{
                
                print("error")
                //handle errors here
                
            }
        }
        return [AnyObject]()
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        //nuevoArray=JSONParseArray(datosJSON)
        let direccion="http://martinmolina.com.mx/201813/novus2018/iCEDETEC/salonesV1.json"
        let url = URL(string: direccion)
        let datos = try? Data(contentsOf: url!)
        
        nuevoArray = try! JSONSerialization.jsonObject(with: datos!) as? [Any]
        print(nuevoArray ?? "hola")
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        laTable.setNumberOfRows(nuevoArray!.count, withRowType: "renglones")
        for indice in 0 ..< nuevoArray!.count {
            let elRenglon=laTable.rowController(at: indice) as! controladorRenglon
            let objetoSalon = nuevoArray?[indice] as! [String: Any]
            let piso=objetoSalon["piso"] as! String
            let nombre=objetoSalon["nombre"] as! String
            elRenglon.etiqueta.setText(piso)
            elRenglon.agencias.setText(nombre)

        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        let objetoSalon = nuevoArray?[rowIndex] as! [String: Any]
        let n=objetoSalon["nombre"] as! String
        let p=objetoSalon["piso"] as! String
        let h=objetoSalon["horario"] as! String
        let id=objetoSalon["id"] as! String
        let s=Salon(elNombre: n, elPiso: p, elHorario: h, elId: id)
        return s
    }

}
