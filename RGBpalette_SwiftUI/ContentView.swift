//
//  ContentView.swift
//  RGBpalette_SwiftUI
//
//  Created by Artem Sulzhenko on 11.10.2022.
//

import SwiftUI


struct ContentView: View {
    @State private var redValue: Double = 0
    @State private var greenValue: Double = 0
    @State private var blueValue: Double = 0
    
    @State private var textRedValue = ""
    @State private var textGreenValue = ""
    @State private var textBlueValue = ""
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        
        VStack {
            Rectangle()
                .frame(width: 370.0, height: 250.0)
                .cornerRadius(15)
                .foregroundColor(Color(red: redValue,
                                       green: greenValue,
                                       blue: blueValue))
            //Red Value
            HStack{
                Text(" Red:     \(redValue, specifier: "%.2f") ")
                
                Slider(value: $redValue, in: 0...1)
                    .onChange(of: redValue) { newValue in
                        let formattedDouble = String(format: "%.2f", newValue)
                        textRedValue = "\(formattedDouble)"
                    }
                
                ZStack(alignment: .leading){
                    if textRedValue.isEmpty {
                        Text("\(redValue, specifier: "%.2f")")
                            .foregroundColor(Color.black)
                    }
                    TextField("", text: $textRedValue)
                        .frame(width: 35.0)
                        .foregroundColor(Color.black)
                        .keyboardType(.decimalPad)
                        .onSubmit {
                            guard textRedValue.isEmpty == false else { return }
                            if Double(textRedValue) != nil {
                                redValue = Double(textRedValue)!
                                let formattedDouble = String(format: "%.2f", redValue)
                                textRedValue = formattedDouble
                            }
                        }
                }
            }
            //Green Value
            HStack{
                Text(" Green:  \(greenValue, specifier: "%.2f")")
                
                Slider(value: $greenValue, in: 0...1)
                    .onChange(of: greenValue) { newValue in
                        let formattedDouble = String(format: "%.2f", newValue)
                        textGreenValue = "\(formattedDouble)"
                    }
                
                ZStack(alignment: .leading){
                    if textGreenValue.isEmpty {
                        Text("\(greenValue, specifier: "%.2f")")
                            .foregroundColor(Color.black)
                    }
                    TextField("", text: $textGreenValue)
                        .frame(width: 35.0)
                        .foregroundColor(Color.black)
                        .keyboardType(.decimalPad)
                        .onSubmit {
                            guard textGreenValue.isEmpty == false else { return }
                            if Double(textGreenValue) != nil {
                                greenValue = Double(textGreenValue)!
                                let formattedDouble = String(format: "%.2f", greenValue)
                                textGreenValue = formattedDouble
                            }
                        }
                }
            }
            //Blue Value
            HStack{
                Text(" Blue:     \(blueValue, specifier: "%.2f")")
                
                Slider(value: $blueValue, in: 0...1)
                    .onChange(of: blueValue) { newValue in
                        let formattedDouble = String(format: "%.2f", newValue)
                        textBlueValue = "\(formattedDouble)"
                    }
                
                ZStack(alignment: .leading){
                    if textBlueValue.isEmpty {
                        Text("\(blueValue, specifier: "%.2f")")
                            .foregroundColor(Color.black)
                    }
                    TextField("\(blueValue, specifier: "%.2f")", text: $textBlueValue)
                        .frame(width: 35.0)
                        .foregroundColor(Color.black)
                        .keyboardType(.decimalPad)
                        .onSubmit {
                            guard textBlueValue.isEmpty == false else { return }
                            if Double(textBlueValue) != nil {
                                blueValue = Double(textBlueValue)!
                                let formattedDouble = String(format: "%.2f", blueValue)
                                textBlueValue = formattedDouble
                            }
                        }
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.mint)
        .focused($isInputActive)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isInputActive = false
                    guard textRedValue.isEmpty == false else { return }
                    if Double(textRedValue) != nil {
                        redValue = Double(textRedValue)!
                        let formattedDouble = String(format: "%.2f", redValue)
                        textRedValue = formattedDouble
                    }
                    
                    guard textGreenValue.isEmpty == false else { return }
                    if Double(textGreenValue) != nil {
                        greenValue = Double(textGreenValue)!
                        let formattedDouble = String(format: "%.2f", greenValue)
                        textGreenValue = formattedDouble
                        
                        
                    }
                    guard textBlueValue.isEmpty == false else { return }
                    if Double(textBlueValue) != nil {
                        blueValue = Double(textBlueValue)!
                        let formattedDouble = String(format: "%.2f", blueValue)
                        textBlueValue = formattedDouble
                    }
                }
            }
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

