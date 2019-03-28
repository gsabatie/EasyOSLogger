//
//  Log.swift
//  Gsabatie
//
//  Created by Sabatie Guillaume on 3/4/19.
//  Copyright © 2019 Sabatie Guillaume, Inc. All rights reserved.
//

import Foundation

@objc public enum LogCategory: Int {
    case app = 1
    case ui = 2
    case network = 3
    case database = 4

    func name() -> String {
        switch self {
        case .app:
            return "app"
        case .ui:
            return "ui"
        case .network:
            return "network"
        case .database:
            return "database"
        }
    }
}

//sourcery: AutoMockable
/// A protocol defining a logger
protocol Logger {

    /// Display a looged message in an output defined by the level
    ///
    /// - Parameters:
    ///   - level: the level of the message being logged
    ///   - message: the nessage to be logged
    ///   - functionName: the name of the function where the logger is invoked
    ///   - lineNumber: the number of line where the logger is invoked
    ///   - fileName: the name of the source code file invoking the logger
    func log(_ level: LoggerMessageType,
             category: LogCategory,
             message: String,
             functionName: String,
             lineNumber: UInt,
             fileName: String)

    /// Indicate if the logger  will log a message with the specified level
    ///
    /// - Parameter level: the level of the message being logged
    /// - Returns: A Bool indicating whether a message of the specified type will be displayed
    func isLogging(_ level: LoggerMessageType) -> Bool
}

@objc public final class Log: NSObject {

    /// the intance of the logger used by the static functions
    static let logger: Logger? = Applogger()

    /// Log a message in verbose mode
    ///
    /// - Parameters:
    ///   - message: The message to be logged
    ///   - functionName: The name of the function invoking the logger. By default, the function invoking the logger
    ///   - lineNumber: The line number of the function invoking the logger. By default, the line of the source code invoking the logger
    ///   - fileName: The name of the file containing the function invoking the logger
    @objc public static func verbose(_ message: @autoclosure () -> String,
                        category: LogCategory = LogCategory.app,
                        functionName: String = #function,
                        lineNumber: UInt = #line,
                        fileName: String = #file) {
        if let logger = self.logger, logger.isLogging(LoggerMessageType.verbose) {
            logger.log(LoggerMessageType.verbose,
                       category: category,
                       message: message(),
                       functionName: functionName,
                       lineNumber: lineNumber,
                       fileName: fileName)
        }
    }

    /// Log a message in info mode
    ///
    /// - Parameters:
    ///   - message: The message to be logged
    ///   - functionName: The name of the function invoking the logger. By default, the function invoking the logger
    ///   - lineNumber: The line number of the function invoking the logger. By default, the line of the source code invoking the logger
    ///   - fileName: The name of the file containing the function invoking the logger
    @objc public static func info(_ message: @autoclosure () -> String,
                     category: LogCategory = LogCategory.app,
                     functionName: String = #function,
                     lineNumber: UInt = #line,
                     fileName: String = #file) {
        if let logger = self.logger, logger.isLogging(LoggerMessageType.info) {
            logger.log(LoggerMessageType.info,
                       category: category,
                       message: message(),
                       functionName: functionName,
                       lineNumber: lineNumber,
                       fileName: fileName)
        }
    }

    /// Log a message in warning mode
    ///
    /// - Parameters:
    ///   - message: The message to be logged
    ///   - functionName: The name of the function invoking the logger. By default, the function invoking the logger
    ///   - lineNumber: The line number of the function invoking the logger. By default, the line of the source code invoking the logger
    ///   - fileName: The name of the file containing the function invoking the logger
    @objc public static func warning(_ message: @autoclosure () -> String,
                        category: LogCategory = LogCategory.app,
                        functionName: String = #function,
                        lineNumber: UInt = #line,
                        fileName: String = #file) {
        if let logger = self.logger, logger.isLogging(LoggerMessageType.warning) {
            logger.log(LoggerMessageType.warning,
                       category: category,
                       message: message(),
                       functionName: functionName,
                       lineNumber: lineNumber,
                       fileName: fileName)
        }
    }

