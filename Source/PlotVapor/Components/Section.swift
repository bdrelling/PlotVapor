// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot

public extension ElementDefinitions {
    /// Definition for the `<section>` element.
    enum Section: ElementDefinition { public static var wrapper = Node.section }
}

/// A container component that's rendered using the `<section>` element.
public typealias Section = ElementComponent<ElementDefinitions.Section>
