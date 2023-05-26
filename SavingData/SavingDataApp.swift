//
//  SavingDataApp.swift
//  SavingData
//
//  Created by David Okun on 5/15/23.
//

import SwiftUI

@main
struct SavingDataApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView(viewModel: ViewModel(container: UserDefaults.standard))
//            ContentView(viewModel: ViewModel())
        }
    }
}
