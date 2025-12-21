namespace task_3
{
    public class Book
    {
        public int id;
        public string Title;
        public string Author;
        public bool isBorrowed;
        public Book(int id, string title, string author , bool Avilability)
        {
            this.id = id;
            Title = title;
            Author = author;
            isBorrowed = Avilability;
        }
    }

    public class Library
    {
        List<Book> books;

        public Library()
        {
            books = new List<Book>();
        }
        public void AddBook(int ID , string title, string author , bool avilability)
        {
            for (int i = 0; i < books.Count; i++)
            {
                if (books[i].id == ID)
                {
                    Console.WriteLine("This book ID already exists!");
                    return;
                }
            }
            Book book = new Book(ID , title , author , avilability);
            books.Add(book);
        }
        public void SearchBook (string title)
        {
            for (int i = 0; i < books.Count; i++)
            {
                if (books[i].Title.ToLower() == title.ToLower())
                {
                    Console.WriteLine($"Book found: {books[i].Title} by {books[i].Author}");
                    return;
                } 
            }
            Console.WriteLine("Book not found");
        }
        public void BorrowBook (string title)
        {
            for (int i = 0; i < books.Count; i++)
            {
                if(books[i].isBorrowed)
                {
                    Console.WriteLine("Sorry, this book is already borrowed.");
                    return;
                }
                else if (books[i].Title.ToLower() == title.ToLower())
                {
                    books[i].isBorrowed = true;
                    Console.WriteLine($"You have borrowed: {books[i].Title}");
                    return;
                }
            }
            Console.WriteLine("Book not found");
        }
        public void ReturnBook(string title)
        {
            for (int i = 0; i < books.Count; i++)
            {
                if (books[i].Title.ToLower() == title.ToLower())
                {
                    if (!books[i].isBorrowed)
                    {
                        Console.WriteLine("This book was not borrowed.");
                    }
                    else
                    {
                        books[i].isBorrowed = false;
                        Console.WriteLine($"You have returned successfully: {books[i].Title}");
                    }
                    return;
                }
            }
            Console.WriteLine("Book not found");
        }

        public void DisplayBooks()
        {
            for (int i = 0; i < books.Count; i++)
            {
                Console.WriteLine($"(Book {books[i].id})\n\tID: {books[i].id}\n\tTitle: {books[i].Title}\n\tAuthor: {books[i].Author}\n\tBorrowed: {books[i].isBorrowed}\n");
            }
        }

    }

    internal class Program
    {
        static void Main(string[] args)
        {
            char choice;
            Library library = new Library();
            library.AddBook(1, "The Great Gatsby", "F. Scott Fitzgerald" , false);
            library.AddBook(2, "To Kill a Mockingbird", "Harper Lee" , false);
            library.AddBook(3, "1984", "George Orwell", false);

            while (true)
            {
                Console.WriteLine("\t\t\t((welcom to our library app ))");
                Console.WriteLine("A - Add book");
                Console.WriteLine("D - Display our books");
                Console.WriteLine("S - Search book");
                Console.WriteLine("B - Borrow book");
                Console.WriteLine("R - Return book");
                Console.WriteLine("Q - Quit");
                Console.Write("Enter your choice: ");
                choice = Convert.ToChar(Console.ReadLine().ToUpper());

                switch (choice)
                {
                    case 'A':
                        Console.Clear();
                        int bookID; string bookTitle, bookAuthor;
                        Console.Write("Enter the book id : ");
                        bookID = Convert.ToInt32(Console.ReadLine());
                        Console.Write("Enter the book title : ");
                        bookTitle = Console.ReadLine();
                        Console.Write("Enter the book author : ");
                        bookAuthor = Console.ReadLine();
                        library.AddBook(bookID, bookTitle, bookAuthor, false);
                        Console.WriteLine("book has been added");
                        break;
                    case 'D':
                        Console.Clear();
                        library.DisplayBooks();
                        break;
                    case 'S':
                        Console.Clear();
                        string searchTitle;
                        Console.Write("Enter the book's title : ");
                        searchTitle = Console.ReadLine();
                        library.SearchBook(searchTitle);
                        break;
                    case 'B':
                        Console.Clear();
                        string borrowTitle;
                        Console.Write("Enter the book's title : ");
                        borrowTitle = Console.ReadLine();
                        library.BorrowBook(borrowTitle);
                        break;
                    case 'R':
                        Console.Clear();
                        string returnTitle;
                        Console.Write("Enter the book's title : ");
                        returnTitle = Console.ReadLine();
                        library.ReturnBook(returnTitle);
                        break;
                    case 'Q':
                        Console.Clear();
                        Console.WriteLine("Thank you for using our library app!");
                        return;
                    default:
                        Console.Clear();
                        Console.WriteLine("Invalid choice");
                        break;
                }
                Console.WriteLine("\n--------------------------------------------------------------------------------------\n");
            }
        }
    }
}
