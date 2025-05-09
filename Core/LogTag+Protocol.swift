//
//  LogTag.swift
//  SwiftLogKit
//
//  Created by Stanislav Vitiuk on 5/3/25.
//


/// A type-safe tag used to categorize logs (e.g., `.network`, `.auth`, `.ui`).
///
/// Conform to this protocol by creating your own enum:
///
/// ```swift
/// enum MyTag: LogTagProtocol {
///     case ui, network
///
///     var icon: String {
///         switch self {
///         case .ui: return "🖥"
///         case .network: return "🌐"
///         }
///     }
///
///     var label: String {
///         switch self {
///         case .ui: return "UI"
///         case .network: return "NETWORK"
///         }
///     }
/// }
/// ```
///
/// Custom tags allow flexible filtering, display formatting, and theming.
public protocol LogTagProtocol: Codable, CaseIterable, Sendable {
    var icon: String { get }
    var label: String { get }
}

public enum LogTag: LogTagProtocol {
    case network
    case ui
    case auth
    case database
    case general

    public var icon: String {
        switch self {
        case .network: return "🌐"
        case .ui: return "🖼"
        case .auth: return "🔐"
        case .database: return "💾"
        case .general: return "🧩"
        }
    }

    public var label: String {
        switch self {
        case .network: return "NETWORK"
        case .ui: return "UI"
        case .auth: return "AUTH"
        case .database: return "DATABASE"
        case .general: return "GENERAL"
        }
    }
}
