//
//  TemperatureConverterView.swift
//  UnitConverter
//
//  Created by Patrik Cesnek on 12/01/2024.
//

import SwiftUI

struct TemperatureConverterView: View {
    @ObservedObject var viewModel: TemperatureConverterViewModel
    @FocusState private var ammountIsFocused: Bool
    
    var body: some View {
        VStack {
            Form {
                Section("Enter temperature and unit") {
                    HStack {
                        TextField("Enter temperature", text: $viewModel.inputTemperature)
                            .keyboardType(.decimalPad)
                            .focused($ammountIsFocused)

                        Text(viewModel.units[viewModel.selectedInputIndex])
                    }
                    Picker("Select Unit", selection: $viewModel.selectedInputIndex) {
                        ForEach(0..<viewModel.units.count, id: \.self) { index in
                            Text(viewModel.units[index])
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Select unit and look at result") {
                    Picker("Select Unit", selection: $viewModel.selectedGoalIndex) {
                        ForEach(0..<viewModel.units.count, id: \.self) { index in
                            Text(viewModel.units[index])
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("\(viewModel.endTemperature, format: .number) \(viewModel.units[viewModel.selectedGoalIndex])")
                }
            }
        }
        .navigationTitle("Temperature Converter")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if ammountIsFocused {
                Button("Done") {
                    ammountIsFocused = false
                }
            }
        }
    }
}

#Preview {
    TemperatureConverterView(viewModel: TemperatureConverterViewModel())
}
