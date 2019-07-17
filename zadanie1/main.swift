//
//  main.swift
//  zadanie1
//
//  Created by Egor Devyatov on 15.07.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import Foundation

// MARK: - Begin //начало проекта

let cmd = CmdLine()

if CommandLine.argc < 2 {
    print("Интерактивный режим работы!")
    print("Для вывода инфо по ключам работы с утилитой \(cmd.utilName)\nиспользуйте команду: \(cmd.utilName) -h")
} else {
    cmd.staticMode()
}
