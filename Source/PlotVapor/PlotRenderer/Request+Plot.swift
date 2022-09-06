// Copyright © 2022 Brian Drelling. All rights reserved.

import Vapor

// TODO: https://github.com/vapor/leaf/blob/main/Sources/Leaf/Request%2BLeaf.swift

public extension Request {
    var plot: PlotRenderer {
        .init(
            eventLoop: self.eventLoop
        )
    }
}

