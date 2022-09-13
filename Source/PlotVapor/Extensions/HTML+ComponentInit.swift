// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public extension HTML {
    init(
        head: Component,
        body: Component
    ) {
        self.init(
            .head(.component(head)),
            .body(.component(body))
        )
    }

    init(
        head: Component,
        @ComponentBuilder body: @escaping () -> Component
    ) {
        self.init(head: head, body: body())
    }

    init(
        @ComponentBuilder head: @escaping () -> Component,
        @ComponentBuilder body: @escaping () -> Component
    ) {
        self.init(head: head(), body: body())
    }
}
