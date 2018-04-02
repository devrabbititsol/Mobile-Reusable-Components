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
            // setActualDateFormate
            
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier:"en_US_POSIX") as Locale!
    dateFormatter.dateFormat = withActualFormateFormate
let dateFromString: Date? = dateFormatter.date(from: withDate)
    
        
let sourceDate: Date? = dateFromString
let sourceTimeZone = NSTimeZone(abbreviation: sourceTimeZone)
        let destinationTimeZone = NSTimeZone(abbreviation: destinationTimeZone)
        let sourceGMTOffset: Int? = sourceTimeZone?.secondsFromGMT(for: sourceDate!)
            let destinationGMTOffset: Int? = destinationTimeZone?.secondsFromGMT(for: sourceDate!)
            let interval = Double(destinationGMTOffset! - sourceGMTOffset!)
            let destinationDate = Date(timeInterval: interval, since: sourceDate!)
        
    dateFormatter.dateFormat = withRequiredFormate
        
    var retunDate : String =  dateFormatter.string(from: destinationDate)
            
            //// ****** check device fromate
            let formatter = DateFormatter()
            formatter.locale = NSLocale.current
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            let dateString: String = formatter.string(from: destinationDate)
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
                retunDate = formatter.string(from: destinationDate)
            }
            return retunDate;
            
        }else{
            return ""
        }
    }
}

