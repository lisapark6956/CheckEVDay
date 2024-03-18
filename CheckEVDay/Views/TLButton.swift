//
//  TLButton.swift
//  CheckEVDay
//
//  Created by 정은 on 3/18/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .bold()
                    .foregroundColor(Color.white)
            }
        }
        .padding()
    }
}

#Preview {
    TLButton(title: "Value",
             background: .purple) {
        //Action
    }
}
