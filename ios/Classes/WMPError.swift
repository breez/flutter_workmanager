//
//  WMPError.swift
//  workmanager
//
//  Created by Jérémie Vincke on 30/07/2019.
//

import Foundation

enum WMPError: Error {
    case invalidParameters
    case methodChannelNotSet
    case unhandledMethod(_ methodName: String)
    case unexpectedMethodArguments(_ argumentsDescription: String)
    case workmanagerNotInitialized
    case workmanagerIsAlreadyInitialized
    case bgTaskSchedulingFailed(_ error: Error)

    var code: String {
        return "\(self) error"
    }

    var message: String {
        switch self {
        case .invalidParameters:
            return "Invalid parameters passed"
        case .methodChannelNotSet:
            return "Method channel not set"
        case let .unhandledMethod(methodName):
            return "Unhandled method \(methodName)"
        case let .unexpectedMethodArguments(argumentsDescription):
            return "Unexpected call arguments \(argumentsDescription)"
        case .workmanagerIsAlreadyInitialized:
            return "Workmanager was initialized once. It can not initilized a second time"
        case let .bgTaskSchedulingFailed(error):
            return """
            Scheduling the task using BGTaskScheduler has failed.
            This may be due to too many tasks being scheduled but not run.
            See the error for details: \(error).
            """
        case .workmanagerNotInitialized:
            return """
            You should ensure you have called the 'initialize' function first!
            Example:
            `Workmanager().initialize(
              callbackDispatcher,
             )`

            The `callbackDispatcher` is a top level function. See example in repository.
            """
        }
    }

    var details: Any? {
        return nil
    }

    var asFlutterError: FlutterError {
        return FlutterError(code: code, message: message, details: details)
    }
}
