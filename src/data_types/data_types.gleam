import gleam/string
import gleam/io
import data_types/router
import data_generators/addresses
import data_generators/ssn
import data_generators/names

pub type DataTypes {
  Address
  Name
  SSN
}

pub type DataTypeError {
  InvalidDataType
}

/// attempt to map a provided string to a
/// valid data type. returns either ok(DataTypes.type)
/// or Error(Reason)
fn parse_data_type(data_type: String) -> Result(DataTypes, DataTypeError) {
  let cleaned_data_type =
    string.lowercase(data_type)
    |> string.trim()

  case cleaned_data_type {
    "address" -> Ok(Address)
    "name" -> Ok(Name)
    "ssn" -> Ok(SSN)
    _ -> Error(InvalidDataType)
  }
}

/// ok i know this is bad but I need to review handling
/// errors
fn exit_program(failed_data_type: String) -> Nil {
  io.println("ERROR: Bad data type " <> failed_data_type)
  io.println("---> Expected one of Address, Name, SSN")
  panic()
}

fn route_data_generator(data_type: DataTypes) -> String {
  case data_type {
    Address -> addresses.get_fake_address()
    Name -> names.get_fake_name("full")
    SSN -> ssn.get_fake_ssn()
  }
}

/// given a data type as a string, assert that it matches
/// one enum in type DataTypes (address, name, etc)
/// if not crash the application
pub fn validate_data_type(supplied_data_type) -> String {
  let parsed_type = parse_data_type(supplied_data_type)

  case parsed_type {
    Ok(x) -> route_data_generator(x)
    Error(InvalidDataType) -> panic()
  }
}
