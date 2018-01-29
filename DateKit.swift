//
//  DateKit.swift
//  FieldManual
//
//  Created by Cary Miller on 1/26/18.
//  Copyright © 2018 C.Miller & Co. All rights reserved.
//

import Foundation

/**
   DateKit gives you a handy way to provide the current date to your app,
   while simultaneously making it quick and simple to mock dates for all
   of your testing purposes.

   In production code, you simply use **DateKit.now()** to get the current date.

   In test code, you can mock the current date by calling
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

    - warning: As a safeguard, mocking the current date only works in **DEBUG** code.
    - returns: A Date() object.
    */
   #if DEBUG
      static func now() -> Date {
         if let mockedDate = mockedDate {
            print("🔥 CAUTION! Current date is being mocked. 🔥")
            return mockedDate
         } else {
            print("✨🦄 SMILE! Current date is a sparkly unicorn! 🦄✨")
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
}
