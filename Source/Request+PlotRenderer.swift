// Copyright © 2022 Brian Drelling. All rights reserved.

import Vapor

public extension Request {
    var plot: PlotRenderer {
        .init(
            eventLoop: self.eventLoop
        )
    }
}
