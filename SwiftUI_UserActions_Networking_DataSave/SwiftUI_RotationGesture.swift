//
//  SwiftUI_RotationGesture.swift
//  SwiftUI_UserActions_Networking_DataSave
//
//  Created by rajasekhar pidikiti on 27/06/24.
//

import SwiftUI

struct SwiftUI_RotationGesture: View {
    @State private var angleInDegeres =  Angle(degrees: 0)
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .foregroundStyle(.green)
            .padding()
            .background(Color.black.cornerRadius(10))
            .rotationEffect(angleInDegeres)
            .gesture(
                RotationGesture()
                    .onChanged(
                        { angle in
                            angleInDegeres = angle
                        }
                    )
                    .onEnded(
                        { endAngle in
                            withAnimation (.spring) {
                                angleInDegeres =  Angle(degrees: 0)
                            }
                        }
                    )
            )
    }
}

#Preview {
    SwiftUI_RotationGesture()
}
