// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import Vapor

/*
 References:
 - https://github.com/vapor/leaf-kit/blob/main/Sources/LeafKit/LeafRenderer.swift
 - https://github.com/vapor/leaf/tree/main/Sources/Leaf
 - https://github.com/SwiftPackageIndex/SwiftPackageIndex-Server/blob/main/Sources/App/Core/Extensions/HTML+ResponseEncodable.swift
 */

public final class PlotRenderer {
    public let eventLoop: EventLoop

    public init(eventLoop: EventLoop) {
        self.eventLoop = eventLoop
    }
}

// MARK: - Extensions

public extension PlotRenderer {
    func render(_ renderable: Renderable, indentedBy indentationKind: Indentation.Kind? = nil) -> EventLoopFuture<View> {
        // Convert the HTML String into a Byte Buffer.
        let buffer = renderable.toBuffer(indentedBy: indentationKind)

        return self.eventLoop.makeSucceededFuture(
            View(data: buffer)
        )
    }

    func render(_ renderable: Renderable, indentedBy indentationKind: Indentation.Kind? = nil) async throws -> View {
        try await self.render(renderable, indentedBy: indentationKind).get()
    }
}

private extension Renderable {
    func toBuffer(indentedBy indentationKind: Indentation.Kind? = nil) -> ByteBuffer {
        // Render the HTML into a String.
        let htmlString: String = {
            if let indentationKind = indentationKind {
                return self.render(indentedBy: indentationKind)
            } else {
                return self.render()
            }
        }()

        // Convert the HTML String into a Byte Buffer.
        return .init(string: htmlString)
    }
}
