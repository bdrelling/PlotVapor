// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public struct StyleSheet: Component {
    private let url: String

    public var body: Component {
        HeadLink(self.url, relationship: .stylesheet, type: "text/css")
    }

    public init(_ url: String) {
        self.url = url
    }
}
