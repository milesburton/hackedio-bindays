class UrlMappings {

    static mappings = {

        "/postcode/$postcode"            (controller: "postcode", action: 'postcode')
        "/binDays/$addressId"            (controller: "binDays", action: "dates")

        "/"                              (controller: 'home', action:'home')
        "500"                            (view: '/error')
    }
}
