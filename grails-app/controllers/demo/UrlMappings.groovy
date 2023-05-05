package demo

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/employee/edit/$id"(controller: "employee", action: "update", method:"PUT")
//        "/employee"(controller: "employee", action: "save", method:"POST")

        "/"(controller: "home", view: 'index', action: 'index')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
