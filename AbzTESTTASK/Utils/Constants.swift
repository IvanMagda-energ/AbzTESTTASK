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
    /// - Accepts a sequence of 5 to 16 digits and may contain characters like `+`, `(`, `)`, or spaces.
    /// - Requires at least one digit at the end, ensuring basic validation.
    static let phoneRegex = Regex {
        Capture {
            One("+")
        }
        Capture {
            Repeat(5...16) {
                Capture {
                    CharacterClass(
                        .anyOf("+()"),
                        .digit,
                        (" "...".")
                    )
                }
            }
        }
        Capture {
            Repeat(count: 1) {
                CharacterClass(
                    .anyOf("+("),
                    .digit
                )
            }
        }
    }
}
