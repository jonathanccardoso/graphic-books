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
		
		Book newBook=new Book()
        newBook.name="nome"
        newBook.author="autor"
        newBook.datePublication="13/09/1999" // erro date
        newBook.genre="action"
		
		render(template:"/book/form", model: [book: newBook])
	}
	
    def save(){
		Book book = null
		if (params.id) {
			book = Book.get(params.id)
		} else {
			book = new Book()
		}		

        // name
        // author
        // datePublication
        // genre

		book.name = params.nome
		book.preco = params.preco.toDouble()

		book.validate()
		if (!book.hasErrors()){
			book.save(flush:true)
			render("Salvou com sucesso")
		}else{
			render("Ops... deu pau!")
		}
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
