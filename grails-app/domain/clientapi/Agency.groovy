package clientapi

class Agency {
    Address address;
    String agency_code;
    String correspondent_id;
    String descripcion;
    boolean disabled;
    String distance;
    String id_agency;
    String payment_method_id;
    String phone;
    String site_id;
    boolean terminal;

    static constraints = {

        address nullable : false
        agency_code  nullable : false

    }
}
