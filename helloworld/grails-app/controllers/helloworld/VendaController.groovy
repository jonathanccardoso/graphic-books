package helloworld

import grails.converters.JSON

class VendaController {

    // call service
    def vendaService

    def index() {
        def books = Book.list()
        render(model: [books: books], view: "index")
    }

    def save(){
        def book = params.id
        def quantity = params.quantity

        // map for messages
        def message = [:]

        //este try...catch é usado para receber possíveis Exceptions do VendaService
        try {
            //chama o service para salvar a venda (pedido)
            vendaService.save(params.name, params.email, params.id.toList(), params.quantity.toList())
            message += ["response":"OK"]
        }catch(Exception excecao){
            //se o método salvar do Service retornar alguma exceção, a message da exceção será enviada do controller para a view
            message += ["response":excecao.message]
        }

        //envia o mapa "message" para a view
        render message as JSON
    }

}
