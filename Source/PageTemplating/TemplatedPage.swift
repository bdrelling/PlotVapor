import Plot

public protocol TemplatedPage: Page {
    associatedtype Template: PageTemplate
}

public extension TemplatedPage {
    var head: Node<HTML.DocumentContext> {
        Template.head(with: self)
    }
    
    var body: Node<HTML.DocumentContext> {
        Template.body(with: self)
    }
    
    func toHTML() -> HTML {
        Template.toHTML(with: self)
    }
}
