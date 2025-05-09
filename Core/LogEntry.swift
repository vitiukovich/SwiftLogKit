//
//  LogEntry.swift
//  SwiftLogKit
//
//  Created by Stanislav Vitiuk on 5/3/25.
//

internal struct LogEntry: Identifiable {
    let id: UUID
    let timestamp: Date

    let level: LogLevel
    let tag: (any LogTagProtocol)?
    let message: String
    let error: Error?
    let context: String?
    
    let file: String?
    let function: String?
    let line: Int?

    let privacy: LogPrivacy = .public


    var formatted: String {
        return LogConfiguration.default.formatter.format(self)
    }
    
    var errorDescription: String? {
        error?.localizedDescription
    }
    
    init(id: UUID, timestamp: Date, level: LogLevel, tag: (any LogTagProtocol)?, message: String, error: Error?, context: String?, file: String?, function: String?, line: Int?) {
        self.id = id
        self.timestamp = timestamp
        self.level = level
        self.tag = tag
        self.message = message
        self.error = error
        self.context = context
        self.file = file
        self.function = function
        self.line = line
    }
    
    init(level: LogLevel, tag: (any LogTagProtocol)?, message: String, error: Error?, context: String?, file: String?, function: String?, line: Int?) {
        self.id = UUID()
        self.timestamp = Date()
        self.level = level
        self.tag = tag
        self.message = message
        self.error = error
        self.context = context
        self.file = file
        self.function = function
        self.line = line
    }
}

// MARK: - Identity & Hashing
//
// Each LogEntry represents a unique logging event, even if the level, tag,
// and message are identical to others.
//
// This ensures:
// - all log calls are preserved (including duplicates from different places)
// - consistent behavior with Set and Dictionary
// - simple and safe Equatable / Hashable implementations
//
// Identity is based solely on UUID.

extension LogEntry: Equatable, Hashable {
    
    public static func == (lhs: LogEntry, rhs: LogEntry) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


