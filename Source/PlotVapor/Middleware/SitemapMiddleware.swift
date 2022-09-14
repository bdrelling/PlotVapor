// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import Vapor

public struct SitemapMiddleware: AsyncMiddleware {
    private let path: String
    private let sitemap: Sitemap

    public init(path: String = "/sitemap.xml", sitemap: Sitemap) {
        self.path = path
        self.sitemap = sitemap
    }

    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        guard request.url.path == self.path else {
            return try await next.respond(to: request)
        }

        return .init(
            status: .ok,
            version: request.version,
            headers: [
                "content-type": "text/xml; charset=utf-8",
            ],
            body: .init(stringLiteral: self.sitemap.render())
        )
    }
}

// MARK: - Supporting Types

// Sitemap is typically represented as one whole word.
// This typealias is provided to normalize the language for SitemapMiddleware.
public typealias Sitemap = SiteMap

// MARK: - Extensions

extension Response {
    static func sitemap(request: Request, sitemap: Sitemap) -> Self {
        .init(
            status: .ok,
            version: request.version,
            headers: [
                "content-type": "text/xml; charset=utf-8",
            ],
            body: .init(stringLiteral: sitemap.render())
        )
    }
}
