// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public struct Style: Component {
    private let text: String

    public var body: Component {
        Element(name: "style") {
            Text(text)
        }
    }

    public init(_ text: String) {
        self.text = text
    }
}
