grails.servlet.version = "2.5"
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6

grails.project.dependency.resolution = {

    inherits("global") {

    }
    log "error"
    checksums true
    legacyResolve false

    repositories {
        inherits true

        grailsPlugins()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        mavenRepo 'http://artifactory.milesburton.com/artifactory/remote-repos'
        mavenRepo 'http://artifactory.milesburton.com/artifactory/public'
        mavenRepo 'http://oss.sonatype.org/content/repositories/snapshots/'
    }

    def gebVersion = "0.9.0"
    def seleniumVersion = "2.21.0"

    dependencies {

        compile 'joda-time:joda-time:2.0',
                'com.popcornteam:restclient:1.0.130719.1658',
                "net.xelnaga:http-imposter:1.0.130719.1700"


        test("org.seleniumhq.selenium:selenium-htmlunit-driver:$seleniumVersion") {
            exclude "xml-apis"
        }

        test "org.seleniumhq.selenium:selenium-chrome-driver:$seleniumVersion",
                "org.seleniumhq.selenium:selenium-firefox-driver:$seleniumVersion",
                "org.spockframework:spock-grails-support:0.7-groovy-2.0",
                "org.gebish:geb-spock:$gebVersion",
                'org.objenesis:objenesis:1.2',
                'cglib:cglib:3.0',
                'org.grails:grails-test-suite-base:2.2.2'


    }

    plugins {

        runtime ":jquery:1.8.0",
                ":resources:1.1.6",
                ":cors:1.0.3",
                ":zipped-resources:1.0",
                ":cached-resources:1.0"

        build ":tomcat:$grailsVersion"

        compile ':cache:1.0.0',
                ":cache-headers:1.1.5",
                ":lesscss-resources:1.3.3"

        test(":spock:0.7") {
            exclude "spock-grails-support"
        }

        test ":geb:$gebVersion"
    }


}

environment {

    development {
        configureFakeSouthwalk()
    }

    test {
        configureFakeSouthwalk()
    }

    production {

        stats {
            api {
                endpoint = "http://wayservices.southwalk.gov.uk/"
            }
        }
    }

}

private void configureFakeSouthwalk(){

    stats {
        api {
            endpoint = "http://localhost:8080/fake/southwalk"
        }
    }

}

// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
        all:           '*/*',
        atom:          'application/atom+xml',
        css:           'text/css',
        csv:           'text/csv',
        form:          'application/x-www-form-urlencoded',
        html:          ['text/html','application/xhtml+xml'],
        js:            'text/javascript',
        json:          ['application/json', 'text/json'],
        multipartForm: 'multipart/form-data',
        rss:           'application/rss+xml',
        text:          'text/plain',
        xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
            'org.codehaus.groovy.grails.web.pages',          // GSP
            'org.codehaus.groovy.grails.web.sitemesh',       // layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping',        // URL mapping
            'org.codehaus.groovy.grails.commons',            // core / classloading
            'org.codehaus.groovy.grails.plugins',            // plugins
            'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate'
}

southwalk {
    baseUrl = "http://localhost:8080/bindays/fake/southwalk"

}

