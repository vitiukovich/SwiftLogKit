//
//  LogFormatter.swift
//  SwiftLogKit
//
//  Created by Stanislav Vitiuk on 5/4/25.
//

public protocol LogFormatter {
    func format(_ log: LogEntry) -> String
}

public struct DefaultLogFormatter: LogFormatter {
    private let dateFormatter: DateFormatter

    public init(dateFormat: String = "MM-dd HH:mm:ss.SSS") {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        self.dateFormatter = formatter
    }

    public func format(_ entry: LogEntry) -> String {
        let time = dateFormatter.string(from: entry.timestamp)
        let level = entry.level.icon
        let tag = "\(entry.tag?.icon ?? "") \(entry.tag?.label ?? "-")"
        let message = entry.message
        let error = entry.error?.localizedDescription
        let file = entry.file
        let function = entry.function
        let line = entry.line

        var components = [
            "[\(time)]",
            "[\(level)]",
            "[\(tag)]",
            message,
        ]
        
        if let file = file,
           let line = line,
           let function = function
        {
            components.append(" (\(file):\(line) \(function))")
        }

        if let error = error {
            components.append("| Error: \(error)")
        }
        
        return components.joined(separator: " ")
    }
}
