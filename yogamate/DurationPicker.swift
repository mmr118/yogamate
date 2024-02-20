//
//  DurationPicker.swift
//  yogamate
//
//  Created by Monica Rondón on 20.02.24.
//  


import SwiftUI

struct DurationPicker: View {

    @Binding var selection: Duration

    @State var hourValue = 0
    @State var minuteValue = 0
    @State var secondValue = 0

    var body: some View {
        HStack {
            valuePicker("hr", count: $hourValue, max: 24)
            valuePicker("min", count: $minuteValue, max: 59)
            valuePicker("sec", count: $secondValue, max: 59)
        }
        .onChange(of: hourValue, updateSelection)
        .onChange(of: minuteValue, updateSelection)
        .onChange(of: secondValue, updateSelection)
    }

    @ViewBuilder private func valuePicker(_ title: String, count: Binding<Int>, max: Int) -> some View {
        HStack {
            Picker(title, selection: count) {
                ForEach(Array(0...max), id: \.self) { value in
                    Text(value, format: .number)
                        .tag(value)
                }
            }
            .pickerStyle(.wheel)
            .labelsHidden()

            Text(title)
        }
    }

    private func updateSelection() {
        selection = .seconds((hourValue * 3600) + (minuteValue * 60) + secondValue)
    }

}


// MARK: - Previews
#Preview {

    PreviewContent()

}


struct PreviewContent: View {

    @State var duration: Duration = .zero

    var body: some View {

        VStack {

            Text(duration, format: .time(pattern: .hourMinuteSecond))

            DurationPicker(selection: $duration)
        }

    }

}
