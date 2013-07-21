class UrlMappings {

    static mappings = {

        "/postcode/$postcode"            (controller: "postcode", action: 'postcode')

        "/"                             (view: "/index")
        "500"                           (view: '/error')
    }
}
