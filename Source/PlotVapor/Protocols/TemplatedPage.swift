// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public protocol TemplatedPage: Page {
    associatedtype Template: PlotVapor.Template
}

public extension TemplatedPage {
    @ComponentBuilder var head: Component {
        EmptyComponent()
    }

    func toHTML() -> HTML {
        Template.toHTML(with: self)
    }
}
