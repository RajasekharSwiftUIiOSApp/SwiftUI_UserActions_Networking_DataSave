//
//  SwiftUI_MagnificationGesture.swift
//  SwiftUI_UserActions_Networking_DataSave
//
//  Created by rajasekhar pidikiti on 27/06/24.
//

import SwiftUI

struct SwiftUI_MagnificationGesture: View {
    
    @State private var value: CGFloat = 0
    @State private var endValue: CGFloat = 0
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.title)
            .padding()
            .background(Color.green.cornerRadius(10))
            .scaleEffect(value+1+endValue)
            .gesture(
//                
//                MagnifyGesture().onChanged({ va
//    in
//                    <#code#>
//                })
                MagnifyGesture()
                    .onChanged(
                        { onChangedValue in
                            value = onChangedValue.magnification - 1
                        }
                    )
                    .onEnded(
                        { onChangedValue in
                         endValue +=  value
                            value = 0
                            
                            //onChangedValue.magnification
                        }
                    )
            )
    }
}

#Preview {
    SwiftUI_MagnificationGesture()
}
