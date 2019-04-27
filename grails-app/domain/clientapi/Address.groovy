package clientapi

class Address {
    String address_line;
    String city;
    String country;
    String location;
    String other_info;
    String state;
    String zip_code;

    static constraints = {
        address_line nullable : false
        city nullable : false


    }
}
