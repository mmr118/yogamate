//
//  TimerContent.swift
//  yogamate
//
//  Created by Monica Rondón on 2/6/24.
//  


import SwiftUI

struct TimerContent: View {

    static let increment = 0.01

    @State var hourValue = 0
    @State var minuteValue = 0
    @State var secondValue = 10

    @State var duration: Duration = .zero
    @State var isTimerRunning = false
    @State var timer = Timer.publish(every: Self.increment, on: .main, in: .common).autoconnect()

    var body: some View {

        VStack {

            if isTimerRunning {
                countDownView()
            } else {

                HStack {
                    valuePicker("hr", count: $hourValue, max: 24)
                    valuePicker("min", count: $minuteValue, max: 59)
                    valuePicker("sec", count: $secondValue, max: 59)
                }
                .padding()
                .border(.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

            }

            Button("Start") {
                handleStart()
            }
            .buttonStyle(.borderedProminent)
            .disabled(isTimerRunning == true)

        }
        .padding()

    }

    @ViewBuilder func valuePicker(_ title: String, count: Binding<Int>, max: Int) -> some View {
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

    @ViewBuilder private func countDownView() -> some View {
        Text(duration.formatted(.time(pattern: .hourMinuteSecond(padHourToLength: 00, fractionalSecondsLength: 2))))
            .onReceive(timer) { timer in
                if duration > .zero {
                    duration -= .seconds(Self.increment)
                } else {
                    isTimerRunning = false
                }
            }
    }

    private func handleStart() {
        duration = .seconds((hourValue * 3600) + (minuteValue * 60) + secondValue)
        timer = Timer.publish(every: Self.increment, on: .main, in: .common).autoconnect()
        isTimerRunning = true
    }

    private func createDuration() {

    }

}


// MARK: - Previews
#Preview {
    TimerContent()
}
