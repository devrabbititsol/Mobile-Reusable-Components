//
//  CheckValidations.swift
//  CreateTextFieldsDynamically
//
//  Created by DevRabbit on 21/03/18.
//  Copyright © 2018 DevRabbit. All rights reserved.
//

import UIKit

class CheckValidations: NSObject {
    
    class func textFeildMoveUPWithRespect(withSuperView : UIView, scrollView : UIScrollView, withTextFeild : UITextField ){
        
        let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 240, 0.0)
        if((withTextFeild.superview?.frame.origin.y)! + withTextFeild.frame.size.height + withTextFeild.frame.origin.y > withSuperView.frame.size.height - 240){
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
            var aRect: CGRect = withSuperView.frame
            aRect.size.height -= 240
            if !aRect.contains(withTextFeild.frame.origin) {
                
                scrollView.scrollRectToVisible(withTextFeild.frame, animated: true)
            }
        }
        
    }
    
    static func showAlert(message:String,withPresentViewController:UIViewController){
    let alert: UIAlertController = UIAlertController.init(title: "Alert!", message: message, preferredStyle: .alert)
    let okAction = UIAlertAction.init(title: "Ok", style: .cancel) { (action) in
    }
alert.addAction(okAction)
    
withPresentViewController.present(alert, animated: true, completion: nil)
    }
    

    //MARK:- EMAIL VALIDATION
static func isValidEmail(testStr:String) -> Bool {
let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
    }
static func isValidPhoneNumber(testStr:String) -> Bool {
    if(testStr.count != 10){
        return false
    }
    return true;
    }
    
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
