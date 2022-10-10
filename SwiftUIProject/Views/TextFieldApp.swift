//
//  TextFieldApp.swift
//  SwiftUIProject
//
//  Created by Nebo on 11.10.2022.
//

import SwiftUI

struct TextFieldApp: View {
    
    @State var text = ""
    @State var text2 = ""
    @FocusState var isFocuseTextField: Bool
    
    var body: some View {
        VStack {
            TextField("Введите текст", text: $text)
                .modifier(TextFiewldModifier())
                .focused($isFocuseTextField)
            TextField("Введите еще текст", text: $text2) { isChanget in
                print(isChanget)
            } onCommit: {
                print("onCommit")
            }
            .modifier(TextFiewldModifier())
            .focused($isFocuseTextField)

            Button("Hide Keyboard") {
                // iOS < 15
//                hideKeyboard()
                // iOs > 15
                isFocuseTextField = false
            }
        }
    }
}

extension View {
    // iOS < 15
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TextFiewldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .foregroundColor(Color.green)
            .font(.system(size: 12))
            .keyboardType(.emailAddress)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.red)
            )
            .padding(.horizontal, 12)
    }
}

struct TextFieldApp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldApp()
    }
}
