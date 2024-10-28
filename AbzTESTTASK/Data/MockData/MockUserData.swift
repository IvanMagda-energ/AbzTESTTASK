//
//  MockUserData.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 20.10.2024.
//

import Foundation

enum MockUserData {
    static let users = [userOne, userTwo, userThree, userFour, userFive]
    static let positions = [positionOne, positionTwo, positionThree, positionFour, positionFive]
    static let userOne = User(
        id: 1,
        name: "Jimmy Page",
        email: "jpage@mail.com",
        phone: "+380500000001",
        position: "Lead Guitarist",
        positionId: 1,
        registrationTimestamp: Int(Date.now.timeIntervalSince1970),
        photo: "jpage_photo.jpg"
    )

    static let userTwo = User(
        id: 2,
        name: "Freddie Mercury",
        email: "fmercury@mail.com",
        phone: "+380500000002",
        position: "Vocalist",
        positionId: 2,
        registrationTimestamp: Int(Date.now.timeIntervalSince1970),
        photo: "fmercury_photo.jpg"
    )

    static let userThree = User(
        id: 3,
        name: "Kurt Cobain",
        email: "kcobain@mail.com",
        phone: "+380500000003",
        position: "Rhythm Guitarist",
        positionId: 3,
        registrationTimestamp: Int(Date.now.timeIntervalSince1970),
        photo: "kcobain_photo.jpg"
    )

    static let userFour = User(
        id: 4,
        name: "David Bowie",
        email: "dbowie@mail.com",
        phone: "+380500000004",
        position: "Singer-Songwriter",
        positionId: 4,
        registrationTimestamp: Int(Date.now.timeIntervalSince1970),
        photo: "dbowie_photo.jpg"
    )

    static let userFive = User(
        id: 5,
        name: "Joan Jett",
        email: "jjett@mail.com",
        phone: "+380500000005",
        position: "Guitarist & Vocalist",
        positionId: 5,
        registrationTimestamp: Int(Date.now.timeIntervalSince1970),
        photo: "jjett_photo.jpg"
    )
    
    static let positionOne = Position(
        id: 1,
        name: "Lead Guitarist"
    )

    static let positionTwo = Position(
        id: 2,
        name: "Vocalist"
    )

    static let positionThree = Position(
        id: 3,
        name: "Rhythm Guitarist"
    )

    static let positionFour = Position(
        id: 4,
        name: "Singer-Songwriter"
    )

    static let positionFive = Position(
        id: 5,
        name: "Guitarist & Vocalist"
    )
}
