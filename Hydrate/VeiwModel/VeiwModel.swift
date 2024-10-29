////
////  VeiwModel.swift
////  Hydrate
////
////  Created by Sumaih on 25/04/1446 AH.
////
//
//import SwiftUI
//import Combine
//
//class HydrationViewModel: ObservableObject {
//    @Published var hydrationData = HydrationData()
//
//    func calculateProgress() -> Int {
//        guard hydrationData.goal > 0 else {
//            print("Goal is zero or invalid.")
//            return 0
//        }
//        return Int((hydrationData.waterIntake / hydrationData.goal) * 100)
//    }
//}
//
//
//
//
