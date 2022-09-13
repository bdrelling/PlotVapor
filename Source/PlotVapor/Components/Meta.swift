// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public struct Meta: Component {
    private let name: String?
    private let content: String?
    private let attributes: [Attribute<HTML.MetaContext>]

    public var body: Component {
        Node.element(
            named: "meta",
            attributes: [
                .unwrap(self.name) { .name($0) },
                .unwrap(self.content) { .content($0) },
            ] + self.attributes
        )
    }

    public init(name: String? = nil, content: String? = nil, attributes: [Attribute<HTML.MetaContext>]) {
        self.name = name
        self.content = content
        self.attributes = attributes
    }

    public init(name: String? = nil, content: String? = nil, attributes: Attribute<HTML.MetaContext>...) {
        self.init(
            name: name,
            content: content,
            attributes: attributes
        )
    }

    public init(themeColor: String, colorScheme: String? = nil) {
        var attributes: [Attribute<HTML.MetaContext>] = []

        if let colorScheme = colorScheme {
            attributes.append(.attribute(named: "media", value: "(prefers-color-scheme: \(colorScheme))"))
        }

        self.init(
            name: "theme-color",
            content: themeColor,
            attributes: attributes
        )
    }

    public init(charset: DocumentEncoding) {
        self.init(attributes: .charset(charset))
    }
}
