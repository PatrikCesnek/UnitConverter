//
//  TemperatureConverterViewModel.swift
//  UnitConverter
//
//  Created by Patrik Cesnek on 12/01/2024.
//

import Foundation

class TemperatureConverterViewModel: ObservableObject {
    var units = ["C°", "F°", "K"]
    
    @Published var selectedInputIndex = 0
    @Published var selectedGoalIndex = 1
    @Published var inputTemperature = ""
    
    var endTemperature: Double {
        let convertedInput = Double(inputTemperature)
        return getUnits(
            firstUnit: selectedInputIndex,
            secondUnit: selectedGoalIndex,
            inputNumber: convertedInput
        )
    }
    
    private func celziusToFarenheit(_ celzius: Double?) -> Double {
        guard let celzius = celzius else {
            return 0
        }
        return (9/5 * celzius) + 32
    }
    
    private func celziusToKelvin(_ celzius: Double?) -> Double {
        guard let celzius = celzius else {
            return 0
        }
        return celzius + 273.15
    }
    
    private func farenheitToCelzius(_ farenheit: Double?) -> Double {
        guard let farenheit = farenheit else { return 0}
        return (farenheit - 32) * 5/9
    }
    
    private func farenheitToKelvin(_ farenheit: Double?) -> Double {
        guard let farenheit = farenheit else { return 0}
        return (farenheit - 32) * 5 / 9 + 273.15
    }
    
    private func kelvinToCelzius(_ kelvin: Double?) -> Double {
        guard let kelvin = kelvin else { return 0}
        return kelvin - 273.15
    }
    
    private func kelvinToFarenheit(_ kelvin: Double?) -> Double {
        guard let kelvin = kelvin else { return 0}
        return (kelvin - 273.15) * 9 / 5 + 32
    }
    
    private func getUnits(firstUnit: Int, secondUnit: Int, inputNumber: Double?) -> Double {
        switch (firstUnit, secondUnit) {
        case (0, 1):
            celziusToFarenheit(inputNumber)
        case (0, 2):
            celziusToKelvin(inputNumber)
        case (1, 0):
            farenheitToCelzius(inputNumber)
        case (1, 2):
            farenheitToKelvin(inputNumber)
        case (2, 0):
            kelvinToCelzius(inputNumber)
        case (2, 1):
            kelvinToFarenheit(inputNumber)
        default:
            inputNumber ?? 0
        }
    }
}
