// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

extension Node where Context == Plot.HTML.DocumentContext {
    public static func responsiveHead(_ nodes: Node<HTML.HeadContext>...) -> Plot.Node<Context> {
        let nodes: [Node<HTML.HeadContext>] = [
            .meta(
                .charset(.utf8)
            ),
            .meta(
                .name("viewport"),
                .content("width=device-width, initial-scale=1")
            ),
        ] + nodes

        return .element(named: "head", nodes: nodes)
    }
}
