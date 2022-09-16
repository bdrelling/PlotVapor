// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import Vapor

public extension Renderable {
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

    func toView(indentedBy indentationKind: Indentation.Kind? = nil) -> View {
        .init(data: self.toBuffer(indentedBy: indentationKind))
    }
}
