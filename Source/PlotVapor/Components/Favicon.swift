// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public struct Favicon: Component {
    private let url: URLRepresentable
    private let type: String

    public var body: Component {
        Node.favicon(self.url, type: self.type)
    }

    public init(_ url: URLRepresentable, type: String = "image/png") {
        self.url = url
        self.type = type
    }
}
