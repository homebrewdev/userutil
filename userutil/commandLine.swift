//
//  commandLine.swift
//  zadanie1
//
//  Created by Egor Devyatov on 15.07.2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import Foundation

class CmdLine {
    
    let consoleIO = ConsoleIO()
    
    let utilName = "userutil"
    
    let userDefaultsBase = UserDefaults.standard
    
    //метод getOption принимает аргумент ключа и возвращает кортеж из ключа и его описания
    func getOption(_ option: String) -> (option:OptionType, value: String) {
        return (OptionType(value: option), option)
    }
    
    // функция распознает какой ключ и аргумент указан
    func staticMode() {
        //1
        let argCount = CommandLine.argc
        //2
        let argument = CommandLine.arguments[1]
        //3
        let (option, value) = getOption(argument.substring(from: argument.index(argument.startIndex, offsetBy: 1)))
        //4
        consoleIO.writeMessage("аргумент: \(argCount) Ключ: \(option) Значение: \(value)")
    
    switch option {
    // добавить пользователя
    case .addNewUser:
        if argCount != 5 {
            if argCount > 5 {
                consoleIO.writeMessage("Слишком много аргументов для ключа \(option.rawValue)", to: .error)
            } else {
                consoleIO.writeMessage("Указаны не все аргументы для ключа \(option.rawValue)", to: .error)
            }
            consoleIO.printUsage()
        } else {
            // работаем с переданными аргументами - добавляем юзера в базу
            let soname = CommandLine.arguments[2]
            let name = CommandLine.arguments[3]
            let phoneNumber = CommandLine.arguments[4]
            
            addUserToBase(soname: soname, name: name, phoneNumber: phoneNumber)
            
            // выводим в консоль
            consoleIO.writeMessage("Добавлен пользователь:")
            consoleIO.writeMessage("Фамилия: \(soname)")
            consoleIO.writeMessage("Имя: \(name)")
            consoleIO.writeMessage("Номер телефона: \(phoneNumber)")
        }
        
    // Удалить пользователя по фамилии
    case .deleteUser:
        if argCount != 3 {
            if argCount > 3 {
                consoleIO.writeMessage("Слишком много аргументов для ключа \(option.rawValue)", to: .error)
            } else {
                consoleIO.writeMessage("Указаны не все аргументы для ключа \(option.rawValue)", to: .error)
            }
            consoleIO.printUsage()
        } else {
            let deletedUser = CommandLine.arguments[2]
            consoleIO.writeMessage("Пользователь \(deletedUser) удален из базы!")
        }
        
    // вывести список всех юзеров
    case .viewAllUsers:
        let index = userDefaultsBase.integer(forKey: "index")
        
        if argCount != 2 {
            if argCount > 2 {
                consoleIO.writeMessage("Слишком много аргументов для ключа \(option.rawValue)", to: .error)
            } else {
                consoleIO.writeMessage("Указаны не все аргументы для ключа \(option.rawValue)", to: .error)
            }
            consoleIO.printUsage()
        } else {
            consoleIO.writeMessage("Список всех пользователей:")
            //если список пользователей не пустой, то выводим их
            if index > 0 {
                var i = 0
                while i < index {
                    consoleIO.writeMessage("User: \(userDefaultsBase.string(forKey: String(i)) ?? "нет данных")")
                    consoleIO.writeMessage("==========================")
                        i += 1
                }
            } else {
                //список пользователей пуст
                consoleIO.writeMessage("Список юзеров пуст!")
            }

        }
        
    // help message
    case .help:
        consoleIO.printUsage()
        
    // в любом другом случае непонятных аргументов
    case .unknown:
        //7
        consoleIO.writeMessage("Такая -\(value) опция не предусмотрена!")
        consoleIO.printUsage()
    }
}
    // функция добавления юзера в юзердефолтс
    func addUserToBase(soname: String, name: String, phoneNumber: String) {
        let storedStr = soname + " " + name + " " + phoneNumber
        
        let index = userDefaultsBase.integer(forKey: "index")
        
        userDefaultsBase.set(storedStr, forKey: String(index))
        //userDefaultsBase.set(storedStr + " ggod", forKey: "user2")
            
        userDefaultsBase.set(index+1, forKey: "index")
        
        //userBase.append(newUser)
        print("\(userDefaultsBase.integer(forKey: "index"))")
        print(userDefaultsBase.string(forKey: String(index))!)
    }
    
}
