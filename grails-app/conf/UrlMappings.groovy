class UrlMappings {

    static mappings = {

        "/postcode/$postcode"            (controller: "postcode", action: 'postcode')
        "/binDays/$addressId"            (controller: "binDays", action: "dates")
        "/calendar/$type/$day"           (controller: "calendarEntry", action:'create')

        "/"                              (controller: 'home', action:'home')
        "500"                            (view: '/error')
    }
}
