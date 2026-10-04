
# 📚 Swift Library Management System

A robust command-line application built in Swift demonstrating core **Object-Oriented Programming (OOP)** principles, safe memory/state management, and practical data handling.

---

## 🚀 Key Features

* **CRUD Operations:** Complete flow to add, view, update, and remove books from the library catalogue.
* **Flexible Search Engine:** Case-insensitive search allowing lookups by Book ID, Title, or Author.
* **Transaction & Inventory Logic:** Integrated selling flow that calculates totals, issues receipts, and updates stock quantities safely.
* **Swift Safety Standards:** Built with safe optional handling (`guard let`, `if let`) and conforms to the `CustomStringConvertible` protocol to avoid runtime crashes.

---

## 🛠️ Built With

* **Language:** Swift 5+
* **Paradigm:** Object-Oriented Programming (OOP)
* **Tools:** Xcode / Terminal (macOS / Linux)

---

## 📋 Code Architecture

* **`Book` Class:** Encapsulates book attributes (`id`, `title`, `author`, `price`, `quantity`) with custom string formatting.
* **`Library` Class:** Manages the book collection in memory and provides public APIs for book operations and queries.

---

## 💻 How to Run

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/meaadwithy/library-system-swift.git](https://github.com/meaadwithy/library-system-swift.git)
   cd library-system-swift
