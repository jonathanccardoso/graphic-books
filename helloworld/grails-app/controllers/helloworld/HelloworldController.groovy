// package helloworld

// class HelloController {

//     def index() { 
//         render "Hello World!"
//     }
// }

package helloworld

import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import helloworld.HelloWorld

import grails.core.GrailsApplication
import grails.util.Environment
import grails.plugins.*

@Api(value = "helloworld", description = "Endpoint for application Hello World")
class HelloworldController {
	static responseFormats = ['json', 'xml']

	@ApiOperation(value = "doStuff", nickname = "doStuff", response = HelloWorld.class)
    def index() { 		
		HelloWorld helloWorld = new HelloWorld(helloworld:"Hello world GET (listing)")
		respond helloWorld
	}
	
	def show() {
		HelloWorld helloWorld = new HelloWorld(helloworld:"Hello world GET")
		respond helloWorld
	}
	
	def update() {
		HelloWorld helloWorld = new HelloWorld(helloworld:"Hello world PUT")
		respond helloWorld
	}
	
	def delete() {
		HelloWorld helloWorld = new HelloWorld(helloworld:"Hello world DELETE")
		respond helloWorld
	}
	
	def save() {
		HelloWorld helloWorld = new HelloWorld(helloworld:"Hello world POST")
		respond helloWorld
	}
}
