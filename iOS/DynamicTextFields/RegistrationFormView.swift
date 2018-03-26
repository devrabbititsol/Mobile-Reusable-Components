//
//  RegistrationFormView.swift
//  CreateTextFieldsDynamically
//
//  Created by DevRabbit on 21/03/18.
//  Copyright © 2018 DevRabbit. All rights reserved.
//

import UIKit

class RegistrationFormView: UIScrollView,UITextFieldDelegate {
 
var presentedViewController:UIViewController!
var viewBackGroundColor : UIColor!
var setTextFeildTextColor : UIColor!
var setTextFeildBorderColor : UIColor!
var setCornerRadious : Bool!
////**** Label Parameters
var isLableAdd:Bool!
var setTextFontForTable:UIFont!
var setTextColorForlable: UIColor!
   
///****** save button parametes
var isAddSaveButton : Bool!
var setTitleForSaveButton : String!
var setSaveButtonBGColor : UIColor!
var setSaveButtonTextColor : UIColor!

var nameOfTheFeilds : [String]!
var placeHolderTexts : [String]!
    
  ///delegate
    
weak var registrationFormViewDelegate:RegistrationFormViewDelegate?
   
    
func createRegistrationFormWith(nameOfTextFeilds:[String],placeHoldersOfTextFeild:[String],presentViewController:UIViewController){
    var  y = 10;
    nameOfTheFeilds = nameOfTextFeilds
    placeHolderTexts = placeHoldersOfTextFeild;
    self.backgroundColor = viewBackGroundColor;
    presentedViewController = presentViewController
        
    if(nameOfTextFeilds.count != placeHoldersOfTextFeild.count){
    CheckValidations.showAlert(message: "Number of text feilds and number place holders are not equal.",withPresentViewController:presentedViewController)
        return;
        }
        
    for i in  0...nameOfTextFeilds.count-1 {
    // Create Lables IF User set
    if(isLableAdd != nil){
    if(isLableAdd){
    addSubview(self.createLableWith(tag: i, withYPostion: y))
    y = y+33;
        }
        }
    // create Text Feilsds
self.addSubview(self.textFieldCreation(tag: i, withYPostion: y))
        y = y + 48;
    }
    
    if(isAddSaveButton != nil){
        if(isAddSaveButton){
        self.addSubview(self.addSaveButton(withYPosition: y));
        y = y+100
        }
    
    }
self.contentSize = CGSize.init(width: Int(self.frame.size.width), height: y+50);
    }
    
    func setTextFeildBorderColorWith(textFeild:UITextField,withError:Bool){
    textFeild.layer.borderWidth = 1.0;
    textFeild.layer.borderColor = self.setTextFeildBorderColor.cgColor
        if(withError){
           textFeild.layer.borderColor = UIColor.red.cgColor
        }
    }
    
  // labelCreation
    func createLableWith(tag:Int,withYPostion:Int)->UILabel{
   let lable = UILabel.init(frame: CGRect.init(x: 10, y: withYPostion, width: Int(self.frame.size.width - 20), height: 25))
    lable.tag = tag
    lable.text = nameOfTheFeilds[tag]
    return lable;

    }
    
    
// textFeild Creation
func textFieldCreation(tag:Int,withYPostion:Int)->UITextField{
    let textField = UITextField.init(frame: CGRect.init(x: 10, y: withYPostion, width: Int(self.frame.size.width - 20), height: 40))
    textField.tag = tag;
    textField.placeholder = placeHolderTexts[tag]
    textField.delegate = self;
    textField.setLeftPaddingPoints(10)
   // textField.t
    ////******** for set border color
    if(self.setTextFeildBorderColor != nil){
        self.setTextFeildBorderColorWith(textFeild: textField, withError: false)
    } ////******** for set border color
    
    ////******** for set text color
    if(self.setTextFeildTextColor != nil){
        textField.textColor = self.setTextFeildTextColor;
        
    } ////******** for set textColor color
    return textField
    }
    
    
   ///Save Button Creation
func addSaveButton(withYPosition:Int)->UIButton{
let saveButton : UIButton = UIButton.init(frame: CGRect.init(x: Int((self.frame.size.width/2) - 30), y: withYPosition+30, width: 60, height: 45))
        if(self.setTitleForSaveButton != nil){
    saveButton.setTitle(setTitleForSaveButton,for: .normal)
        }
    if(self.setSaveButtonBGColor != nil){
    saveButton.backgroundColor = setSaveButtonBGColor
    }
    if(self.setSaveButtonTextColor != nil){
    saveButton.setTitleColor(self.setSaveButtonTextColor, for: .normal)
    }else{
     saveButton.setTitleColor(UIColor.blue, for: .normal)
    }
    
saveButton.addTarget(self, action: #selector(self.saveButtonClickedAction(sender:)), for: .touchUpInside)
    return saveButton;
    }
    
    //MARK:- SaveButton Action
@objc func saveButtonClickedAction(sender:UIButton){
 self.endEditing(true)
if(self.checkValidations()){
let dataDict : NSMutableDictionary = NSMutableDictionary.init()
for subView in self.subviews{
if(subView is UITextField){
dataDict.setObject((subView as! UITextField).text!, forKey: nameOfTheFeilds[(subView as! UITextField).tag] as NSCopying)
    }
    }
self.registrationFormViewDelegate?.saveButtonClicked(enteredData: dataDict as NSDictionary)

    }
    
    }
    
    
//MARK:- TextFeildDelegates
func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
for subView in self.subviews{
        if(subView is UITextField){
    self.setTextFeildBorderColorWith(textFeild: (subView as! UITextField), withError: false)
        }
    }
    
 CheckValidations.textFeildMoveUPWithRespect(withSuperView: presentedViewController.view, scrollView: self, withTextFeild: textField)
    
return true
    }
    
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
    }
    
    // MARK:- Check Validations
func checkValidations()->Bool{
    for subView in self.subviews{
    if(subView is UITextField){
    if((subView as! UITextField).text == ""){
    self.setTextFeildBorderColorWith(textFeild: (subView as! UITextField), withError: true)
    CheckValidations.showAlert(message: "Please Enter "+(subView as! UITextField).placeholder!+".",withPresentViewController:presentedViewController)
        return false;
    }else{
        // Phomne Number
    if(nameOfTheFeilds[(subView as! UITextField).tag] == "Email"){
        if(!CheckValidations.isValidEmail(testStr: (subView as! UITextField).text!)){
    CheckValidations.showAlert(message: "Please Enter Valid Email.",withPresentViewController:presentedViewController)
            return false;
        }
        }

    // mobile number
    if(nameOfTheFeilds[(subView as! UITextField).tag] == "Phone Number"){
    if(!CheckValidations.isValidPhoneNumber(testStr: (subView as! UITextField).text!)){
    CheckValidations.showAlert(message: "Please Enter Valid Phone Number.",withPresentViewController:presentedViewController)
        return false;
            }
        }
        
        }
        }
    }
  return true
}
    
}
protocol RegistrationFormViewDelegate: class {
func saveButtonClicked(enteredData:NSDictionary?)
}
