//
//  ViewController.swift
//  TimeZonesFrameWork
//
//  Created by DevRabbit on 30/03/18.
//  Copyright © 2018 DevRabbit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Time::",TimeZoneConversitions.convertToUserTimeZone(withDate: "2018/03/12 23:45:02", withActualFormateFormate: "yyyy/MM/dd HH:mm:ss", withRequiredFormate: "MMM dd,yyyy hh:mm a", sourceTimeZone:"PST", destinationTimeZone:"IST"))
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

