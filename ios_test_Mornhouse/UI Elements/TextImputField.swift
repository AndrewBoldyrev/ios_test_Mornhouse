//
//  TextImput.swift
//  ios_test_Mornhouse
//
//  Created by Andrew Boldyrev on 20.12.2022.
//

import Foundation
import SwiftUI

struct TextInputField: View {
    let placeHolder: String
    @Binding var textValue: String
    
    var body: some View {
        ZStack(alignment: .center) {
            Text(placeHolder)
                .foregroundColor(Color(.placeholderText))
                .offset(y: textValue.isEmpty ? 0 : -25)
                .scaleEffect(textValue.isEmpty ? 1: 0.8, anchor: .leading)
                .multilineTextAlignment(.center)
            TextField("", text: $textValue)
        }
        .padding(.top, textValue.isEmpty ? 0 : 15)
        .frame(height: 52)
        .padding(.horizontal, 16)
     //   .overlay(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1).foregroundColor(.gray))
        .animation(.default)
    }
}
