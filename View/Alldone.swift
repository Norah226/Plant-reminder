//
//  Alldone.swift
//  MyApp
//
//  Created by Norah Bindokhi on 05/06/1448 AH.
//

import SwiftUI

struct Alldone: View {
    var body: some View {
        VStack(spacing:0){
            
            Image("winkyPlant")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text("All Done! 🎉")
                .font(.system(size: 24,weight: .semibold))
                .foregroundColor(.primary)
                .padding(.top,60)

            
            Text("All Reminders Completed")
                .font(.system(size: 16))
                .foregroundColor(.secondary)
                .padding(.top,14)

        }
        
        .preferredColorScheme(.dark)

    }
}

#Preview {
    Alldone()
}
