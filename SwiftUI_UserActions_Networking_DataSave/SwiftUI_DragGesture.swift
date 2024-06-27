//
//  SwiftUI_DragGesture.swift
//  SwiftUI_UserActions_Networking_DataSave
//
//  Created by rajasekhar pidikiti on 27/06/24.
//

import SwiftUI

struct SwiftUI_DragGesture: View {
    
    @State private var offset: CGSize = .zero
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ZStack {
            
            VStack {
                Text("Offset : \(offset.width)")
                Spacer()
            }
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 300 ,height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: rotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged
                    { dragValue in
                        withAnimation (.spring()) {
                            offset = dragValue.translation
                        }
                        
                    }
                        .onEnded
                    { dragEndedValue in
                        withAnimation (.spring()) {
                            offset = .zero
                        }
                    }
            )
        }
    }
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func rotationAmount() -> Double {
        let max = UIScreen.main.bounds.size.width/2
        let currentAmount = offset.width
        let persentage = currentAmount / max
        let peraAgeAsDouble = Double(persentage)
        let maxAngle: Double = 10
        return peraAgeAsDouble * maxAngle
    }
}

#Preview {
    SwiftUI_DragGesture()
}
