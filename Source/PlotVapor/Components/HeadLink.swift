// Copyright © 2022 Brian Drelling. All rights reserved.

import Foundation
import Plot

public struct HeadLink: Component {
    private let url: URLRepresentable
    private let relationship: HTMLLinkRelationship
    private let type: String?
    private let sizes: String?

    public var body: Component {
        Node.link(
            .href(self.url),
            .rel(self.relationship),
            .unwrap(self.type) { .type($0) },
            .unwrap(self.sizes) { .sizes($0) }
        )
    }

    public init(_ url: URLRepresentable, relationship: HTMLLinkRelationship, type: String? = nil, sizes: String? = nil) {
        self.url = url
        self.relationship = relationship
        self.type = type
        self.sizes = sizes
    }

    public init(_ url: URLRepresentable, relationship: HTMLLinkRelationship, type: LinkType, sizes: String? = nil) {
        self.init(url, relationship: relationship, type: type.rawValue, sizes: sizes)
    }
}

// MARK: - Supporting Types

public extension HeadLink {
    enum LinkType: String {
        case css = "text/css"
    }
}
