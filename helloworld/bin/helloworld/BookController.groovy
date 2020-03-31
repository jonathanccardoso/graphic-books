package helloworld

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class BookController {

    BookService bookService

    def index () {
        def list = Book.list()
        render(view:"/book/index", model: [books: list])
    }

    def create(){
		Book newBook = new Book()
        newBook.name = ""
        newBook.author = ""
        newBook.datePublication = new Date() // erro date
        newBook.genre = ""
		
		render(template:"/book/form", model: [book: newBook])
	}

    def change(){
		Book book = Book.get(params.id)
		render(template:"/book/form", model: [book: book])
	}

    def list(){
		def list = Book.list()
		render(template:"/book/list", model:[books: list])
	}
	
    def save(){
		Book book = null
		if (params.id) {
			book = Book.get(params.id)
		} else {
			book = new Book()
		}		

		book.name = params.name
		book.author = params.author
		// book.datePublication = Date.parse(params.datePublication)
        // book.datePublication = Date.parse("d/M/yyyy H:m:s", params.datePublication)
        book.datePublication = Date.parse("MM/dd/yy", params.datePublication)
        // book.datePublication = Date.parse("EEE MMM d HH:mm:ss zzz yyyy", params.datePublication)
		book.genre = params.genre

		book.validate()
		if (!book.hasErrors()){
            // save on database
			book.save(flush:true)
			render("Save with sucess!")
		}else{
			render("Wow... some wrong!")
		}
	}

    def delete(){
		Book book = Book.get(params.id)
		book.delete(flush:true)
		
		def list = Book.list()
		render(template:"/book/list", model:[books: list])
	}

    // API

    // BookService bookService

    // static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    // def index(Integer max) {
    //     params.max = Math.min(max ?: 10, 100)
    //     respond bookService.list(params), model:[bookCount: bookService.count()]
    // }

    // def show(Long id) {
    //     respond bookService.get(id)
    // }

    // def create() {
    //     respond new Book(params)
    // }

    // def save(Book book) {
    //     if (book == null) {
    //         notFound()
    //         return
    //     }

    //     try {
    //         bookService.save(book)
    //     } catch (ValidationException e) {
    //         respond book.errors, view:'create'
    //         return
    //     }

    //     request.withFormat {
    //         form multipartForm {
    //             flash.message = message(code: 'default.created.message', args: [message(code: 'book.label', default: 'Book'), book.id])
    //             redirect book
    //         }
    //         '*' { respond book, [status: CREATED] }
    //     }
    // }

    // def edit(Long id) {
    //     respond bookService.get(id)
    // }

    // def update(Book book) {
    //     if (book == null) {
    //         notFound()
    //         return
    //     }

    //     try {
    //         bookService.save(book)
    //     } catch (ValidationException e) {
    //         respond book.errors, view:'edit'
    //         return
    //     }

    //     request.withFormat {
    //         form multipartForm {
    //             flash.message = message(code: 'default.updated.message', args: [message(code: 'book.label', default: 'Book'), book.id])
    //             redirect book
    //         }
    //         '*'{ respond book, [status: OK] }
    //     }
    // }

    // def delete(Long id) {
    //     if (id == null) {
    //         notFound()
    //         return
    //     }

    //     bookService.delete(id)

    //     request.withFormat {
    //         form multipartForm {
    //             flash.message = message(code: 'default.deleted.message', args: [message(code: 'book.label', default: 'Book'), id])
    //             redirect action:"index", method:"GET"
    //         }
    //         '*'{ render status: NO_CONTENT }
    //     }
    // }

    // protected void notFound() {
    //     request.withFormat {
    //         form multipartForm {
    //             flash.message = message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])
    //             redirect action: "index", method: "GET"
    //         }
    //         '*'{ render status: NOT_FOUND }
    //     }
    // }
}
