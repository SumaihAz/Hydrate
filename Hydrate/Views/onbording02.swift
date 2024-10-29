import SwiftUI

// MARK: - TimerPicker
struct TimerPicker: View {
    @Binding var selectedHour: Int
    @Binding var selectedMinute: Int
    @Binding var isAM: Bool
    @State private var showPicker = false

    var body: some View {
        HStack {
            Button(action: { showPicker.toggle() }) {
                Text("\(selectedHour):\(String(format: "%02d", selectedMinute))")
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .frame(width: 80, height: 34)
                    .background(Color.T_1) // Replace with your defined color
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showPicker) {
                TimerPickerModal(selectedHour: $selectedHour, selectedMinute: $selectedMinute, isAM: $isAM)
            }
            Picker("AM/PM", selection: $isAM) {
                Text("AM").tag(true)
                Text("PM").tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 100, height: 34)
        }
    }
}

// MARK: - TimerPickerModal
struct TimerPickerModal: View {
    @Binding var selectedHour: Int
    @Binding var selectedMinute: Int
    @Binding var isAM: Bool
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack(alignment: .trailing, spacing: 0) {
                HStack {
                    Picker("Hours", selection: $selectedHour) {
                        ForEach(1..<13) { Text("\($0)").tag($0) }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 70)

                    Text(":").font(.largeTitle)

                    Picker("Minutes", selection: $selectedMinute) {
                        ForEach(0..<60) { Text(String(format: "%02d", $0)).tag($0) }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100)
                }
            }
            .navigationTitle("Select Time")
            .navigationBarItems(trailing: Button("Done") { dismiss() })
        }
    }
}

// MARK: - Onboarding02
struct Onboarding02: View {
    @State private var selected: Int?
    
    // TimerPicker state variables
    @State private var startHour = 0
    @State private var startMinute = 0
    @State private var startIsAM = true
    
    @State private var endHour = 0
    @State private var endMinute = 0
    @State private var endIsAM = true
    let initialWaterIntake: Double
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 5.0) {
                Text("Notification Preferences")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding([.top, .leading])
                
                Text("The start and end hour")
                    .font(.body)
                    .fontWeight(.bold)
                    .padding([.top, .leading])
                
                Text("Specify the start and end date to receive the notifications")
                    .foregroundStyle(.secondary)
                    .padding([.bottom, .leading])
                
                VStack {
                    HStack {
                        Text("Start hour")
                            .padding(.leading, 30)
                        Spacer()
                        TimerPicker(selectedHour: $startHour, selectedMinute: $startMinute, isAM: $startIsAM)
                            .padding(.trailing, 15)
                    }
                    .padding(-15)
                    .padding([.top, .trailing], 15.0)
                    
                    Divider()
                        .frame(width: 335)
                        .padding(.top, 20)
                    
                    HStack {
                        Text("End hour")
                            .padding(.leading, 30)
                        Spacer()
                        TimerPicker(selectedHour: $endHour, selectedMinute: $endMinute, isAM: $endIsAM)
                            .padding(.trailing, 15)
                    }
                    .padding(-15)
                    .padding([.top, .trailing], 15.0)
                }
                .frame(width: 360, height: 115)
                .background(Color.babyGray) // Replace with your defined color
                .padding()
                
                Text("Notification interval")
                    .font(.body)
                    .fontWeight(.bold)
                    .padding([.top, .leading])
                
                Text("How often would you like to receive notifications within the specified time interval?")
                    .foregroundStyle(.secondary)
                    .padding()
                
                VStack {
                    ContentView01(selected: $selected) // Assuming ContentView01 has a Binding for selected
                }
                
                Spacer()
                
                // Updated NavigationLink
                NavigationLink(destination: WaterIntake(weight: 70, waterIntake: 1.5)) {
                    Text("Start")
                        .frame(width: 370, height: 50)
                        .background(Color.C_1) // Replace with your defined color
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
                .disabled(selected == nil) // Disable button if no interval is selected
            }
            .navigationBarBackButtonHidden(true) 
            //.navigationTitle("Onboarding")
        }
    }
}


#Preview {
    Onboarding02(initialWaterIntake: 1.5)
}
