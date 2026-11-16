//
//  plantsviewmodel.swift
//  MyApp
//
//  Created by Norah Bindokhi on 01/06/1448 AH.
//

import Foundation
import Observation
import UserNotifications

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
        requestNotification()
    }
    // مهمة حفظ البيانات لما اليوزر يضغط صح
    func savePlant (){
        // هنا لما اليوزر يبي يعدل طبعا الاندكس تمثل ترتيب النبتة في اي صف والid يمثل رقمها وهنا الدالة تقول دوري على الid هذا شوفي وين النبتة جالسة وعدلي بياناتها
        if let editingPlantID {
            let index = plants.firstIndex(where: {$0.id == editingPlantID})
            if let index{
                plants[index].name = plantName
                plants[index].room = room
                plants[index].wateringDays = wateringDays
                plants[index].light = light
                plants[index].water = water
                scheduleNotification(plant: plants[index])
            }
            // إذا ما فيه رقم تعديل (nil) ← نضيف: نصنع نبتة جديدة ونحطها في الصندوق
        }else{
            let newPlant = Plant(name: plantName, room: room, wateringDays: wateringDays, light: light, water: water)
            plants.append(newPlant)
            scheduleNotification(plant: newPlant)
        }
        cancel()
    }
    //ترجّع الحقول لأصلها
    // هذي الدالة ترجع القيمة فاضية كل ما جا المستخدم يحط reminder جديد
    func resetForm () {
        plantName = ""
        room = .bedroom
        wateringDays = .everyday
        light = .fullSun
        water = .ml20to50
        editingPlantID = nil
        
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
    
    // تفتح الشيت ببيانات النبتة وتسمح للمستخدم بالتعديل
    func startEditing(plant: Plant){
        editingPlantID = plant.id
        // هنا على اليسار الحقول واليمين الاشياء اللي كتبها المستخدم قبل عشان لما يعذل ماتصير الحقول فاضية
        plantName = plant.name
        room = plant.room
        wateringDays = plant.wateringDays
        light = plant.light
        water = plant.water
        showSetReminder = true
    }
    
    // دالة حذف النبتة اللي تطلع في شيت التعديل
    func deletePlant() {
        //هنا تقول اذا لقيتي رقم النبتة هذا خذيها وشيليها علطول عشان كذا ماحطينا انديكس
        if let editingPlantID{
            plants.removeAll(where: { $0.id == editingPlantID })
            
            cancelNotification(plantID: editingPlantID)

        }
        cancel()
    }
    
    // دالة الحذف باستخدام السحب تستقبل نوع النبتة اللي تسحبها المستخدمة
    func delete(plant: Plant){
        // هنا شرط يقول هل النبتة تساوي نفس الايدي حقها ؟ اذا اي احذفي
        plants.removeAll(where: { $0.id == plant.id})
        
        cancelNotification(plantID: plant.id)
        
    }
    
    // تطلب من اليوزر الاذن بالاشعارات
    func requestNotification(){
        // مركز الاشعارات
        UNUserNotificationCenter.current()
        // هنا معناها اطلبي الاذن وحطينا خيار يكون في صوت وتنبيه وبعدها التطبيق مايوسي شي اذا رد المستخدم
            .requestAuthorization(options: [.alert, .sound]) { _, _ in}
    }
    
    // جدولة الاشعار
    func scheduleNotification(plant: Plant){
        //هنا نجهز رسالة الاشعار
        let content = UNMutableNotificationContent()
        content.body = "Hey! let's water your plant"
        content.sound = .default
        // هنا تقول احسبي الايام بالساعات والثواني عشان تعرف تعكس قيمة اي نبتة اللي دخلها المستخدم؟ مثلا بوتس كل يوم تحسب وهكذا
        let seconds = Double(plant.wateringDays.days * 24 * 60 * 60)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: true)
        // هنا تحط الرسالة في ظرفف
        let request = UNNotificationRequest(identifier: plant.id.uuidString, content: content, trigger: trigger)
        //وخلاص اخر شي اضافة الاشعار
        UNUserNotificationCenter.current().add(request)
    }
    
    // دالة لو المستخدم حذف نبتة يحذف الاشعار معها
    func cancelNotification(plantID: UUID){
        
        UNUserNotificationCenter.current()
        
            .removePendingNotificationRequests(withIdentifiers: [plantID.uuidString])
    }
}

