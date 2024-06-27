//
//  SwiftUI_LongpressGester.swift
//  SwiftUI_UserActions_Networking_DataSave
//
//  Created by rajasekhar pidikiti on 27/06/24.
//

import SwiftUI

struct SwiftUI_LongpressGester: View {
    //@State private var isComplete: Bool = false
    @State private var isPressingProgewss: Bool = false
    @State private var isDone: Bool = false
    
    
//    var gestureText: some View {
//        Text(isComplete ? "Hi There" : "Hey Here")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : Color.orange)
//            .cornerRadius(10)
//            .onTapGesture {
//                isComplete.toggle()
//            }
//            
//
//    }
    
    var body: some View {
       // gestureText.font(.title).frame(maxWidth: .infinity).background(.gray).cornerRadius(10)
        VStack {
            
            Rectangle()
                .fill(isDone ? Color.green : Color.blue)
                .frame(maxWidth: isPressingProgewss ? .infinity : 10)
                .frame(height: 55)
                .frame(height: 100)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            
            HStack {
                
                Text("Tap Here")
                    .foregroundColor(.blue)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 10) {
                        withAnimation(.easeInOut) {
                            isDone = true
                        }
                    } onPressingChanged: { isPressing in
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isPressingProgewss = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline:.now() + 0.001) {
                                if !isDone {
                                    //withAnimation(.easeOut(duration: 1.0)) {
                                        isPressingProgewss = false
                                    //}
                                }
                            }
                            
                        }
                    }
                
                Text("Reset")
                    .foregroundColor(.blue)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isPressingProgewss = false
                        isDone = false
                    }
            }
            
        }
    }
}

#Preview {
    SwiftUI_LongpressGester()
}
