//
//  TimerContent.swift
//  yogamate
//
//  Created by Monica Rondón on 2/6/24.
//  


import SwiftUI

struct TimerContent: View {

    @State var hourValue = 0
    @State var minuteValue = 0
    @State var secondVslue = 0

    @State var 

    var body: some View {

        VStack {

            HStack {
                valuePicker("hr", count: $hourValue, max: 24)
                valuePicker("min", count: $minuteValue, max: 59)
                valuePicker("sec", count: $secondVslue, max: 59)
            }

            LabeledContent("HR", value: hourValue, format: .number)
            LabeledContent("MIN", value: minuteValue, format: .number)
            LabeledContent("SEC", value: secondVslue, format: .number)

            Button("Start") {

            }
            .buttonStyle(.borderedProminent)


        }
        .padding()

    }

    @ViewBuilder func valuePicker(_ title: String, count: Binding<Int>, max: Int) -> some View {
        HStack {
            Picker(title, selection: count) {
                ForEach(0..<max) { value in
                    Text(value, format: .number)
                        .tag(value)
                }
            }
            .pickerStyle(.wheel)
            .labelsHidden()

            Text(title)

        }
    }

}


// MARK: - Previews
#Preview {
    TimerContent()
}
