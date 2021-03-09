//
//  DateUtils.swift
//  LotteryApp
//
//  Created by Roger Navarro on 4/26/20.
//  Copyright © 2020 Roger Navarro. All rights reserved.
//

import Foundation

class DateUtils {

    static func convertToPrettyString(fromISOString stringIso: String) -> String? {
        guard let date = convertToDate(fromISO: stringIso) else { return nil}
        let formater = DateFormatter()
        formater.dateStyle = .long
        formater.timeStyle = .short
        
        return formater.string(from: date)
    }
    
    static func convertToISOString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        
        return dateFormatter.string(from: date).appending("Z")
    }
    
    static func convertToDate(fromISO string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        return dateFormatter.date(from: string)
    }
}
