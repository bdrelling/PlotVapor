// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import Vapor

public extension EnvironmentKey where Value == Request? {
    static var request: Self {
        .init(defaultValue: nil)
    }
}

public extension EnvironmentKey where Value == Environment? {
    static var environment: Self {
        .init(defaultValue: nil)
    }
}

public extension EnvironmentKey where Value == URI? {
    static var requestURL: Self {
        .init(defaultValue: nil)
    }
}

// MARK: - Extensions

public extension Component {
    func request(_ request: Request?) -> Component {
        self.environmentValue(request, key: .request)
            .environment(request?.application.environment)
            .requestURL(request?.url)
    }

    func environment(_ environment: Environment?) -> Component {
        self.environmentValue(environment, key: .environment)
    }

    func requestURL(_ url: URI?) -> Component {
        self.environmentValue(url, key: .requestURL)
    }
}
