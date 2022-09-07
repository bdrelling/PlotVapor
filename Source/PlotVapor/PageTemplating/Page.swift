// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public protocol Page: Renderable {
    var title: String { get }
    var themeColor: String? { get }
    var canonicalURL: String? { get }

    var head: Node<HTML.DocumentContext> { get }
    var body: Node<HTML.DocumentContext> { get }

    @ComponentBuilder var content: Component { get }

    func toHTML() -> HTML
}

// MARK: - Extensions

public extension Page {
    var themeColor: String? {
        nil
    }

    var canonicalURL: String? {
        nil
    }

    var head: Node<HTML.DocumentContext> {
        .head(
            .title(self.title),
            .unwrap(self.canonicalURL) { canonicalURL in
                .link(
                    .rel(.canonical),
                    .href(canonicalURL)
                )
            },
            .unwrap(self.themeColor) { themeColor in
                .meta(
                    .name("theme-color"),
                    .content(themeColor)
                )
            }
        )
    }

    var body: Node<HTML.DocumentContext> {
        .body(
            .component(self.content)
        )
    }

    func toHTML() -> HTML {
        .init(
            self.head,
            self.body
        )
    }
}

// MARK: Renderable

public extension Page {
    func render(indentedBy indentationKind: Indentation.Kind?) -> String {
        self.toHTML().render(indentedBy: indentationKind)
    }
}
