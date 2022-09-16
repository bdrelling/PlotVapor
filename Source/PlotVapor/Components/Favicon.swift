// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public struct Favicon: Component {
    public enum ImageType: String {
        case gif = "image/gif"
        case jpeg = "image/jpeg"
        case png = "image/png"
        case ico = "image/ico"

        // TODO: Implement SVG favicons.
        // case svg = "image/svg+xml"
    }

    public enum Size {
        case any
        case width(Int)

        var rawValue: String {
            switch self {
            case .any:
                return "any"
            case let .width(width):
                return "\(width)x\(width)"
            }
        }
    }

    private let url: URLRepresentable
    private let relationship: HTMLLinkRelationship
    private let type: ImageType
    private let size: Size?

    public var body: Component {
        HeadLink(self.url, relationship: self.relationship, type: self.type.rawValue, sizes: self.size?.rawValue)
    }

    public init(_ url: URLRepresentable, relationship: HTMLLinkRelationship = .shortcutIcon, type: ImageType = .png, size: Size? = nil) {
        self.url = url
        self.relationship = relationship
        self.type = type
        self.size = size
    }
}
