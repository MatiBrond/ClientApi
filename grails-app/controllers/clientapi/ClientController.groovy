package clientapi

import groovy.json.JsonSlurper

class ClientController {

    def index() {
        def url = new URL("https://api.mercadolibre.com/sites")
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozilla/5.0")
        JsonSlurper json = new JsonSlurper()
        def result = json.parse(connection.getInputStream())
        [result: result]

    }


    def getP(){
        def url = new URL("localhost:8070/agencies/$params")
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozilla/5.0")
        JsonSlurper json = new JsonSlurper()
        def re = json.parse(connection.getInputStream())
        [re: re]

    }






    def getResult(String url){


    }

}
