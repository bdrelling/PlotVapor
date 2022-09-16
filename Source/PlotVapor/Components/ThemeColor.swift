// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public struct ThemeColor: Component {
    private let color: String
    private let colorScheme: ColorScheme?

    @ComponentBuilder  public var body: Component {
        Meta(name: "theme-color", content: self.color, attributes: .unwrap(self.colorScheme) { .attribute(named: "media", value: "(prefers-color-scheme: \($0))") })
        Meta(name: "msapplication-TileColor", content: self.color, attributes: .unwrap(self.colorScheme) { .attribute(named: "media", value: "(prefers-color-scheme: \($0))") })
    }

    public init(_ color: String, colorScheme: ColorScheme? = nil) {
        self.color = color
        self.colorScheme = colorScheme
    }

    public init(_ value: Value) {
        self.init(value.color, colorScheme: value.colorScheme)
    }
}

// MARK: - Supporting Types

public extension ThemeColor {
    struct Value {
        public let color: String
        public let colorScheme: ColorScheme?

        public init(_ color: String, colorScheme: ColorScheme? = nil) {
            self.color = color
            self.colorScheme = colorScheme
        }
    }

    enum ColorScheme {
        case dark
        case light
        case other(String)

        public var rawValue: String {
            switch self {
            case .light: return "light"
            case .dark: return "dark"
            case let .other(value): return value
            }
        }
    }
}
