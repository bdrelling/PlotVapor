// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public protocol Page: Renderable {
    @ComponentBuilder var head: Component { get }
    @ComponentBuilder var body: Component { get }
    @ComponentBuilder var scripts: Component { get }

    func toHTML() -> HTML
}

// MARK: - Extensions

public extension Page {
    @ComponentBuilder var scripts: Component {
        EmptyComponent()
    }

    func toHTML() -> HTML {
        HTML {
            self.head
        } body: {
            self.body
            self.scripts
        }
    }
}

// MARK: Renderable

public extension Page {
    func render(indentedBy indentationKind: Indentation.Kind?) -> String {
        self.toHTML().render(indentedBy: indentationKind)
    }
}
