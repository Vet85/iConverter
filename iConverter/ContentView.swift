//created by Vitaliy Novichenko on 15.08.2023.
//

import SwiftUI

struct ContentView: View {
    // test git
    @State private var inputValue: Double = 0 //picker
    @State private var outputValue = ""//text
    @State private var inputSelectedMeasurement = ""//segmented
    @State private var outputSelectedMeasurement = ""//segmented
    
    @FocusState private var amountIsFocused : Bool
    
    let measurement = ["Celsius", "Fahrengeit", "Kelvin"]
    
    var result: Double {
        var input: Double = inputValue
        var output: Double = 0
        switch inputSelectedMeasurement {
        case "Celsius":
            input = inputValue
        case "Fahrengeit":
            input = (inputValue - 32 ) * 5 / 9
        case "Kelvin":
            input = inputValue + 273.15
        default:
            input = inputValue
        }
        switch outputSelectedMeasurement {
        case "Celsius":
            output = input
        case "Fahrengeit":
            output = (input * 9 / 5) + 32
        case "Kelvin":
            output = input - 273.15
        default:
            output = input
        }
        return output
        }
       // return 0
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Input value", value: $inputValue, format: .number)
                        .keyboardType(.numberPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Input Value")
                }
                Section {
                    Picker("Selected measurement", selection: $inputSelectedMeasurement) {
                        ForEach(measurement, id:\.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Picker("Selected measurement", selection: $outputSelectedMeasurement) {
                        ForEach(measurement, id:\.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("FROM")
                } footer: {
                    Text("IN")
                }
                Section {
                    Text(result, format:.number)
                } header: {
                    Text("\("from" + inputSelectedMeasurement)  \("in" + outputSelectedMeasurement)")
                }
            }
            
            .navigationTitle("iConverter")
            
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
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
