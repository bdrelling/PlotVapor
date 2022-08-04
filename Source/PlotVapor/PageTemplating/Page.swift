// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public protocol Page: Renderable {
    var title: String { get }
    var themeColor: String? { get }
    
    var head: Node<HTML.DocumentContext> { get }
    var body: Node<HTML.DocumentContext> { get }
    var content: Component { get }

    func toHTML() -> HTML
}

// MARK: - Extensions

public extension Page {
    var themeColor: String? {
        nil
    }

    var head: Node<HTML.DocumentContext> {
        if let themeColor = self.themeColor {
            return .head(
                .title(self.title),
                .meta(
                    .name("theme-color"),
                    .content(themeColor)
                )
            )
        } else {
            return .head(.title(self.title))
        }
    }
    
    var body: Node<HTML.DocumentContext> {
        .body(
            .component(self.content)
        )
    }
    
    func toHTML() -> HTML {
        .init(
            head,
            body
        )
    }
}

// MARK: Renderable

extension Page {
    public func render(indentedBy indentationKind: Indentation.Kind?) -> String {
        self.toHTML().render(indentedBy: indentationKind)
    }
}
