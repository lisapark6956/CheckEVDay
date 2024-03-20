//
//  NewitemView.swift
//  CheckEVDay
//
//  Created by 정은 on 3/14/24.
//

import SwiftUI

struct NewitemView: View {
    @StateObject var viewModel = NewitemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("할일 하나 올리고")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                // Title
                TextField("할일", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("일정", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TLButton(title: "저장",
                         background: .purple
                ) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("에러"),
                      message: Text("내용을 전부 채우거나 오늘, 오늘 이후의 날짜를 선택해주세요"))
            }
        }
    }
}

#Preview {
    NewitemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
