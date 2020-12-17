/**
@author Henrique Nitatori
 */

public class GetAddressOutBoundService {

    public ViaCepAddressResponse getAddress(String zipcode) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://viacep.com.br/ws/'+ zipcode +'/json/');
        request.setMethod('GET');

        Http htpp = new Http();

        HttpResponse response = htpp.send(request);

        String payload = response.getBody();

        System.debug(payload);

        return (ViaCepAddressResponse) JSON.deserialize(payload, ViaCepAddressResponse.class);
    }
}