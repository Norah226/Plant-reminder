

import SwiftUI

struct Startpage: View {
    var body: some View {
        
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            
            
            VStack (alignment: .leading, spacing: 0){
                
                HStack{
                    Text("My Plants🌱")
                        .font(.system(.largeTitle, design: .default))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.horizontal,20)
                .padding(.top,10)
                
                
                Divider()
                    .background(Color.gray)
                    .padding(.horizontal,20)
                    .padding(.top,12)
                
                Spacer()
                
            
                    Image("Myplant")
                        .resizable()
                        .scaledToFit()
                        .frame(width:180,height: 180)
                        .frame(maxWidth: .infinity)
                    Spacer()
                
                
                
                
                    
                }
            }
        }
    }

















 #Preview {
    Startpage()
}
//
//  Created by Norah Bindokhi on 29/05/1448 AH.
//

