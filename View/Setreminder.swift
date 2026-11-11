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
            // عنوان النبتة جبنا فورم جاهز وكتبنا فيه 
            Form{
                Section{
                    HStack{
                        Text("Plant Name")
                        TextField("Pothos", text: $viewModel.plantName)
                    }
                }
                Section{
                    //القائمة المنسدلة اسميهاوتحفظ الخيار في القائمة نفسها  picker
                    Picker(selection:$viewModel.room){
                        ForEach(Room.allCases, id:  \.self) {room in
                            Text(room.rawValue).tag(room)
                        }
                    } label: {
                        Label("Room", systemImage: "location")
                    }
                }
                
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
}
#Preview {
    Setreminder(viewModel: PlantsViewModel())
}
