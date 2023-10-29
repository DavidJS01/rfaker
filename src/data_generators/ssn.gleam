//// This module contains functions
//// to generate or interact with a SSN
//// All SSNs are generated randomly.
import gleam/int 
import gleam/string_builder
import placeholder/placeholder
import gleam/io
import gleam/string

fn build_ssn(ssn: String) -> String {
    let random_num: Int = placeholder.generate_random_int(0, 10)
    string.append(ssn, int.to_string(random_num))
}

fn generate_fake_ssn(ssn: String, counter: Int) -> String {
    // I'll be real. I know StringBuilder is best for this
    // but I got no clue how to actually use it. rather
    // refactor later than spend too long on it now

    let generated_ssn: String = build_ssn(ssn)
    case counter {
        9 -> ssn
        _ -> generate_fake_ssn(generated_ssn, counter+1)
    }
}

pub fn get_fake_ssn() -> String {
    generate_fake_ssn("", 0)
}

pub fn main() -> Nil {
    let c: String = get_fake_ssn()
    io.print(c)

}
