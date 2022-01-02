// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public protocol PageTemplate {
    func head(with page: Page) -> Node<HTML.DocumentContext>
    func body(with page: Page) -> Node<HTML.DocumentContext>

    init()
}

// MARK: - Extensions

public extension PageTemplate {
    func toHTML(with page: Page) -> HTML {
        .init(
            self.head(with: page),
            self.body(with: page)
        )
    }
}

// MARK: - Supporting Types

struct DefaultPageTemplate: PageTemplate {
    public func head(with page: Page) -> Node<HTML.DocumentContext> {
        .head(
            .title(page.title)
        )
    }

    public func body(with page: Page) -> Node<HTML.DocumentContext> {
        .body(
            .component(page.content)
        )
    }
}
