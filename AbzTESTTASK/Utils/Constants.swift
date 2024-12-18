//
//  Constants.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 16.10.2024.
//

import SwiftUI
import RegexBuilder

enum Constants {
    /// Regular expression for validating email addresses.
    /// - Ensures that the email starts with one or more word characters (letters, numbers, underscore) or `-`/`.` characters.
    /// - Contains an `@` symbol, followed by one or more alphabetic characters (lowercase a-z) or `-`.
    /// - Ends with a dot-separated domain name of 2 to 10 alphabetic characters (lowercase a-z).
    static let emailRegex = Regex {
        Anchor.startOfLine
        OneOrMore {
            CharacterClass(
                .anyOf("-."),
                .word
            )
        }
        "@"
        OneOrMore {
            CharacterClass(
                .anyOf("-"),
                ("a"..."z")
            )
        }
        One(".")
        Repeat(2...10) {
            CharacterClass(
                .anyOf("-"),
                ("a"..."z")
            )
        }
        Anchor.endOfLine
    }
    
    /// Regular expression for validating phone numbers.
    /// - Allows phone numbers to start with a `+` symbol.
    /// - Country code should be 380
    /// - Requires 12 digits
    static let phoneRegex = Regex {
        Capture {
            One("+")
        }
        Capture {
            One("380")
        }
        Capture {
            Repeat(count: 9) {
                CharacterClass(.digit)
            }
        }
    }
}
