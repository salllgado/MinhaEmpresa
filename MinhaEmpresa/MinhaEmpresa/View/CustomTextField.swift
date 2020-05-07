//
//  CustomTextField.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 19/01/20.
//  Copyright © 2020 Chrystian Salgado. All rights reserved.
//

import SwiftUI

struct CustomTextField: View {
    
    let title: String
    let value: Binding<String>?
    
    @State private var isEditing: Bool = false
    @State private var editingValue: String = ""
    @State private var editingFormatterValue: String = ""
    
    init(title: String, value: Binding<String>?) {
        self.title = title
        self.value = value
    }
    
    var body: some View {
        TextField(title, text: Binding(get: {
            return self.editingValue
        }, set: { string in
            self.editingValue = string
            self.value?.wrappedValue = string
            
            if string.count == 14 {
                var charIndex = 0
                self.editingFormatterValue = ""
                
                string.forEach { (char) in
                    charIndex += 1
                    if (charIndex == 2) || (charIndex == 5) {
                        self.editingFormatterValue.append(char)
                        self.editingFormatterValue.append(".")
                    } else if (charIndex == 8) {
                        self.editingFormatterValue.append(char)
                        self.editingFormatterValue.append("/")
                    } else if (charIndex == 12) {
                        self.editingFormatterValue.append(char)
                        self.editingFormatterValue.append("-")
                    } else {
                        self.editingFormatterValue.append(char)
                    }
                }
                self.editingValue = self.editingFormatterValue
            }
        }), onCommit: {
            UIApplication.shared.endEditing()
        })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.numbersAndPunctuation)
    }
    
}

struct TestView: View {
    
    @State var value: String = ""
    
    var body: some View {
        VStack {
            CustomTextField(title: "CNPJ", value: $value)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    
    @State var value: String?
    
    static var previews: some View {
        CustomTextField(title: "11111111111111", value: nil)
    }
}
