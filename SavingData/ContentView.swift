//
//  ContentView.swift
//  SavingData
//
//  Created by David Okun on 5/15/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel
    @State var textFieldValue: String = ""
  
    var body: some View {
        VStack {
            Text(viewModel.savedString)
            TextField("Value", text: $textFieldValue)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button {
                viewModel.saveString(textFieldValue)
            } label: {
                Text("Save String")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(viewModel: ViewModel(container: UserDefaults.standard))
    }
}
