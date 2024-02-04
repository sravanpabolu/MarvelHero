//
//  Logger.swift
//  MarvelHeros
//

import Foundation

/**
The log levels indicating the severity of the log message.
*/
public enum LogLevel: String {
    case debug
    case info
    case warning
    case error
}

/**
 `Logger` is a utility class for logging messages at different log levels in Swift.

 ## Example Usage:
 ```swift
 Logger.debug("This is a debug message")
 Logger.info("This is an info message")
 Logger.warning("This is a warning message")
 Logger.error("This is an error message")

*/

public class Logger {
    static var logLevel: LogLevel = .debug

    /**
    The current log level, controlling the verbosity of the logs.
     
     Logs a message at the specified log level.

     Parameters:
     level: The log level (debug, info, warning, error).
     message: The message to be logged.
    */
    public static func log(_ level: LogLevel = .debug, _ message: String) {
        if level.rawValue == logLevel.rawValue || level == .error {
            print("[\(level.rawValue.uppercased())] \(message)")
        }
    }

    /**
    Logs a debug message.

    Parameter message: The debug message to be logged.
    */
    public static func debug(_ message: String) {
        log(.debug, message)
    }

    /**
    Logs an info message.

    Parameter message: The info message to be logged.
    */
    public static func info(_ message: String) {
        log(.info, message)
    }

    /**
    Logs a warning message.

    Parameter message: The warning message to be logged.
    */
    public static func warning(_ message: String) {
        log(.warning, message)
    }

    /**
    Logs an error message.

    Parameter message: The error message to be logged.
    */
    public static func error(_ message: String) {
        log(.error, message)
    }
}
