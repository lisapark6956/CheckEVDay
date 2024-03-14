//
//  RegisterView.swift
//  CheckEVDay
//
//  Created by 정은 on 3/14/24.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "계정 등록",
                       subtitle: "할일을 정리해 봐요",
                       angle: -15,
                       background: .pink)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
