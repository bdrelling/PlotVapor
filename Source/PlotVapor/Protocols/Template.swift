// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public protocol Template {
    @ComponentBuilder
    static func head(with page: Page) -> Component
    @ComponentBuilder
    static func body(with page: Page) -> Component
    @ComponentBuilder
    static func scripts(with page: Page) -> Component

    static func toHTML(with page: Page) -> HTML
}

// MARK: - Extensions

public extension Template {
    @ComponentBuilder
    static func head(with page: Page) -> Component {
        page.head
    }

    @ComponentBuilder
    static func body(with page: Page) -> Component {
        page.body
    }

    @ComponentBuilder
    static func scripts(with page: Page) -> Component {
        page.scripts
    }

    static func toHTML(with page: Page) -> HTML {
        HTML {
            self.head(with: page)
        } body: {
            self.body(with: page)
            self.scripts(with: page)
        }
    }
}
