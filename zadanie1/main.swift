//
//  main.swift
//  zadanie1
//
//  Created by Egor Devyatov on 15.07.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import Foundation


// MARK: - Begin //начало проекта

// массив хранения всех юзеров
var userBase: Array<User> = [User(soname: "Admin", name: "Adm", telephoneNumber: "+7-989-999-8877")]

let cmd = CmdLine()

if CommandLine.argc < 2 {
    print("Интерактивный режим работы!")
    print("Для вывода инфо по ключам работы с утилитой \(cmd.utilName)\nиспользуйте команду: \(cmd.utilName) -h")
} else {
    cmd.staticMode()
}
