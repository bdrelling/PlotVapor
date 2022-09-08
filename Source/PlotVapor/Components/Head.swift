// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public extension ElementDefinitions {
    /// Definition for the `<section>` element.
    enum Head: ElementDefinition { public static var wrapper = Node.head }
}

/// A container component that's rendered using the `<section>` element.
public typealias Head = ElementComponent<ElementDefinitions.Head>
