////
////  Time Picker.swift
////  Hydrate
////
////  Created by Sumaih on 18/04/1446 AH.
////
//import SwiftUI
//
//struct TimerPicker: View {
//    @State private var showPicker = false
//    @State private var selectedHour = 0
//    @State private var selectedMinute = 0
//    @State private var isAM = true
//
//    var body: some View {
//        HStack{
//            Button(action: { showPicker.toggle() }) {
//                Text("\(selectedHour):\(String(format: "%02d", selectedMinute))")
//                    .multilineTextAlignment(.trailing)
//                    .padding()
//                    .frame(width: 80, height: 34)
//                    .background(Color.T_1)
//                    .foregroundColor(.black)
//                    .cornerRadius(10)
//                    //.padding(.leading, 20)
//                
//            }
//            .sheet(isPresented: $showPicker) {
//                TimerPickerModal(selectedHour: $selectedHour, selectedMinute: $selectedMinute , isAM: $isAM)
//            }
//            //.padding()
//            Picker("AM/PM", selection: $isAM) {
//                Text("AM").tag(true)
//                Text("PM").tag(false)
//            }
//            .pickerStyle(SegmentedPickerStyle())
//            .frame(width: 100, height: 34)
//            //.padding()
//        }
//    }
//}
//
//struct TimerPickerModal: View {
//    @Binding var selectedHour: Int
//    @Binding var selectedMinute: Int
//    @Binding var isAM: Bool
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .trailing, spacing: 0) {
//                HStack {
//                    Picker("Hours", selection: $selectedHour) {
//                        ForEach(1..<13) { Text("\($0)").tag($0) }
//                    }
//                    .pickerStyle(WheelPickerStyle())
//                    .frame(width: 70)
//
//                    Text(":").font(.largeTitle)
//
//                    Picker("Minutes", selection: $selectedMinute) {
//                        ForEach(0..<60) { Text(String(format: "%02d", $0)).tag($0) }
//                    }
//                    .pickerStyle(WheelPickerStyle())
//                    .frame(width: 100)
//                }
//        
//               
//
//              
//            }
//            .navigationTitle("Select Time")
//            .navigationBarItems(trailing: Button("Done") { dismiss() })
//        }
//    }
//}
//
//struct TimerPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerPicker()
//    }
//}
