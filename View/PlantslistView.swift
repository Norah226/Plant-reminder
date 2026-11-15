//
//  PlantslistView.swift
//  MyApp
//
//  Created by Norah Bindokhi on 05/06/1448 AH.
//

import SwiftUI

struct PlantslistView: View {
    // عشان نعرض بياناته نستقبله اول شي
    var viewModel: PlantsViewModel
    var body: some View {
        
        VStack(spacing: 16) {
            
            // الجملة اللي فوق البار
            Text(viewModel.headerMessage)
            
            // بار جاهز يعد لي كم تعبى من الكل
            ProgressView(value: Double(viewModel.wateredCount),
                         total: Double(viewModel.plants.count))
                .tint(Color("buttonColor"))
                .padding(.horizontal,30)
            
            // المستخدم ينزل لتحت 
            ScrollView {
                VStack(spacing: 0) {
                    // لكل نبتة في الصندوق: اعرضي صف
                    ForEach(viewModel.plants) { plant in

                        PlantRow(plant: plant, viewModel: viewModel)
                            .padding(.vertical, 12)
                            // يخلي الصف كله قابل للضغط، حتى المساحة الفاضية
                            .contentShape(Rectangle())
                            // لما تضغط على النبتة: افتحي ورقة التعديل
                            .onTapGesture {
                                viewModel.startEditing(plant: plant)
                            }

                        // خط بين كل صف والثاني
                        Divider()
                    }
                }
                .padding(.horizontal, 16)
            }
            
            
            
            
        }
        .padding(.top,24)
    }
}


// هنا اضفت vm وهمية لان البيانات تضاف من قبل النستخدم نفسه بس عشان اقدر اجرب واشوف التطبيق سويت كذا
#Preview {
    let vm = PlantsViewModel()
    vm.plants = [
        Plant(name: "Monstera", room: .kitchen, wateringDays: .everyday, light: .fullSun, water: .ml20to50),
        Plant(name: "Pothos", room: .kitchen, wateringDays: .everyday, light: .fullSun, water: .ml20to50)
    ]
    return PlantslistView (viewModel: vm)
        .preferredColorScheme(.dark)


}
