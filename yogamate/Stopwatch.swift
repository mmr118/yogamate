//
//  Stopwatch.swift
//  yogamate
//
//  Created by Monica Rondón on 2/5/24.
//  


import SwiftUI

// https://www.youtube.com/watch?v=YSqaTv1mdWA

struct Stopwatch: View {

    @State var isTimerRunning = false
    @State var timeCount = 0.0
    @State var timer  = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {

            Text(String(format: "%.1f", self.timeCount) + "s")
                .font(.system(size: 60))
                .bold()
                .frame(width: 220, height: 220)
                .background(Circle().fill(Color.white).shadow(radius: 10))

            HStack(spacing: 25) {

                buttonImage(name: "gobackward.60")
                buttonImage(name: "play.circle.fill")
                buttonImage(name: "pause.circle.fill")
                buttonImage(name: "goforward.60")


            }

        }
    }

    @ViewBuilder private func buttonImage(name: String) -> some View {
        Image(systemName: name)
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)

    }


}

#Preview {
    Stopwatch()
}
