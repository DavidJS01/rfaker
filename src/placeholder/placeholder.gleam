//// This file holds extra functions
import gleam/int 
import gleam/list

/// Given a list of length x, randomly return
/// a value
pub fn get_random_item(data_list: List(a)) -> a {
    let list_length: Int = list.length(data_list)
    let random_index: Int = int.random(0, list_length)

    let assert Ok(item) = list.at(data_list, random_index)
    item
}

pub fn generate_random_int(start: Int, stop: Int) -> Int {
    int.random(start, stop)
}