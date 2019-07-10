public class AnimalLocator{
    public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        Map<String, Object> animal = new Map<String, Object>();

        if (response.getStatusCode() == 200) {

            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            animal = (Map<String, Object>)result.get('animal');
            System.debug('Received the following animal: ' + animal);
        }
        return (String)animal.get('name');
    }
       
}