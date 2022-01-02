import Plot

public protocol TemplatedPage: Page {
    associatedtype Template: PageTemplate
}

public extension TemplatedPage {
    var head: Node<HTML.DocumentContext> {
        Template.self.init().head(with: self)
    }
    
    var body: Node<HTML.DocumentContext> {
        Template.self.init().body(with: self)
    }
    
    func toHTML() -> HTML {
        Template.self.init().toHTML(with: self)
    }
}
