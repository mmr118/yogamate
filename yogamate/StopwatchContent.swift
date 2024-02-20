//
//  StopwatchContent.swift
//  yogamate
//
//  Created by Monica Rondón on 2/5/24.
//  


import SwiftUI

// https://www.youtube.com/watch?v=YSqaTv1mdWA

struct StopwatchContent: View {

    @State var isTimerRunning = false
    @State var timeValue = 0.0
    @State var timer  = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {

            Text(String(format: "%.1f", self.timeValue) + "s")
                .font(.system(size: 60))
                .bold()
                .frame(width: 220, height: 220)
                .background(Circle().fill(Color.white).shadow(radius: 10))
                .onReceive(timer) { time in
                    if isTimerRunning {
                        timeValue += 0.1
                    }
                }

            HStack(spacing: 25) {

                // back 60s
                controlButton("gobackward.60") {
                    timeValue -= 1 // 60s
                }

                // play
                controlButton("play.circle.fill") {
                    timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
                    isTimerRunning = true
                }

                // pause
                controlButton("pause.circle.fill") {
                    timer.upstream.connect().cancel()
                    isTimerRunning = false
                }

                // forward 60s
                controlButton("goforward.60") {
                    timeValue += 1 // 60s
                }

            }

        }
    }

    @ViewBuilder private func controlButton(_ imageName: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
        }

    }


}

#Preview {
    StopwatchContent()
}
