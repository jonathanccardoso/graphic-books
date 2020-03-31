package helloworld

class Book {

    String name
    String author
    Date datePublication
    String genre

    // retrição
    static constraints = {
        genre inList:["action", "terror", "suspense"]
    }
}
