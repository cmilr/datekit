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
[issues-badge]:https://img.shields.io/github/issues/cmilr/datekit.svg?style=for-the-badge&logo=github&logoColor=white
[license-badge]:https://img.shields.io/github/license/cmilr/datekit.svg?style=for-the-badge
[coc-badge]:https://img.shields.io/badge/code%20of-conduct-ff69b4.svg?style=for-the-badge

<!--
URL References
-->
[repo]:https://github.com/cmilr/datekit
[issues]:https://github.com/cmilr/datekit/issues
[license]:https://github.com/cmilr/datekit/blob/master/LICENSE
[coc]:https://github.com/cmilr/datekit/blob/master/CODE_OF_CONDUCT.md

# DateKit

DateKit gives you a handy way to provide the current date to your iOS app, while simultaneously making it quick and easy to mock dates in your tests.

In production code, you simply call **DateKit.now()** to get the current date, instead of using Date() or NSDate().

Then, in test code, you can mock the current date by calling **DateKit.mockCurrentDate(as:)**, and passing in a string of the format **"yyyy-MM-dd HH:mm:ss"**. At this point, **DateKit.now()** will return the mocked date/time instead of the actual date/time.

DateKit also provides a helper method — **getDate(as:)** — for creating standalone dates. This is a simple wrapper to make it easier and more succinct to create a new date object.

# DateKitUI

DateKitUI extends the functionality of DateKit by giving you full control of mocked dates in your Xcode UI tests. Since you can't access the inner workings of your app during UI testing in the same way that you would during a unit test, DateKitUI employs a nearly-hidden UITextField element to allow you to enter date-strings via the UI instead. 

## Installation

Drag the **DateKit** directory into your Xcode project.

## DateKit Usage Example

In your production code, use **DateKit.now()** anywhere you would normally use Date() or NSDate(), such as in this contrived code sample:
```swift
account.activationDate = DateKit.now()
```
Now, in your unit tests, you can control what **DateKit.now()** returns by using **DateKit.mockCurrentDate(as:)**—which means you can effectively move your tests forward in time to make sure that time/date-critical code works the way you intended.
```swift
func testUserMembershipYears_givenOneYear_returnsCorrectCount() {
	DateKit.mockCurrentDate(as: "2017/11/17 23:59:59")
	let testUser = AccountManager.initializeNewAccount()
	DateKit.mockCurrentDate(as: "2018/11/28 03:21:18")
	let actual = testUser.membershipYears
	let expected = 1
	XCTAssertEqual(expected, actual)
}
```
Should you need, you can mock other dates as well, using **DateKit.getDate(as:)**—like I do here to test that my numDaysElapsed(from:to:) method is functioning correctly.
```swift
func testNumDaysElapsed_givenSameDate_returnsZero() {
      var begin = DateKit.getDate(as: "2018-08-09 00:30:30")
      var end = DateKit.getDate(as: "2018-08-09 05:22:18")
      var expected = 0
      var actual = numDaysElapsed(from: begin, to: end)
      XCTAssertEqual(expected, actual)
}
```
## DateKitUI Usage Example
To come...

## Contact
- Email: cary@cmillerco.com
- Twitter: [@cmillerco](https://twitter.com/cmillerco)
- GitHub: [cmilr](https://github.com/cmilr/)

## License
Distributed under the MIT license. See ``LICENSE`` for more information.

# Thanks for stopping by!