    /// Log a message in error mode
    ///
    /// - Parameters:
    ///   - message: The message to be logged
    ///   - functionName: The name of the function invoking the logger. By default, the function invoking the logger
    ///   - lineNumber: The line number of the function invoking the logger. By default, the line of the source code invoking the logger
    ///   - fileName: The name of the file containing the function invoking the logger
    @objc public static func error(_ message: @autoclosure () -> String,
                      category: LogCategory = LogCategory.app,
                      functionName: String = #function,
                      lineNumber: UInt = #line,
                      fileName: String = #file) {
        if let logger = self.logger, logger.isLogging(LoggerMessageType.error) {
            logger.log(LoggerMessageType.error,
                       category: category,
                       message: message(),
                       functionName: functionName,
                       lineNumber: lineNumber,
                       fileName: fileName)
        }
    }

    /// Log a message in debug mode
    ///
    /// - Parameters:
    ///   - message: The message to be logged
    ///   - functionName: The name of the function invoking the logger. By default, the function invoking the logger
    ///   - lineNumber: The line number of the function invoking the logger. By default, the line of the source code invoking the logger
    ///   - fileName: The name of the file containing the function invoking the logger
    @objc public static func debug(_ message: @autoclosure () -> String,
                      category: LogCategory = LogCategory.app,
                      functionName: String = #function,
                      lineNumber: UInt = #line,
                      fileName: String = #file) {
        if let logger = self.logger, logger.isLogging(LoggerMessageType.debug) {
            logger.log(LoggerMessageType.debug,
                       category: category,
                       message: message(),
                       functionName: functionName,
                       lineNumber: lineNumber,
                       fileName: fileName)
        }
    }

    /// Log a message when entering a function
    ///
    /// - Parameters:
    ///   - message: The message to be logged
    ///   - functionName: The name of the function invoking the logger. By default, the function invoking the logger
    ///   - lineNumber: The line number of the function invoking the logger. By default, the line of the source code invoking the logger
    ///   - fileName: The name of the file containing the function invoking the logger
    @objc public static func entryFunction(_ message: @autoclosure () -> String,
                              category: LogCategory = LogCategory.app,
                              functionName: String = #function,
                              lineNumber: UInt = #line,
                              fileName: String = #file) {
        if let logger = self.logger, logger.isLogging(LoggerMessageType.entry) {
            logger.log(LoggerMessageType.entry,
                       category: category,
                       message: message(),
                       functionName: functionName,
                       lineNumber: lineNumber,
                       fileName: fileName)
        }
    }

    /// Log a message when exiting a function
    ///
    /// - Parameters:
    ///   - message: The message to be logged
    ///   - functionName: The name of the function invoking the logger. By default, the function invoking the logger
    ///   - lineNumber: The line number of the function invoking the logger. By default, the line of the source code invoking the logger
    ///   - fileName: The name of the file containing the function invoking the logger
    @objc public static func exitFunction(_ message: @autoclosure () -> String,
                             category: LogCategory = LogCategory.app,
                             functionName: String = #function,
                             lineNumber: UInt = #line,
                             fileName: String = #file) {
        if let logger = self.logger, logger.isLogging(LoggerMessageType.exit) {
            logger.log(LoggerMessageType.exit,
                       category: category,
                       message: message(),
                       functionName: functionName,
                       lineNumber: lineNumber,
                       fileName: fileName)
        }
    }

    /// Indicate if a message with the given level will be displayed
    ///
    /// - Parameter level: the level of the message
    /// - Returns: a Boolean indicating if a message with the level will be displayed. it return false if logger is nil
    static func isLogging(_ level: LoggerMessageType) -> Bool {
        guard let logger = self.logger else {
            return false
        }
        return logger.isLogging(level)
    }
}

@objc enum LoggerMessageType: Int {
    /// Log message type for logging when entering into a function.
    case entry = 1
    /// Log message type for logging when exiting from a function.
    case exit = 2
    /// Log message type for logging a debugging message.
    case debug = 3
    /// Log message type for logging messages in verbose mode.
    case verbose = 4
    /// Log message type for logging an informational message.
    case info = 5
    /// Log message type for logging a warning message.
    case warning = 6
    /// Log message type for logging an error message.
    case error = 7
}

extension LoggerMessageType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .entry:
            return "ENTRY_FUNC"
        case .exit:
            return "EXIT_FUNC"
        case .debug:
            return "DEBUG"
        case .verbose:
            return "VERBOSE"
        case .info:
            return "INFO"
        case .warning:
            return "WARNING"
        case .error:
            return "ERROR"
        }
    }
}
