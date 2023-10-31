import gleam/io
import gleam/list
import gleam/pair
import gleam/string
import data_types/data_types
import simplifile

@external(erlang, "file", "read_file")
fn read_file(value: String) -> a

/// read schema file as String
pub fn read_schema_file(file_path: String) -> String {
  // This is not safe code. I need to handle the 
  // error results from erlang stdlib.
  // erlang's read_file returns {ok, bitstring} for example
  let _ =
    read_file(file_path)
    |> pair.second()
}

fn parse_schema_file(file_contents: String) -> List(String) {
  string.replace(file_contents, each: "{", with: "")
  |> string.replace(each: " ", with: "")
  |> string.replace(each: "}", with: "")
  |> string.replace(each: "\"", with: "")
  |> string.replace(each: "\n", with: "")
  |> string.split(",")
}

fn validate_field(data_field: String) -> String {
  let assert Ok(parsed_field) = list.at(string.split(data_field, ":"), 1)
  data_types.validate_data_type(parsed_field)
}

fn get_headers(header_value: String) -> String {
  let assert Ok(header_value) = list.at(string.split(header_value, ":"), 0)
  |> io.debug
  // at here == ["patient_name:name", "patient_address:address", "patient_ssn:ssn"]
  header_value
}



pub fn main() ->  List(String) {
  let schema_file: String =
    read_schema_file("/home/chemdev/learning_gleam/rfaker/test.json")
  let parsed_schema_file: List(String) = parse_schema_file(schema_file)
  |> io.debug
  // list.each(parsed_schema_file, io.print)
  // //   io.print(y)
  // // list.map(parsed_schema_file, validate_field)
  // // |> list.each (io.println)
    // list.each(y, get_headers)

  // list.each(list.map(parsed_schema_file, get_headers), io.print)
}

fn write_file(val: String) -> Result(Nil, simplifile.FileError) {
  let assert Ok(Nil) = simplifile.append(val, to: "./hello_world.txt")


}






// read file -> for each k,v pair -> pull value and validate it is of correct type
// -> if failures, stop. -> else, write keys as header rows, generate fake data type
// -> as value, then write values in order into file

// repeat the above for a user supplied # of times
