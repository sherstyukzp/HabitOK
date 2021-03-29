//
//  ItemFormatter.swift
//  HabitOK
//
//  Created by Ярослав Шерстюк on 29.03.2021.
//

import Foundation

class ItemFormatter {
    
    let itemFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter

    }()
    
    // Метод получения название часа (формат: 24)
    let itemFormatterHour: DateFormatter = {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let hourString = dateFormatter.string(from: date)
        
        return dateFormatter
    }()

    // Метод получения название дня недели (формат: Sunday)
    let itemFormatterNameDayOfTheWeek: DateFormatter = {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayOfTheWeekString = dateFormatter.string(from: date)
        
        return dateFormatter
    }()

    // Метод получения название месяца (формат: October)
    let itemFormatterNameMonth: DateFormatter = {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let monthString = dateFormatter.string(from: date)
        
        return dateFormatter
    }()

    // Метод получения название месяца (формат: 12)
    let itemFormatterNameMonthNumber: DateFormatter = {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM" // format January, February, March,
        //let name = dateFormatter.string(from: date)
        let index = Calendar.current.component(.month, from: date)

        return dateFormatter
    }()

    // Метод получения года (формат: 2020)
    let itemFormatterNameYear: DateFormatter = {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"

        let yearString = dateFormatter.string(from: date)
        
        return dateFormatter
    }()
    
    // Метод получения День, 31 Месяц
    
    let itemFormatterDayOfTheWeekDayOfTheMonthAndMonth: DateFormatter = {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd LLLL"
        let monthString = dateFormatter.string(from: date)
        
        return dateFormatter
    }()
    
}

