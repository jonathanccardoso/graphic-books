package helloworld

class Order {

	Date dateTime
	Double saleTotal
		
	// static hasMany = [itens: ItemPedido]
	
    static constraints = {
		saleTotal min: new Double(0)
    }
	
}
