import data_sources/addresses
import placeholder/placeholder
import gleam/io
import gleam/int

fn get_fake_address_component(component: String) -> String {
  case component {
    "state" -> placeholder.get_random_item(addresses.states)
    "street_name" -> placeholder.get_random_item(addresses.street_names)
    "zip_code" ->
      int.to_string(placeholder.get_random_item(addresses.zip_codes))
    "city" -> placeholder.get_random_item(addresses.cities)
    "street_number" ->
      int.to_string(placeholder.get_random_item(addresses.street_number))
  }
}

/// Generate a fake address in the format street_number 
/// street name, city, state, zip_code
/// example: 61 S 980 W, Mary Esther, NC, 12345
pub fn get_fake_address() -> String {
  let state: String = get_fake_address_component("state")
  let street_name: String = get_fake_address_component("street_name")
  let zip_code: String = get_fake_address_component("zip_code")
  let city: String = get_fake_address_component("city")
  let street_number: String = get_fake_address_component("street_number")

  street_number <> " " <> street_name <> ", " <> city <> ", " <> state <> ", " <> zip_code
}
