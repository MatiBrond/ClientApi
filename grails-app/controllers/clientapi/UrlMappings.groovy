package clientapi

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"Client")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
