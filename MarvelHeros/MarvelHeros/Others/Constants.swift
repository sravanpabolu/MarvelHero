//
//  Constants.swift
//  MarvelHeros
//


import Foundation

///  `Constants` is a struct containing static constants used in the Marvel Heroes application.
///
public struct Constants {
    static let baseURL = "https://simplifiedcoding.net"
    static let marvelHeros = "/demos/marvel/"
    static let listViewTitle = "Marvel Heros"
    
    static let realName = "Real Name:"
    static let team = "Team:"
    static let firstAppearance = "First Appearance:"
    static let createdBy = "Created By:"
    static let publisher = "Publisher:"
    static let bio = "Bio:"
    
    //Jail Broken devices
    public enum JailbrokenDeviceConstants {
        static let alertTitle = "Jailbreak Detected"
        static let alertMessage = "This app cannot run on jailbroken devices."
        static let alertExitButton = "Exit"
    }
}
