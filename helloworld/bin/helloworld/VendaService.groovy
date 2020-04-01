package helloworld

import grails.gorm.transactions.Transactional

@Transactional
class VendaService {

    def save(String name, String email, List books, List quantitys) {
        Order order = new Order()
        order.dateTime = new Date()

        quantitys.eachWithIndex { qtde, i ->
            if (qtde?.toInteger() > 0) {
                Integer idBook = books[i].toInteger()

                Book book = Book.get(idBook)
                order.dateTime = new Date()
                order.saleTotal = book.price
            }
        }
    }
}
