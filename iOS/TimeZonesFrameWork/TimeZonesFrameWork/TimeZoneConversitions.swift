//
//  TimeZoneConversitions.swift
//  TimeZonesFrameWork
//
//  Created by DevRabbit on 30/03/18.
//  Copyright © 2018 DevRabbit. All rights reserved.
//

import UIKit

class TimeZoneConversitions: NSObject {

    static func convertToUserTimeZone(withDate:String,withActualFormateFormate:String,withRequiredFormate:String,sourceTimeZone:String,destinationTimeZone:String) -> String {
        if(withDate != ""){
            
    let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier:"en_US_POSIX") as Locale?
    dateFormatter.dateFormat = withActualFormateFormate
    dateFormatter.timeZone = TimeZone.init(abbreviation: sourceTimeZone)
let sourceDate: Date? = dateFormatter.date(from: withDate)
    dateFormatter.timeZone = TimeZone.init(abbreviation: destinationTimeZone)
    dateFormatter.dateFormat = withRequiredFormate;
    var retunDate : String =  dateFormatter.string(from: sourceDate!)
    let destinationDate = dateFormatter.date(from: retunDate)
            
            //// ****** check device fromate
            let formatter = DateFormatter()
            formatter.locale = NSLocale.current
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            let dateString: String = formatter.string(from: destinationDate!)
            let amRange: NSRange? = (dateString as NSString).range(of: formatter.amSymbol)
            let pmRange: NSRange? = (dateString as NSString).range(of: formatter.pmSymbol)
            let is24h: Bool = amRange?.location == NSNotFound && pmRange?.location == NSNotFound
            print("""
                \(is24h ? "YES" : "NO")
                """)
            if is24h {
                let twelveHourLocale: NSLocale? = NSLocale(localeIdentifier: "en_US_POSIX")
                if let aLocale = twelveHourLocale {
                    formatter.locale = aLocale as Locale
                }
                formatter.dateFormat = withRequiredFormate
                retunDate = formatter.string(from: destinationDate!)
            }
            return retunDate;
            
        }else{
            return ""
        }
    }
}

