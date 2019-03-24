//
//  TextMeLogger.swift
//  Gsabatie
//
//  Created by Sabatie Guillaume on 3/4/19.
//  Copyright © 2019 Sabatie Guillaume, Inc. All rights reserved.
//

import Foundation
import os.log

final class Applogger {

    /// get current thread name
    private var currentThread: String {
        guard !Thread.isMainThread else {
            return "main"
        }
        if let threadName = Thread.current.name, !threadName.isEmpty {
            return threadName
        } else if let queueName = String(validatingUTF8: __dispatch_queue_get_label(nil)),
            !queueName.isEmpty {
            return queueName
        } else {
            return String(format: "%p", Thread.current)
        }
    }

    private func makeOSLogFromCategory(_ category: LogCategory) -> OSLog {
        return OSLog(subsystem: Bundle.main.bundleIdentifier ?? "none", category: category.name())
    }

    private func convertLevelToLogType(_ level: LoggerMessageType) -> OSLogType {
        switch level {
        case .debug:
            return OSLogType.debug
        case .entry:
            return OSLogType.debug
        case .exit:
            return OSLogType.debug
        case .info:
            return OSLogType.info
        case .error:
            return OSLogType.error
        case .warning:
            return OSLogType.error
        case .verbose:
            return OSLogType.info
        }
    }

}

extension Applogger: Logger {

    func log(_ level: LoggerMessageType,
             category: LogCategory,
             message: String,
             functionName: String,
             lineNumber: UInt,
             fileName: String) {

        let log: StaticString = "[%@] [%@:%i %@] %@"

        let file = String(fileName.split(separator: "/").last ?? "none")

        os_log(log,
               log: self.makeOSLogFromCategory(category),
               type: convertLevelToLogType(level),
               currentThread,
               file,
               lineNumber,
               functionName,
               message)
    }

    func isLogging(_ level: LoggerMessageType) -> Bool {
        #if DEBUG
        return true
        #else
        switch level {
        case LoggerMessageType.debug:
            return false
        default:
            return true
        }
        #endif
    }
}
