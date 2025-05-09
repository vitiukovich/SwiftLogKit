//
//  LogLevel.swift
//  SwiftLogKit
//
//  Created by Stanislav Vitiuk on 5/3/25.
//

public enum LogLevel: Int, Codable, CaseIterable, Sendable{
    
    case debug = 0
    case info
    case warning
    case error

    public var icon: String {
        switch self {
        case .debug: return "🟢"
        case .info: return "🔵"
        case .warning: return "🟡"
        case .error: return "🔴"
        }
    }

    public var label: String {
        switch self {
        case .debug: return "DEBUG"
        case .info: return "INFO"
        case .warning: return "WARNING"
        case .error: return "ERROR"
        }
    }
    
    

}
