import gleam/io
import gleam/int
import gleam/list
import gleam/pair
import gleam/string
import data_types/data_types

@external(erlang, "file", "read_file")
fn read_file(value: String) -> a

/// read schema file as String
pub fn read_schema_file(file_path: String) -> String {
  // This is not safe code. I need to handle the 
  // error results from erlang stdlib.
  // erlang's read_file returns {ok, bitstring} for example
  let x = read_file(file_path)
    |> pair.second()
}

fn parse_schema_file(file_contents: String) -> List(String) {
  string.replace(file_contents, each: "{", with: "")
  |> string.replace(each: "}", with: "")
  |> string.replace(each: "\"", with: "")
  |> string.split(",")
}

fn validate_field(data_field: String) -> String {
    let assert Ok(parsed_field) = list.at(string.split(data_field, ":"), 1)
    data_types.validate_data_type(parsed_field)
}

fn get_header_value(header_value: String) -> String {
    let assert Ok(header_value) = list.at(string.split(header_value, ":"), 0)
    header_value <> ","

}

fn get_values(x: String) -> String {

}

pub fn main() -> Nil {
  let x: String =
    read_schema_file("/home/chemdev/learning_gleam/rfaker/test.json")
  let y: List(String) = parse_schema_file(x)


//   io.print(y)
  list.each(list.map(y, validate_field), io.println)
  list.each(y, io.println)
//   list.each(y, get_headers)

  
  list.each(list.map(y, get_header_value), io.print)
}
// read file -> for each k,v pair -> pull value and validate it is of correct type
// -> if failures, stop. -> else, write keys as header rows, generate fake data type
// -> as value, then write values in order into file

// repeat the above for a user supplied # of times
