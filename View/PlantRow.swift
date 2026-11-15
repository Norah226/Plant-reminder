//
//  plantRow.swift
//  MyApp
//
//  Created by Norah Bindokhi on 05/06/1448 AH.
//

import SwiftUI

struct PlantRow: View {
    // هنا النبتة اللي بتنعرض في الصفحة
    let plant: Plant
    var viewModel: PlantsViewModel
    var body: some View {
        
        HStack(spacing: 16){
            
            // لما يضغط المستخدم يقلب سقي النبتة
            Button{
                viewModel.toggleWatered(plant: plant)
                
            }label: {
                if plant.isWatered{
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                } else {
                    Image(systemName: "circle")
                        .foregroundColor(.secondary)
                    
                }
            }
            .font(.title2)
            .buttonStyle(.plain)
            
            
            // مسافة بين كل سطر والثاني ٦
            VStack(alignment: .leading, spacing: 6){
                
                // ترتب لي الكلام جنب بعض
                HStack(spacing:4){
                    // اول شي حطينا النبتة بعدين الغرفه وبعدين rawvalue اللي هي القيمة اللي جنب الغرفة في ملف عشان تطلع لليوزر زي ماعرفتها enums
                    Image(systemName: "location")
                    Text("in \(plant.room.rawValue)")
                }
                .font(.footnote)
                .foregroundColor(.secondary)
                
                
                Text(plant.name)
                    .font(.title2)
                
                
                HStack(spacing:8){
                    
                    //تاق الشمس
                    Label(plant.light.rawValue, systemImage: "sun.max")
                        .foregroundStyle(Color("sunTag"))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color(.systemGray6))
                        .clipShape(Capsule())
                    
                    //تاق الموية
                    Label(plant.water.rawValue, systemImage: "drop")
                        .foregroundStyle(Color("waterTag"))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color(.systemGray6))
                        .clipShape(Capsule())
                    
                    
                    
                }
                // عشان يصغر الحجم
                .font(.caption)
            }
            // هنا شرط يقول هل سقيت النباتات؟ اذا اي خلها تبهت تصير نص والا اللي هي نقطتين تبقى زيها واحد 
            .opacity(plant.isWatered ? 0.5 : 1)
            Spacer()
        }
        .preferredColorScheme(.dark)
    }
}

    #Preview {
        PlantRow(
            plant: Plant (name: "Monstera", room: .kitchen, wateringDays: .everyday, light: .fullSun, water: .ml20to50),
            viewModel: PlantsViewModel()
        )
    }

