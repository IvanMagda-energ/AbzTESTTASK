//
//  Constants.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 16.10.2024.
//

import SwiftUI
import RegexBuilder

enum Constants {
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
