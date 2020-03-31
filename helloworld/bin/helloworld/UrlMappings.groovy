package helloworld

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        // "/api/info"(controller: 'ApiDoc')
        // "/apidoc/$action?/$id?"(controller: "apiDoc", action: "getDocuments")
        // "/authors"(resources: 'author')
        
        // "/"(controller: "swagger", action: "api")
        "/helloworldapi"(resources:'helloworld')
        // delete "/$controller/$id(.$format)?"(action:"delete")
        // get "/$controller(.$format)?"(action:"index")
        // get "/$controller/$id(.$format)?"(action:"show")
        // post "/$controller(.$format)?"(action:"save")
        // put "/$controller/$id(.$format)?"(action:"update")
        // patch "/$controller/$id(.$format)?"(action:"patch")

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
