//
//  Utility.swift
//  MarvelHeros
//
//  Created by Nirosha Pabolu on 05/02/24.
//

import Foundation

public struct Utility {
    
    /**
     Checks whether the current device is jailbroken by searching for known jailbreak-related files.
     
     ## Example Usage:
     ```swift
     if isDeviceJailbroken() {
        // Handle jailbroken device scenario
     } else {
        // Proceed with normal execution
     }
     */
    public static func isDeviceJailbroken() -> Bool {
        let fileManager = FileManager.default
        let jailbreakFilepaths = [
            "/Applications/Cydia.app",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/bin/bash",
            "/usr/sbin/sshd",
            "/etc/apt"
        ]
        
        for path in jailbreakFilepaths {
            if fileManager.fileExists(atPath: path) {
                return true
            }
        }
        
        return false
    }
}
