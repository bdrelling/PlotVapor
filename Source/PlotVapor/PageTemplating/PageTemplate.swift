// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public protocol PageTemplate {
    static func head(with page: Page) -> Node<HTML.DocumentContext>
    static func body(with page: Page) -> Node<HTML.DocumentContext>
}

// MARK: - Extensions

public extension PageTemplate {
    static func head(with page: Page) -> Node<HTML.DocumentContext> {
        page.head
    }

    static func body(with page: Page) -> Node<HTML.DocumentContext> {
        page.body
    }
    
    static func toHTML(with page: Page) -> HTML {
        .init(
            self.head(with: page),
            self.body(with: page)
        )
    }
}
