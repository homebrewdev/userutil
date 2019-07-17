//
//  consoleIO.swift
//  userutil
//
//  Created by Egor Devyatov on 17.07.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import Foundation

// MARK: - Console Class //класс консоль
class ConsoleIO {
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)")
        case .error:
            fputs("Error: \(message)\n", stderr)
        }
    }
    
    // вывод списка всех команд
    func printUsage() {
        
        let executableName = cmd.utilName
        
        writeMessage("Список команд")
        writeMessage("Добавление нового пользователя:")
        writeMessage("\(executableName) -a Имя Фамилия Номер_телефона")
        writeMessage("Удаление пользователя по фамилии:")
        writeMessage("\(executableName) -d Фамилия")
        writeMessage("Показать список всех команд:")
        writeMessage("\(executableName) -h")
    }
    
    
    func getInput() -> String {
        // 1
        let keyboard = FileHandle.standardInput
        // 2
        let inputData = keyboard.availableData
        // 3
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        // 4
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
    
}

enum OutputType {
    case error
    case standard
}

// перечисление опций
enum OptionType: String {
    case deleteUser = "d"
    case addNewUser = "a"
    case viewAllUsers = "v"
    case help = "h"
    case unknown
    
    init(value: String) {
        switch value {
        case "a": self = .addNewUser
        case "d": self = .deleteUser
        case "v": self = .viewAllUsers
        case "h": self = .help
        default: self = .unknown
        }
    }
}
