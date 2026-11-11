import SwiftUI

struct Startpage: View {
    var body: some View {
        
        //عشان يحط العناصر فوق بعض كطبقات
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            
            //يلصق العناصر باليسار، وهذا اللي يخلي “My    المسافة صفر عشان اتحكم فيها انا-Plants” في الزاوية
            VStack (alignment: .leading, spacing: 0){
                
                
                // الهيدر
                
                Text("My Plants🌱")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.leading,14)
                    .padding(.top,16)
                
                
                // الخط الفاصل
                Divider()
                    .background(Color.primary)
                    .padding(.leading,14)
                    .padding(.top,16)
                
                
                VStack(spacing: 0) {
                    // الصورة
                    
                    Image("Myplant")
                        .resizable()
                        .scaledToFit()
                        .frame(width:200,height: 200)
                        .padding(.top,70)
                    //padding المسافة بين الخط والصورة
                    
                    
                    // النصوص تحت الصورة
                    Text("Start your plant journey!")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.primary)
                        .padding(.top,20)
                    
                    Text("Now all your plants will be in one place and\nwe will help you take care of them :) 🪴")
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.top,20)
                        .padding(.horizontal,30)
                    
                }
                .frame(maxWidth: .infinity)
                // مسافة ترفع لي الكلام
                Spacer()
                
                
                // الزر
                Button{
                    // اجراء الزر
                } label: {
                    
                    Text("Set Plant Reminder")
                        .font(.system(size: 17, weight: .medium))                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 38)
                }
                .buttonStyle(.glassProminent)
                .tint(Color(red: 0.25, green: 0.45, blue: 0.37))
                .padding(.horizontal, 67)
                .padding(.top, 95)
                
                Spacer()
            }
            
        }
        .preferredColorScheme(.dark)
    }
}


















#Preview {
    Startpage()
}
//
//  Created by Norah Bindokhi on 29/05/1448 AH.
//

