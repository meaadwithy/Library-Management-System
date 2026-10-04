
import Foundation

class Book: CustomStringConvertible {
    var id: Int
    var title: String
    var author: String
    var price: Double?
    var quantity: Int?
    
    init(id: Int, title: String, author: String, price: Double? = nil, quantity: Int? = nil) {
        self.id = id
        self.title = title
        self.author = author
        self.price = price
        self.quantity = quantity
    }
    
    // بروتوكول Swift القياسي لطباعة الكائنات بأمان وبدون خطر الـ Crash
    var description: String {
        let priceStr = price != nil ? "\(price!)$" : "N/A"
        let quantityStr = quantity != nil ? "\(quantity!)" : "N/A"
        return "ID: \(id) | Title: \(title) | Author: \(author) | Price: \(priceStr) | Quantity: \(quantityStr)"
    }
}

class Library {
    private var books: [Book] = []
    
    func addBook(id: Int, title: String, author: String, price: Double? = nil, quantity: Int? = nil) {
        let book = Book(id: id, title: title, author: author, price: price, quantity: quantity)
        books.append(book)
    }
    
    func deleteBook(id: Int) {
        if let index = books.firstIndex(where: { $0.id == id }) {
            books.remove(at: index)
            print("The book has been deleted.")
        } else {
            print("The book has not been found.")
        }
    }
    
    func editBook(id: Int, newTitle: String, newAuthor: String, newPrice: Double?, newQuantity: Int?) {
        guard let book = books.first(where: { $0.id == id }) else {
            print("The book has not been found.")
            return
        }
        
        book.title = newTitle
        book.author = newAuthor
        book.price = newPrice
        book.quantity = newQuantity
        print("The book has been successfully updated.")
    }
    
    func showBooks() {
        if books.isEmpty {
            print("The library is currently empty.")
            return
        }
        books.forEach { print($0) }
    }
    
    func lookForBook(id: Int? = nil, title: String? = nil, author: String? = nil) {
        let foundBook = books.first { book in
            if let id = id, book.id == id { return true }
            if let title = title, book.title.localizedCaseInsensitiveContains(title) { return true }
            if let author = author, book.author.localizedCaseInsensitiveContains(author) { return true }
            return false
        }
        
        if let book = foundBook {
            print("Book Found:\n\(book)")
        } else {
            print("No matching book found.")
        }
    }
    
    func sellBook(id: Int, quantityToBuy: Int) {
        guard let book = books.first(where: { $0.id == id }) else {
            print("Book not found.")
            return
        }
        
        guard let currentQuantity = book.quantity, let price = book.price else {
            print("Cannot process sale: Book information is incomplete.")
            return
        }
        
        guard currentQuantity >= quantityToBuy else {
            print("Insufficient stock for: \(book.title). Available: \(currentQuantity)")
            return
        }
        
        let total = price * Double(quantityToBuy)
        book.quantity = currentQuantity - quantityToBuy
        
        print("""
        --- Receipt ---
        Book: \(book.title)
        Quantity: \(quantityToBuy)
        Total Price: \(total)$
        Remaining Stock: \(book.quantity!)
        ----------------
        """)
    }
}

// MARK: - Testing
let library = Library()
library.addBook(id: 1, title: "Start with Why", author: "Simon Sinek", price: 80.0, quantity: 10)
library.addBook(id: 2, title: "But How Do It Know", author: "J. Clark Scott", price: 59.9, quantity: 5)
library.addBook(id: 3, title: "Clean Code", author: "Robert Cecil Martin", price: 50.0, quantity: 8)
library.addBook(id: 4, title: "Zero to One", author: "Peter Thiel", price: 45.0, quantity: 3)
library.addBook(id: 5, title: "You Don't Know JS", author: "Kyle Simpson", price: 39.9, quantity: 3)

library.showBooks()
print("\n")

library.lookForBook(author: "Kyle Simpson")
print("\n")

library.sellBook(id: 3, quantityToBuy: 4)
print("\n")
library.sellBook(id: 4, quantityToBuy: 4)
library.sellBook(id: 6, quantityToBuy: 5)
