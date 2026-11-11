//
//  Setreminder.swift
//  MyApp
//
//  Created by Norah Bindokhi on 30/05/1448 AH.
//

import SwiftUI

struct Setreminder: View {
    // نستخدم bindable عشان نخلي المستخدم يقدر يكتب في الحقول
    @Bindable var viewModel: PlantsViewModel
    
    var body: some View {
        NavigationStack {
            // عنوان الصفحة
            Text("Set reminder")
                .navigationTitle("Set Reminder")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    
                    // مكان زر الاكس
                    ToolbarItem(placement: .topBarLeading) {
                        Button{
                            // وش يصير لما نضغطه؟ نستدعي الدالة
                            viewModel.cancel()
                            // شكل الزر
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                    // زر الصح
                    ToolbarItem(placement: .topBarTrailing){
                        Button{
                            viewModel.savePlant()
                        } label: {
                            Image(systemName: "checkmark")
                        }
                        
                        
                    }
                }
        }
    }
}
#Preview {
    Setreminder(viewModel: PlantsViewModel())
}
