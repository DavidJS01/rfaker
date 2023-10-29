//// This module contains functions
//// to generate or interact with a SSN.
//// All SSNs are generated randomly.
import gleam/int 
import placeholder/placeholder
import gleam/string

fn build_ssn(ssn: String) -> String {
    let random_num: Int = placeholder.generate_random_int(0, 10)
    string.append(ssn, int.to_string(random_num))
}

fn generate_fake_ssn(ssn: String, counter: Int) -> String {
    // todo: use StringBuilder
    // starting with an empty string, "", add a random
    // num to the string until the length is 9 (valid ssn)

    let generated_ssn: String = build_ssn(ssn)
    case counter {
        9 -> ssn
        _ -> generate_fake_ssn(generated_ssn, counter+1)
    }
}

/// Return a random SSN as a string
pub fn get_fake_ssn() -> String {
    generate_fake_ssn("", 0)
}

