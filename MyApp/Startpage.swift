

import SwiftUI

struct Startpage: View {
    var body: some View {
        
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            
            
            VStack (alignment: .leading, spacing: 0){
                
                
                // الهيدر
                HStack{
                    Text("My Plants🌱")
                        .font(.system(.largeTitle, design: .default))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                }
                .padding(.horizontal,20)
                .padding(.top,10)
                
                // الخط الفاصل
                Divider()
                    .background(Color.gray)
                    .padding(.horizontal,20)
                    .padding(.top,12)
                
                
                VStack(alignment: .center, spacing: 0) {
                    // الصورة
                    Spacer()
                    Image("Myplant")
                        .resizable()
                        .scaledToFit()
                        .frame(width:180,height: 180)
                        .frame(maxWidth: .infinity)
                    
                    
                    
                    VStack (spacing: 25){
                        // النصوص تحت الصورة
                        
                        Text("Start your plant journey!")
                            .font(.system(.title2, design: .default))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        
                        Text("Now all your plants will be in one place and\nwe will help you take care of them :) 🪴")
                            .font(.system(.body, design: .default))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,30)
                        
                        // مسافة ترفع لي الكلام
                        Spacer()
                        
                    }
                    .padding(.top, 37)
                    
                }
                .frame(maxWidth: .infinity)
                
                
                Spacer()
                Button(action: { // 7️⃣ [فتحنا الـ closure أو القوس الخاص بعملية النقر على الزر]
                    // إجراء الزر مستقبلاً
                }) { // 8️⃣ [فتحنا القوس اللي بيشيل شكل وتصميم محتوى الزر من داخل]
                    
                    Text("Set Plant Reminder")
                        .font(.system(.headline, design: .default))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.20, green: 0.50, blue: 0.41))
                        .cornerRadius(25)
                    
                } // 8️⃣ [قفلنا تصميم محتوى الزر هنا]
                .padding(.horizontal, 24)
                .padding(.bottom, 30)
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

