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
        Text(plant.name)
    }
}

#Preview {
    PlantRow(
        plant: Plant (name: "Monstera", room: .kitchen, wateringDays: .everyday, light: .fullSun, water: .ml20to50),
        viewModel: PlantsViewModel()
    )
}
