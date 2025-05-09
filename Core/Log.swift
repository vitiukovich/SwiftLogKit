//
//  Log.swift
//  SwiftLogKit
//
//  Created by Stanislav Vitiuk on 5/3/25.
//

public enum Log {
    public static var config = LogConfiguration.default

    
    // MARK: Debag
    /// Logs a debug-level message with a predefined tag (`LogTag`).
    ///
    /// Use this method for detailed technical logs during development,
    /// such as API calls, app state transitions, or internal values.
    ///
    /// - Parameters:
    ///   - msg: Message text.
    ///   - tag: Any tag conforming to `LogTagProtocol`. See protocol docs for implementation example.
    ///   - context: Optional custom context string.
    ///   - file: Auto-injected file name.
    ///   - function: Auto-injected function name.
    ///   - line: Auto-injected line number.
    public static func debug(_ msg: String,
                             tag: LogTag? = nil,
                             context: String? = nil,
                             file: String = #file,
                             function: String = #function,
                             line: Int = #line) {
        log(.debug, msg, tag, nil, context, function: function, file: file, line: line)
    }
    
    // MARK: Info
    /// Logs an informational message with a predefined tag (`LogTag`).
    ///
    /// Use this method to track user actions, screen transitions, or app lifecycle events.
    ///
    /// - Parameters:
    ///   - msg: Message text.
    ///   - tag: Any tag conforming to `LogTagProtocol`. See protocol docs for implementation example.
    ///   - context: Optional custom context string.
    ///   - file: Auto-injected file name.
    ///   - function: Auto-injected function name.
    ///   - line: Auto-injected line number.
    public static func info(_ msg: String,
                            tag: LogTag? = nil,
                            context: String? = nil,
                            file: String = #file,
                            function: String = #function,
                            line: Int = #line) {
        log(.info, msg, tag, nil, context, function: function, file: file, line: line)
    }

    //MARK: Warning
    /// Logs a warning message with a predefined tag (`LogTag`).
    ///
    /// Use this to flag recoverable issues, degraded performance, or suspicious behavior.
    ///
    /// - Parameters:
    ///   - msg: Message text.
    ///   - tag: Any tag conforming to `LogTagProtocol`. See protocol docs for implementation example.
    ///   - context: Optional custom context string.
    ///   - file: Auto-injected file name.
    ///   - function: Auto-injected function name.
    ///   - line: Auto-injected line number.
    public static func warning(_ msg: String,
                               tag: LogTag? = nil,
                               context: String? = nil,
                               file: String = #file,
                               function: String = #function,
                               line: Int = #line) {
        log(.warning, msg, tag, nil, context, function: function, file: file, line: line)
    }

    //MARK: Error
    /// Logs an error with a predefined tag (`DefaultLogTag`).
    ///
    /// Used for critical failures, such as request errors, crashes, or invalid states.
    ///
    /// - Parameters:
    ///   - msg: Message text.
    ///   - error: Optional error object.
    ///   - tag: Any tag conforming to `LogTagProtocol`. See protocol docs for implementation example.
    ///   - context: Optional custom context string.
    ///   - file: Auto-injected file name.
    ///   - function: Auto-injected function name.
    ///   - line: Auto-injected line number.
    public static func error(_ msg: String,
                             error: Error? = nil,
                             tag: LogTag? = nil,
                             context: String? = nil,
                             function: String = #function,
                             file: String = #file,
                             line: Int = #line) {
        log(.error, msg, tag, error, context, function: function, file: file, line: line)
    }

    
    /// Internal entry point for advanced or custom logging extensions.
    ///
    /// Use this method to build your own wrappers or custom behavior.
    /// For example, you can define your own `.critical()` or `.network()`
    /// methods using this interface.
    ///
    /// - Parameters:
    ///   - level: LogLevel
    ///   - msg: Log message text.
    ///   - tag: Optional tag (any LogTagProtocol).
    ///   - error: Optional error object.
    ///   - context: Optional custom context string.
    ///   - function: String = #function.
    ///   - file: String = #file.
    ///   - line: Int = #line.
    public static func log(_ level: LogLevel,
                            _ msg: String,
                            _ tag: (any LogTagProtocol)? = nil,
                            _ error: Error? = nil,
                            _ context: String? = nil,
                            function: String = #function,
                            file: String = #file,
                            line: Int = #line) {
        let entity = LogEntry(level: level,
                              tag: tag,
                              message: msg,
                              error: error,
                              context: context,
                              file: file,
                              function: function,
                              line: line)
        if Log.config.logToConsole {
            print(entity.formatted)
        }
    }
}
