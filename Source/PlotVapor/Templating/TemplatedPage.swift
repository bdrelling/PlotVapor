// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public protocol TemplatedPage: Page {
    associatedtype Template: PlotVapor.Template

    var title: String { get }
    var themeColor: String? { get }
    var canonicalURL: String? { get }
}

public extension TemplatedPage {
    var themeColor: String? {
        nil
    }

    var canonicalURL: String? {
        nil
    }

    @ComponentBuilder var head: Component {
        EmptyComponent()
    }

    func toHTML() -> HTML {
        Template.toHTML(with: self)
    }
}
