//
//  TimerContent.swift
//  yogamate
//
//  Created by Monica Rondón on 2/6/24.
//  


import SwiftUI

struct TimerContent: View {

    @State var hourCount = 0
    @State var minuteCount = 0
    @State var secondCount = 0

    var body: some View {

        VStack {

            LabeledContent("HR", value: hourCount, format: .number)
            LabeledContent("MIN", value: minuteCount, format: .number)
            LabeledContent("SEC", value: secondCount, format: .number)

            HStack {
                valuePicker("hr", count: $hourCount, max: 24)
                valuePicker("min", count: $minuteCount, max: 59)
                valuePicker("sec", count: $secondCount, max: 59)

            }

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
