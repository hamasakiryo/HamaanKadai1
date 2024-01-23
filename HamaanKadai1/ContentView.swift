//
//  ContentView.swift
//  HamaanKadai1
//
//  Created by 浜崎良 on 2024/01/22.
//



import SwiftUI

struct ContentView: View {
    @State private var num1 = ""
    @State private var num2 = ""
    @State private var num3 = ""
    @State private var num4 = ""
    @State private var num5 = ""
    @State private var labelText = "Label"
    
    var body: some View {
        VStack {
            TextField("", text: $num1)
                .textFieldModifier()
            TextField("", text: $num2)
                .textFieldModifier()
            TextField("", text: $num3)
                .textFieldModifier()
            TextField("", text: $num4)
                .textFieldModifier()
            TextField("", text: $num5)
                .textFieldModifier()

            Button("Button") {
                let nums = [num1, num2, num3 ,num4, num5]
                
                let total = nums.map { Int($0) ?? 0 }.reduce(0, +)

                labelText = String(total)
            }
            .padding()
            Text(labelText)
        }
    }
}

struct TextfieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .frame(width: 100)
            .keyboardType(.numberPad)
    }
}

extension View {
    func textFieldModifier() -> some View {
        modifier(TextfieldModifier())
    }
}
//正直、'body()'や'textFieldModifier()'メソッドの内部的な理解はできていない。
//'ViewModifier'は同じモディファイアが重複するとコードが冗長になるため、それを解消するために使うといった表面的な理解しかできていない。

#Preview {
    ContentView()
}
