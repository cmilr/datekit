//
//  DateKitExt.swift
//
//  Created by Cary Miller on 2/15/18.
//  Copyright © 2018 Cary Miller.
//

import XCTest

public extension XCUIElement {
   func set(_ date: String) {
      self.tap()
      self.typeText(date)
      self.typeText("\r")
   }
}
