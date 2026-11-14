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
    
    // هذي نقصد بها لما المستخدم يبي يعدل هنا خانة تسأل اي نبته نعدل الحين ؟ اذا فيها رقم تعطيه نسخة التعديل اذالا معناته المستخدم يبي يضيف نبتة جديدة
    var editingPlantID: UUID? = nil
    // ما تكتبه المستخدمة في الورقة
    // room تمثل اسم الخانة Room الenumا واخر شي الbedroom القيمة داخل الصندوق
    // حطينا سترنق وخليناه فاضي لان المستخدم مابعد كتب شي
    var plantName: String = ""
    var room: Room = .bedroom
    var wateringDays: WateringDays = .everyday
    var light: Light = .fullSun
    var water: Water = .ml20to50
    
    // هذي خانة تعد لي النباتات المسقية فقط
    // حطينا { مب = لانها ماتحفظ قيمة هي تحسب القيمة كل ماسألها أحد
    var wateredCount: Int {
        // هنا شوفي النباتات المسقية وعديهم
        plants.filter {$0.isWatered}.count
    }
    
    // الجمل اللي فوق البار
    var headerMessage: String{
        
        if wateredCount == 0 {
            return "Your plants are waiting for a sip 💦"
        } else {
            // داخل النص: هذي طريقة نحط فيها رقم داخل جملة الشرطة المائلة والقوسين معناها: "لا تكتبين كلمة wateredCount حرفيًا، حطي قيمتها".
            return "\(wateredCount) of your plants feel loved today ✨"
        }
    }
    
    // خانة تعطيني الشاشة النهائية اذا سقينا كل النباتات
    var allWatered: Bool {
        // احسبي هل عدد النباتات المسقية يساوي كل النباتات؟ اي كلها مسقية
        wateredCount == plants.count
    }
    
    
    //تقفل الورقة وتمسح الحقول
    func cancel () {
        showSetReminder = false
        resetForm()
    }
    //تبدأ وتفتح الورقة
    func start () {
        hasStarted = true
        showSetReminder = true
    }
    //تصنع نبتة وتضيفها وتقفل
    // مهمة حفظ النبتة اللي يحددها المستخدم
    func savePlant (){
        let newPlant = Plant (name: plantName, room: room, wateringDays: wateringDays, light: light, water: water)
        // هنا كأني اقول للصندوق اضف النبتة اللي اضافها المستخدم لنفسه
        plants.append(newPlant)
        cancel()
        
    }
    //ترجّع الحقول لأصلها
    // هذي الدالة ترجع القيمة فاضية كل ما جا المستخدم يحط reinder جديد
    func resetForm () {
        plantName = ""
        room = .bedroom
        wateringDays = .everyday
        light = .fullSun
        water = .ml20to50
    }
    
    // دالة سقي النبتة
    func toggleWatered(plant: Plant) {
        // firstindex تدور على رقم النبته
        // $0 هذي تفحص رقم النبتة
        // == هذي تسأل هي هذه هي النبه او لا
        let index = plants.firstIndex(where: {$0.id == plant.id})
        
        // if let تقول فيه ولا مافيه؟ اذا فيه طبقي الشرط
        if let index{
            // هنا تطبق الشرط اذا كانت قيمتها true ترجع false والعكس
            plants[index].isWatered.toggle()
        }
    }
}
