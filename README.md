# PlotVapor

**PlotVapor** is a small package that allows easily rendering [Plot](https://github.com/JohnSundell/Plot)-generated HTML within the  [Vapor](https://github.com/vapor/vapor) server-side Swift web framework.

## Usage

Fortunately, usage is straight-forward as this library only adds a few extension methods to keep things really simple.

Below, we add a new route for the `/home` path within the `configureRoutes(_:)` method and render a sample `HTML` object that doesn't do anything fancy.

```swift
func configureRoutes(_ app: Application) throws {
    app.get("home") { req -> EventLoopFuture<View> in
        let html = HTML(
            .head(
                .title("My website"),
                .stylesheet("styles.css")
            ),
            .body(
                .div(
                    .h1("My website"),
                    .p("Writing HTML in Swift is pretty great!")
                )
            )
        )
        
        return req.plot.render(html)
    }
}
```

### Minification

By default, all `HTML` is minified before it is rendered. To modify this behavior, use the `indentedBy` parameter to pass an `Indentation.Kind`. 

```swift
func configureRoutes(_ app: Application) throws {
    app.get("home") { req -> EventLoopFuture<View> in
        let html = HTML(
            // elements, etc.
        )
        
        return req.plot.render(html, indentedBy: .spaces(2))
    }
}
```

### Swift Concurrency

`PlotVapor` is also compatible with Swift 5.5's new async/await functionality.

```swift
func configureRoutes(_ app: Application) throws {
    app.get("home") { req async throws -> View in
        let html = HTML(
            // elements, etc.
        )
        
        return req.plot.render(html, indentedBy: .spaces(2))
    }
}
```

For more information on using Swift concurrency within Vapor, check out the [Vapor docs](https://docs.vapor.codes/4.0/async/). 
