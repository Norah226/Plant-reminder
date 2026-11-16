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
           
            // قائمة جاهزة فيها صفوف مقسمة وقابلة للسحب 
            List {
                ForEach(viewModel.plants) { plant in

                    PlantRow(plant: plant, viewModel: viewModel)
                        .padding(.vertical, 8)
                        .contentShape(Rectangle())
                        // ضغطة على النبتة: تفتح ورقة التعديل
                        .onTapGesture {
                            viewModel.startEditing(plant: plant)
                        }
                        // خلفية الصف شفافة، عشان تكون سوداء مثل الصفحة
                        .listRowBackground(Color.clear)
                        // السحب من اليمين: يطلع زر حذف أحمر
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                viewModel.delete(plant: plant)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
            }
            // شكل بسيط بدون صناديق رمادية
            .listStyle(.plain)
            // نشيل خلفية القائمة الافتراضية
            .scrollContentBackground(.hidden)
            
            
            
            
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
