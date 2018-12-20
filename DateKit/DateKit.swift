//
//  DateKit.swift
//
//  Created by Cary Miller on 1/26/18.
//  Copyright © 2018 Cary Miller.
//

import Foundation
import UIKit

/**
   DateKit gives you a handy way to provide the current date to your app,
   while simultaneously making it quick and simple to mock dates for all
   of your testing purposes.

   In production code, you simply use **DateKit.now()** to get the current date.

   Now, in test code you can mock the current date by calling
   **DateKit.mockCurrentDate(as:)**, and passing in a string of the format
   "yyyy-MM-dd HH:mm:ss".

   DateKit also provides a helper method — **getDate(as:)** — for creating
   standalone dates. This is a simple wrapper to make it easier and more
   succinct to create a date object.
 */

class DateKit {
   static private let formatter = DateFormatter()
   static private var mockedDate: Date!

   /**
    Returns the current date by default, but returns a mocked date if called after setting **mockCurrentDate(as:)**.

    - warning: As a safeguard, mocking the current date only works in **DEBUG** configuration.
    - returns: A Date() object.
    */
   #if DEBUG
      static func now() -> Date {
         if let mockedDate = mockedDate {
            return mockedDate
         } else {
            return Date()
         }
      }
   #else
      static func now() -> Date {
         return Date()
      }
   #endif

   /**
    Sets the current date to a mock value.

    - parameter as: A date string in the format of: "yyyy-MM-dd HH:mm:ss"
    - returns: Nothing
    */
   static func mockCurrentDate(as mockDate: String) {
      formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
      guard let mockDate = formatter.date(from: mockDate) else {
         fatalError("Did not retrieve a date from formatter.\n" +
            "Check that your date string is formatted correctly.")
      }
      mockedDate = mockDate
   }

   /**
    Sets the current date to a mock value.

    - parameter as: A Date() object in the format of: "yyyy-MM-dd HH:mm:ss"
    - returns: Nothing
    */
   static func mockCurrentDate(as mockDate: Date) {
      mockedDate = mockDate
   }

   /**
    Returns a Date() object customized to your specifications.

    - parameter as: A date string in the format of: "yyyy-MM-dd HH:mm:ss"
    - returns: A Date() object.
    */
   static func getDate(as date: String) -> Date {
      formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
      guard let date = formatter.date(from: date) else {
         fatalError("Did not retrieve a date from formatter.\n" +
            "Check that your date string is formatted correctly.")
      }
      return date
   }

   /**
    Returns an NSDate() object customized to your specifications.

    - parameter as: A date string in the format of: "yyyy-MM-dd HH:mm:ss"
    - returns: An NSDate() object.
    */
   static func getNSDate(as date: String) -> NSDate {
      return getDate(as: date) as NSDate
   }

   /**
    Configures a hidden UITextField subclass that allows for easily mocking the current date in UI tests.

    - parameter: Parent UIView.
    - returns: Nothing.
    */
   static func enableUITests(view: UIView) {
      let hiddenTextField = DateKitUI()
      view.addSubview(hiddenTextField)
      view.bringSubview(toFront: hiddenTextField)
   }
}
