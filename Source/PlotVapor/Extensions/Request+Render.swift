// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import Vapor

public extension Request {
    func render(_ page: Page, indentedBy indentationKind: Indentation.Kind? = nil) -> View {
        page
            .request(self)
            .toView(indentedBy: indentationKind)
    }
}
