// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public struct Body: Component {
    @ComponentBuilder private let content: ContentProvider

    public var body: Component {
        Node.body(self.content)
    }

    public init(
        @ComponentBuilder content: @escaping ContentProvider
    ) {
        self.content = content
    }
}
