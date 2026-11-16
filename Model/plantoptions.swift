//
//  plantoptions.swift
//  MyApp
//
//  Created by Norah Bindokhi on 30/05/1448 AH.
//

import Foundation
enum Room: String, CaseIterable{
    case bedroom = "Bedroom"
    case livingRoom = "Living Room"
    case kitchen = "Kitchen"
    case balcony = "Balcony"
    case bathroom = "Bathroom"
}

enum WateringDays: String, CaseIterable{
    case everyday = "Every day"
    case everytwodays = "Every 2 days"
    case everythreedays = "Every 3 days"
    case onceaweek = "Once a week"
    case everytendays = "Every 10 days"
    case everytwoweeks = "Every 2 weeks"
    
    // هذي عشان تطابق اختيار النبتة وترجع لي القيمة حسب خيار عدد ايام السقي استخدمنا self لهذا الغرض
    var days: Int{
        switch self{
        case .everyday: return 1
        case .everytwodays: return 2
        case .everythreedays: return 3
        case .onceaweek: return 7
        case .everytendays: return 10
        case .everytwoweeks: return 14
        }
    }
    
    
    
}

enum Light: String, CaseIterable{
    case fullSun = "Full Sun"
    case partialSun = "Partial Sun"
    case lowLight = "Low Light"
}


//اسم الcase مافيه مسافات او شرطات عشان كذا كتبناه بهذي الطريقة
// استخدمت نوع سترنق لانه مو رقم واحد مثلا 20 لا
enum Water: String, CaseIterable{
    case ml20to50 = "20-50 ml"
    case ml50to100 = "50-100 ml"
    case ml100to200 = "100-200 ml"
    case ml200to300 = "200-300 ml"
}
