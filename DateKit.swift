//
//  DateKit.swift
//  FieldManual
//
//  Created by Cary Miller on 1/26/18.
//  Copyright © 2018 C.Miller & Co. All rights reserved.
//

import Foundation

/*
   DateKit gives you a handy way to provide the current date to your app,
   while simultaneously making it quick and simple to mock dates for all
   of your testing purposes.

   In production code, you simply use DateKit.now() to get the current date.

   In test code, you can mock the current date by calling
   DateKit.mockCurrentDate(as:), and passing in a string of the format
   "yyyy-MM-dd HH:mm:ss".

   DateKit also provides a helper method — getDate(as:) — for creating
   standalone dates. This is simply a wrapper to make it easier and more
   succinct to create a date object.
 */

class DateKit {
   static private let formatter = DateFormatter()
   static private var mockedDate: Date!

   #if DEBUG
      static func now() -> Date {
         if let mockedDate = mockedDate {
            print("🔥 CAUTION! DateKit.now() is being mocked. 🔥")
            return mockedDate
         } else {
            print("🦄 SMILE! DateKit.now() is a sparkly unicorn! 🦄")
            return Date()
         }
      }
   #else
      static func now() -> Date {
         return Date()
      }
   #endif

   static func mockCurrentDate(as mockDate: String) {
      formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
      guard let mockDate = formatter.date(from: mockDate) else {
         fatalError("Did not retrieve a date from formatter.\n" +
            "Check that your date string is formatted correctly.")
      }
      mockedDate = mockDate
   }

   static func getDate(as date: String) -> Date {
      formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
      guard let date = formatter.date(from: date) else {
         fatalError("Did not retrieve a date from formatter.\n" +
            "Check that your date string is formatted correctly.")
      }
      return date
   }
}
