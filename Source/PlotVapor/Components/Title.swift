// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public struct Title: Component {
    private let title: String

    public var body: Component {
        Node<HTML.HeadContext>.title(self.title)
    }

    public init(_ title: String) {
        self.title = title
    }
}
