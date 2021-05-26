// Copyright © 2021 Brian Drelling. All rights reserved.

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

extension PlotRenderer {
    public func render(_ html: HTML, indentedBy indentationKind: Indentation.Kind? = nil) -> EventLoopFuture<View> {
        // Render the HTML into a String.
        let htmlString: String = {
            if let indentationKind = indentationKind {
                return html.render(indentedBy: indentationKind)
            } else {
                return html.render()
            }
        }()
        
        // Convert the HTML String into a Byte Buffer.
        let buffer = ByteBuffer(string: htmlString)
        
        return self.eventLoop.makeSucceededFuture(
            View(data: buffer)
        )
    }
}


