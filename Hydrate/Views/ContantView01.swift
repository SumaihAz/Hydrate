//
//  ContantView.swift
//  Hydrate
//
//  Created by Sumaih on 19/04/1446 AH.
//

import SwiftUI

struct ContentView01: View {
    @Binding var selected: Int? // This should be a binding

    let minIntervals = [15, 30, 60, 90]
    let hourIntervals = [2, 3, 4, 5]

    var body: some View {
        VStack(spacing: 20) {
            intervalButtons(for: minIntervals, label: "Mins")
            intervalButtons(for: hourIntervals, label: "Hours")
        }
        .padding()
    }

    private func intervalButtons(for intervals: [Int], label: String) -> some View {
        HStack(spacing: 20) {
            ForEach(intervals, id: \.self) { interval in
                Button(action: { selected = interval }) {
                    VStack {
                        Text("\(interval)")
                            .foregroundColor(selected == interval ? .white : .C_1)
                        Text(label)
                    }
                    .frame(width: 77, height: 70)
                    .background(selected == interval ? Color.C_1 : Color.babyGray)
                    .foregroundColor(selected == interval ? .white : .black)
                    .cornerRadius(10)
                }
            }
        }
    }
}


struct ContentView01_Previews: PreviewProvider {
    @State static var selected: Int? = nil // Create a dummy state variable

    static var previews: some View {
        ContentView01(selected: $selected) // Pass the binding
    }
}
