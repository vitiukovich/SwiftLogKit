//
//  LogConfiguration.swift
//  SwiftLogKit
//
//  Created by Stanislav Vitiuk on 5/3/25.
//

public struct LogConfiguration {
    public var minimumLevel: LogLevel
    public var enabledTags: [any LogTag]?
    
    public var logToConsole: Bool
    public var saveToFile: Bool
    public var formatter: LogFormatter
    
    public init(
        minimumLevel: LogLevel = LogLevel.debug,
        enabledTags: [any LogTag]? = nil,
        logToConsole: Bool = true,
        saveToFile: Bool = false,
        formatter: LogFormatter = DefaultLogFormatter()
    ) {
        self.minimumLevel = minimumLevel
        self.enabledTags = enabledTags
        self.logToConsole = logToConsole
        self.saveToFile = saveToFile
        self.formatter = formatter
    }

    public static let `default` = LogConfiguration()
}
