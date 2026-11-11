//
//  plantsviewmodel.swift
//  MyApp
//
//  Created by Norah Bindokhi on 01/06/1448 AH.
//

import Foundation
import Observation
@Observable
class PlantsViewModel{
    // plants هنا البي سمول لانها خانة مب نوع
    var plants:[Plant] = []
    var showSetReminder: Bool = false
    var hasStarted: Bool = false
    // ما تكتبه المستخدمة في الورقة
    // room تمثل اسم الخانة Room الenumا واخر شي الbedroom القيمة داخل الصندوق
    var plantName: String = ""
    var room: Room = .bedroom
    var wateringDays: WateringDays = .everyday
    var light: Light = .fullSun
    var water: Water = .ml20to50
    
    func cancel () {
        showSetReminder = false
    }
    func start () {
        hasStarted = true
        showSetReminder = true
    }
    
// مهمة حفظ النبتة اللي يحددها المستخدم
    func savePlant (){
        let newPlant = Plant (name: plantName, room: room, wateringDays: wateringDays, light: light, water: water)
        // هنا كأني اقول للصندوق اضف النبتة اللي اضافها المستخدم لنفسه
        plants.append(newPlant)
        cancel()
        
    }
}
