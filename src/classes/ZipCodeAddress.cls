public class ZipCodeAddress {
    public String street;
    public String state;
    public String zipcode;
    public String city;

    override
    public String toString() {
        return JSON.serialize(this);
    }
}