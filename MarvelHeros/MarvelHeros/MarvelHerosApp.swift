//
//  MarvelHerosApp.swift
//  MarvelHeros
//


import SwiftUI

@main
struct MarvelHerosApp: App {
    @State private var showAlert = false
    
    var body: some Scene {
        WindowGroup {
            if Utility.isDeviceJailbroken() {
                Text("Your app cannot run on jailbroken devices.")
                    .onAppear {
                        showAlert = true
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text(Constants.JailbrokenDeviceConstants.alertTitle),
                            message: Text(Constants.JailbrokenDeviceConstants.alertMessage),
                            primaryButton: .default(Text(Constants.JailbrokenDeviceConstants.alertExitButton), action: {
                                exit(0)
                            }),
                            secondaryButton: .cancel()
                        )
                    }
            } else {
                HerosListView()
            }
        }
    }
}
