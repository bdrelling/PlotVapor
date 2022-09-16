// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public protocol Page: Component {
    @ComponentBuilder var body: Component { get }
}

// MARK: Renderable

public extension Page {
    func render(indentedBy indentationKind: Indentation.Kind?) -> String {
        HTML(.component(self.body)).render(indentedBy: indentationKind)
    }
}
