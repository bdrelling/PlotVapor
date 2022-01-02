# PlotVapor

**PlotVapor** is a small package that allows easily rendering [Plot](https://github.com/JohnSundell/Plot)-generated HTML within the  [Vapor](https://github.com/vapor/vapor) server-side Swift web framework.

## Usage

Usage is straight-forward as this library only adds a few extension methods on top of `Plot` to allow it to hook into `Vapor`.

We can add a new route for the `/home` path within the `configureRoutes(_:)` method and render a sample `HTML` object that doesn't do anything fancy.

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
                    .h1("Hello, world!"),
                    .p("Writing HTML in Swift is pretty great!")
                )
            )
        )
        
        return req.plot.render(html)
    }
}
```

To keep your routing logic clean, this package also include the `Page` and `PageTemplate` protocols.

### Page and PageTemplate

Conform to the `Page` protocol to quickly and easily define a page. 

```swift
struct MyPage: Page {
    let title = "My website"
    
    var content: Component {
        Div {
            H1("Hello, world!")
            Paragraph("Writing HTML in Swift is pretty great!")
        }
    }
}
```

The example above will only render a simple page with no styling, which is impractical for most use cases. As such, when you inevitably need to modify the `<head>` element, simply override the `head` property of `Page`, like so. This example will render an HTML page identical to the first snippet in this README.

```swift
struct MyPage: Page {
    let title = "My website"
    
    var head: Node<HTML.DocumentContext> {
        .head(
            .title(self.title),
            .stylesheet("styles.css")
        )
    }
    
    var content: Component {
        Div {
            H1("Hello, world!")
            Paragraph("Writing HTML in Swift is pretty great!")
        }
    }
}
```

You can also override the `body` property directly as well, in the event you need to add `<script>` elements and so on. The default implementation of that property looks like this the following.

```swift
struct MyPage: Page {
    ...
    
    var body: Node<HTML.DocumentContext> {
        .body(
            .component(page.content)
        )
    }

    ...
}

```

:warning: The reason the `head`, `body`, and `content` properties are all handled differently is due to the fact that, at time of writing, `Plot` doesn't provide usage of the `Component` syntax for `<head>` and `<body>` elements. For more information, see the [Components](https://github.com/JohnSundell/Plot#components) section of the `Plot` README.

### PageTemplate

You'll probably want to include than one page on your site, and you won't want to override the `head` and `body` properties for every single page you create as it will lead to duplicated, hard-to-maintain code.

Instead, you can simply create a reusable `PageTemplate`. The following snippet of `DefaultPageTemplate` is included within `PlotVapor`, primarily to serve as an example.


```swift
public struct DefaultPageTemplate: PageTemplate {
    public static func head(with page: Page) -> Node<HTML.DocumentContext> {
        .head(
            .title(page.title)
        )
    }

    public static func body(with page: Page) -> Node<HTML.DocumentContext> {
        .body(
            .component(page.content)
        )
    }
}
```

Then, instead of conforming to `Page`, you can conform to `TemplatedPage` and define the `Template` `typealias` like so.

```swift
struct MyPage: TemplatedPage {
    typealias Template = DefaultPageTemplate

    ...
}
```

And for even _more_ convenience, you can define a global default template like so. With this, you'll only need to override the `Template` `typealias` for pages that use a different template.

```swift
extension TemplatedPage {
    typealias Template = MyPageTemplate
}
```

## Additional Notes

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
