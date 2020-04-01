package helloworld

class Book {

    String name
    String author
    Date datePublication
    String genre
    Double price

    // retrição
    static constraints = {
        name nullable:false, blank:false
        genre inList:["action", "terror", "suspense"]
        price min:new Double(0)
    }
}
