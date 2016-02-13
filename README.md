# NSDateIntervalFormatterBug
Demonstrates a bug with the NSDateIntervalFormatter
- must use actual device (not simulator)
- set device to locale that uses AM/PM style
- toggle 24hr format to on
- notice the NSDateFormatter shows time in 24hr format, NSDateIntervalFormatter does not

Code:
```
// This formats 24-hr preferences correctly
let dateFormatter = NSDateFormatter()
dateFormatter.dateStyle = .MediumStyle
dateFormatter.timeStyle = .LongStyle
let str = dateFormatter.stringFromDate(now)
self.dateLabel.text = str
        
// This ignores the 24-hr preference toggle
let dateIntervalFormatter = NSDateIntervalFormatter()
dateIntervalFormatter.dateStyle = .MediumStyle
dateIntervalFormatter.timeStyle = .LongStyle
let strInterval = dateIntervalFormatter.stringFromDate(now, toDate: next)
self.dateIntervalLabel.text = strInterval
```

Screenshot:

![ScreenShot](screen.png)
