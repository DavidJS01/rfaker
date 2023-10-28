//// This module contains functions for generating fake names
import data_sources/names
import placeholder/placeholder
import gleam/io

/// Randomly pull a fake name
/// can return a first, last, or full (first + last) name
pub fn get_fake_name(name_type: String) -> String {
    case name_type {
        "first" -> placeholder.get_random_item(names.first_names)
        "middle" -> placeholder.get_random_item(names.middle_names)
        "last" -> placeholder.get_random_item(names.last_names)
        "full" -> placeholder.get_random_item(names.first_names) <> " " <> placeholder.get_random_item(names.middle_names) <> " " <> placeholder.get_random_item(names.last_names)
    }

}


pub fn main() -> Nil {
    let x = get_fake_name("full")
    io.println(x)
}