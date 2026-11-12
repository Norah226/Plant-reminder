//
//  Noreminders.swift
//  MyApp
//
//  Created by Norah Bindokhi on 02/06/1448 AH.
//

import SwiftUI

struct Noreminders: View {
    var body: some View {
// الصفحة هذي واجهة بس فاضية لان في الشاشة الاساس حطينا شرط وضبطنا السبيسنق
            
            Text("No reminders set yet...")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.top,20)
                .padding(.horizontal,30)
        
        
                .preferredColorScheme(.dark)
    }
}

#Preview {
    Noreminders()
}
