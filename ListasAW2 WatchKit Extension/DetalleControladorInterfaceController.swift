//
//  DetalleControladorInterfaceController.swift
//  ListasAW2
//
//  Created by molina on 29/02/16.
//  Copyright © 2016 Tec de Monterrey. All rights reserved.
//

import WatchKit
import Foundation


class DetalleControladorInterfaceController: WKInterfaceController {

    var counter:Int=0
    
    @IBAction func cambiar() {
        if counter==0 {
            imagen.setImageNamed("Panono101")
            counter=1
        } else {
            imagen.setImageNamed("Gear101")
            counter=0
        }
    }
    
    @IBOutlet var imagen: WKInterfaceImage!
    @IBOutlet var piso: WKInterfaceLabel!
    @IBOutlet var nombre: WKInterfaceLabel!
    @IBOutlet var Horario: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let s=context as! Salon
        let pisoS=s.piso
        let nombreS=s.nombre
        let horarioS=s.horario
        piso.setText(pisoS)
        nombre.setText(nombreS)
        Horario.setText(horarioS)
        imagen.setImageNamed("Gear101")
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
