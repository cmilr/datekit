//
//  DateKitUI.swift
//
//  Created by Cary Miller on 2/15/18.
//  Copyright © 2018 Cary Miller.
//

import UIKit

/**
   DateKitUI extends the functionality of DateKit by giving you full control of
   mocked dates in your Xcode UI tests. Since you can't access the inner workings
   of your app during UI testing in the same way that you would during a unit test,
   DateKitUI employs a nearly-hidden UITextField element to allow you to enter
   date-strings via the UI instead.
 */

class DateKitUI: UITextField, UITextFieldDelegate {
   static let shared = DateKitUI()

   private init() {
      super.init(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
      configure()
   }

   internal required init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)!
      configure()
   }

   internal required override init(frame: CGRect) {
      super.init(frame: frame)
      configure()
   }

   func configure() {
      if ProcessInfo.processInfo.arguments.contains("uitest") {
         delegate = self
         accessibilityIdentifier = "DateKitUI"
         isUserInteractionEnabled = true
         backgroundColor = UIColor.clear
      }
   }

   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.endEditing(true)
      textField.resignFirstResponder()
      return false
   }

   func textFieldDidEndEditing(_ textField: UITextField) {
      guard let text = textField.text else {
         fatalError("Could not retrieve text from textField.")
      }
      DateKit.mockCurrentDate(as: text)
      textField.text = ""
      #if DEBUG
         print("Date Set --> \(text)")
      #endif
   }
}
