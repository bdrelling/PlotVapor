// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public struct Script: Component {
    private let source: String

    public var body: Component {
        Node<HTML.BodyContext>.script(.src(self.source))
    }

    public init(_ source: String) {
        self.source = source
    }
}
