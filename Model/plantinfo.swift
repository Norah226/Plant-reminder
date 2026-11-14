//
//  plantinfo.swift
//  MyApp
//
//  Created by Norah Bindokhi on 01/06/1448 AH.
//

import Foundation
struct Plant : Identifiable{
    
    // هنا نعطي كل نبتة رقم خاص فيها عشان نتعرف عليها
    let id = UUID()
    var name: String
    var room: Room
    var wateringDays: WateringDays
    var light: Light
    var water: Water
    // عطيناها قيمة false لان اول مايدخل المستخدم النبتة تطلع له انها تحتاج نسقيها
    
    var isWatered: Bool = false
}
