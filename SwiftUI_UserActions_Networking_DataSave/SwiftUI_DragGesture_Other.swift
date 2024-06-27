//
//  SwiftUI_DragGesture_Other.swift
//  SwiftUI_UserActions_Networking_DataSave
//
//  Created by rajasekhar pidikiti on 27/06/24.
//

import SwiftUI

struct SwiftUI_DragGesture_Other: View {
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = 0
    @State var endDragOffsetY: CGFloat = 0
    var body: some View {

        ZStack {
            Color.green.ignoresSafeArea()
            
            SignUPView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endDragOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring()){
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded{ value in
                            
                            withAnimation(.spring()) {
                                if currentDragOffsetY < -150 {
                                    endDragOffsetY = -startingOffsetY
                                    currentDragOffsetY = 0
                                } else if  currentDragOffsetY != 0 && currentDragOffsetY > 150 {
                                    endDragOffsetY = 0
                                    currentDragOffsetY = 0
                                } else {
                                    currentDragOffsetY = 0
                                }
                            }
                        }
                )
        }.ignoresSafeArea(edges: .bottom)
        
    }
}

#Preview {
    SwiftUI_DragGesture_Other()
}

struct SignUPView: View {
    
    var body: some View {
        VStack (spacing: 15) {
            Image(systemName: "chevron.up").padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.bold)
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("Hi everyone this is raja sekhar learning and SwiftUI with you all, We can use this series of videos to gain intermediate knowledge".uppercased()).padding().multilineTextAlignment(.center)
            
            Text("Create An Account")
                .foregroundStyle(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(10))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
    }
}
