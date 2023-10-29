import data_generators/addresses
import data_generators/ssn
import data_generators/names

pub fn route_data_generator(data_type: String) -> String {
    case data_type {
        "address" -> addresses.get_fake_address()
        "name" -> names.get_fake_name("full")
        "ssn" -> ssn.get_fake_ssn()
    }
}
