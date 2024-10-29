import SwiftUI
struct WaterIntake: View {
    @State private var waterIntake: Double
    @State private var progressValue: Double = 0
    var weight: Double
    var goal: Double { weight * 0.03 }
    
    init(weight: Double, waterIntake: Double) {
        self.weight = weight
        self._waterIntake = State(initialValue: waterIntake)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Today's Water Intake")
                .font(.headline)
            
            Text(String(format: "%.2f liter / %.2f liter", waterIntake, goal))
                .font(.title2)
                .bold()
            
            // Progress Circle and Stepper
            ProgressCircleView(
                progress: .constant(Int((waterIntake / goal) * 100)),
                goal: 100,
                baseColor: .gray,
                progressColor: .C_1
            )
            .padding()
            VStack {
                Text("\(String(format: "%.2f L", waterIntake))")
                    .font(.title2)
                    .bold()
                    .padding(.leading, 30.0)
                
                Stepper(value: $waterIntake, in: 0...goal, step: 0.1) {
                    
                }
                
                .padding()
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true) 
    }
}

// MARK: - Previews
struct Onboarding02_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding02(initialWaterIntake: 1.5)
        WaterIntake(weight: 70, waterIntake: 1.5) // Pass user weight directly
    }
}
