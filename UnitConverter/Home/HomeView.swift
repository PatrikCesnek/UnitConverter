//
//  ContentView.swift
//  UnitConverter
//
//  Created by Patrik Cesnek on 12/01/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        NavigationLink(
                            "Temperature",
                            destination: { TemperatureConverterView(viewModel: viewModel.viewModels[0]) }
                        )
                        NavigationLink(
                            "Length",
                            destination: { Text("Length") }
                        )
                        NavigationLink(
                            "Time",
                            destination: { Text("Time") }
                        )
                        NavigationLink(
                            "Volume",
                            destination: { Text("Volume") }
                        )
                        
                    }
                    .font(.title)
                    
                    Spacer()
                }
                
                Spacer()
            }
            .navigationTitle("Unit Converter")
            .padding()
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
