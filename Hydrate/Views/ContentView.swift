import SwiftUI

// MARK: - Model
struct HydrationModel {
    var bodyWeight: Double = 0.0
    
    // Calculate water intake based on body weight
    func calculateWaterIntake() -> Double {
        return bodyWeight * 0.03 // Formula: Body weight * 0.03 = water intake in liters
    }
}

// MARK: - ViewModel
class HydrationViewModel: ObservableObject {
    @Published var bodyWeightString: String = ""
    
    var hydrationModel: HydrationModel {
        HydrationModel(bodyWeight: calculateWeight())
    }
    
    // Convert string to double for body weight
    func calculateWeight() -> Double {
        return Double(bodyWeightString) ?? 0.0
    }
    
    // Calculate water intake using the model
    func waterIntake() -> Double {
        return hydrationModel.calculateWaterIntake()
    }
}

// MARK: - View
struct ContentView: View {
    @StateObject private var viewModel = HydrationViewModel() // Use StateObject for the ViewModel

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Image("Hydrate")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    
                    Text("Hydrate")
                        .font(.title)
                        .bold()
                    
                    Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated.")
                        .foregroundStyle(.secondary)
                }
                .padding()
                
                // Body Weight Input
                HStack {
                    Text("Body weight")
                        .padding(.leading, 5)
                    
                    TextField("Value", text: $viewModel.bodyWeightString)
                        .keyboardType(.decimalPad) // Ensure it's numeric input
                        .padding(.trailing, 10)
                        .onAppear {
                            UITextField.appearance().clearButtonMode = .always
                        }
                }
                .frame(width: 370, height: 44)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
                
                Spacer().frame(height: 200) // Create space below the TextField
                
                // Navigation to Water Intake page with calculated water intake
                NavigationLink(destination: Onboarding02(initialWaterIntake: 1.5)) {
                    Text("Next")
                        .foregroundColor(.white)
                        .frame(width: 365, height: 50)
                        .background(Color.C_1) // Replace with .C_1 if defined
                        .cornerRadius(10)
                }
                .padding()
                .disabled(viewModel.waterIntake() == 0) // Disable if no valid weight is entered
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true) 
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        Onboarding02(initialWaterIntake: 1.5)
        WaterIntake(weight: 70, waterIntake: 1.5)
        
    }
}
