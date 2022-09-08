// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public struct NoScript: Component {
    @ComponentBuilder private let content: ContentProvider

    public var body: Component {
        Element(name: "noscript") {
            self.content()
        }
    }

    public init(
        @ComponentBuilder content: @escaping ContentProvider
    ) {
        self.content = content
    }
}
