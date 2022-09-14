// Copyright © 2022 Brian Drelling. All rights reserved.

import Plot
import Vapor

public extension Application {
    #if compiler(>=5.5) && canImport(_Concurrency)
    @available(macOS 12, iOS 15, watchOS 8, tvOS 15, *)
    func configureSitemap(path: String = "/sitemap.xml", sitemap: Sitemap) {
        // creates a dynamic sitemap
        self.middleware.use(SitemapMiddleware(
            path: path,
            sitemap: sitemap
        ))
    }
    #endif

    func configureSitemap(path: String = "/sitemap.xml", baseURL: String, paths: [String]) {
        let sitemap = Sitemap(
            .forEach(paths) { path in
                .url(.loc("\(baseURL)/\(path)"))
            }
        )
        self.configureSitemap(path: path, sitemap: sitemap)
    }
}
