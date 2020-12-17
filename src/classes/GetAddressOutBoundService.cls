/**
@author Henrique Nitatori
 */

public class GetAddressOutBoundService {
    ZipCodeAddressTransformer zipCodeAddressTransformer;

    public GetAddressOutBoundService() {
        this.zipCodeAddressTransformer = new ZipCodeAddressTransformer();
    }

    public ZipCodeAddress getAddress(String zipcode) {
        return this.zipCodeAddressTransformer.toAddress(findViaCepAddress(zipcode));
    }

    private ViaCepAddressResponse findViaCepAddress(String zipcode) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://viacep.com.br/ws/'+ zipcode +'/json/');
        request.setMethod('GET');

        Http htpp = new Http();

        HttpResponse response = htpp.send(request);

        String payload = response.getBody();

        if(response.getStatusCode() >= 400) throw new CalloutException('Service unavailable'); 

        System.debug(payload);

        return (ViaCepAddressResponse) JSON.deserialize(payload, ViaCepAddressResponse.class);
    }
}