package bindays

import com.popcornteam.restclient.RestClient
import mb.QueryStringBuilderService

class PostcodeController {

    RestClient southwalkClient
    QueryStringBuilderService queryStringBuilderService

    def postcode(){

        String html = southwalkClient.get(queryStringBuilderService.asResource('findAddress.asp', ['postcode':params.postcode])).bodyAsString

        render(text:html)
    }
}


