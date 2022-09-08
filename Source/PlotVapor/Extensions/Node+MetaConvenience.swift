// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public extension Node where Context == HTML.HeadContext {
    /// Add a `<meta/>` HTML element within the current context.
    /// - parameter attributes: The element's attributes.
    static func meta(name: String, content: String) -> Node {
        .selfClosedElement(named: "meta", attributes: [.content(content)])
    }
}
