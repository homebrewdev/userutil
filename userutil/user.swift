//
//  user.swift
//  zadanie1
//
//  Created by Egor Devyatov on 15.07.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

// MARK: - User Class //класс user
import Foundation

class User {
    let name: String
    let soname: String
    let telNumber: String
    // инициализатор
    init(soname: String, name: String, telephoneNumber: String) {
        self.name = name
        self.soname = soname
        self.telNumber = telephoneNumber
    }
}
