//
//  MarcaAuto.swift
//  ListasAW2
//
//  Created by molina on 29/02/16.
//  Copyright © 2016 Tec de Monterrey. All rights reserved.
//

import WatchKit

class Salon: NSObject {
    var nombre:String
    var piso:String
    var horario:String
    var id:String
    
    init(elNombre:String,elPiso:String, elHorario:String, elId:String)
    {
        nombre=elNombre
        piso="Piso : "+elPiso
        horario=elHorario
        id=elId
    }

}
