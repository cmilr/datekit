<!--
Badges
-->
[![Platform][mlw-badge]][repo]&nbsp;
[![GitHub issues][issues-badge]][issues]&nbsp;
[![GitHub license][license-badge]][license]&nbsp;
[![Code of Conduct][coc-badge]][coc]&nbsp;

<!--
Badge References
-->
[mlw-badge]:https://img.shields.io/badge/platform-iOS-8056d5.svg?style=for-the-badge&logo=apple&logoColor=white
[issues-badge]:https://img.shields.io/github/issues/cmilr/swift-datekit.svg?style=for-the-badge&logo=github&logoColor=white
[license-badge]:https://img.shields.io/github/license/cmilr/swift-datekit.svg?style=for-the-badge
[coc-badge]:https://img.shields.io/badge/code%20of-conduct-ff69b4.svg?style=for-the-badge

<!--
URL References
-->
[repo]:https://github.com/cmilr/swift-datekit
[issues]:https://github.com/cmilr/swift-datekit/issues
[license]:https://github.com/cmilr/swift-datekit/blob/master/LICENSE
[coc]:https://github.com/cmilr/swift-datekit/blob/master/CODE_OF_CONDUCT.md

# DateKit

DateKit gives you a handy way to provide the current date to your iOS app, while simultaneously making it quick and easy to mock dates in your tests.

In production code, you simply call **DateKit.now()** to get the current date, instead of using Date() or NSDate().

Then, in test code, you can mock the current date by calling **DateKit.mockCurrentDate(as:)**, and passing in a string of the format **"yyyy-MM-dd HH:mm:ss"**. At this point, **DateKit.now()** will return the mocked date/time instead of the actual date/time.

DateKit also provides a helper method — **getDate(as:)** — for creating standalone dates. This is a simple wrapper to make it easier and more succinct to create a new date object.

DateKit also provides you with ample warning when you're running on mocked dates:

## Installation

Drag **DateKit.swift** into your Xcode project.

## Usage example

In your production code:
```swift
let account.activationDate = DateKit.now()
```
In your test suite:
```swift
// Change the current date to whatever you like
DateKit.mockCurrentDate(as: "1999/12/31 23:59:59")

// Mock other dates as needed
account.previousActivationDate = DateKit.getDate(as: "1999/12/30 23:59:59")

// Now assert something
let actual = account.currentDaysActive
let expected = 1
XCTAssertEqual(expected, actual)
```

## Contact
- Email: cary@cmillerco.com
- Twitter: [@cmillerco](https://twitter.com/cmillerco)
- GitHub: [cmilr](https://github.com/cmilr/)

## License
Distributed under the MIT license. See ``LICENSE`` for more information.

# Thanks for stopping by!
