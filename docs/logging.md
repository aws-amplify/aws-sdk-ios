As of version 2.5.4 of this SDK, logging utilizes [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack), a flexible, fast, open source logging framework. It supports many capabilities including the ability to set logging level per output target, for instance, concise messages logged to the console and verbose messages to a log file.

CocoaLumberjack logging levels are additive such that when the level is set to verbose, all messages from the levels below verbose are logged. It is also possible to set custom logging to meet your needs. For more information, see [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack/blob/master/Documentation/CustomLogLevels.md)

## Changing Log Levels

```swift tab="Swift"
AWSDDLog.sharedInstance.logLevel = .verbose
```

```objective-c tab="Objective-C"
[AWSDDLog sharedInstance].logLevel = AWSDDLogLevelVerbose;
```

The following logging level options are available:

```swift tab="Swift"
.off
.error
.warning
.info
.debug
.verbose
```

```objective-c tab="Objective-C"
AWSDDLogLevelOff
AWSDDLogLevelError
AWSDDLogLevelWarning
AWSDDLogLevelInfo
AWSDDLogLevelDebug
AWSDDLogLevelVerbose
```

We recommend setting the log level to `Off` before publishing to the Apple App Store.

## Targeting Log Output

CocoaLumberjack can direct logs to file or used as a framework that integrates with the Xcode console.

To initialize logging to files, use the following code:

```swift tab="Swift"
let fileLogger: AWSDDFileLogger = AWSDDFileLogger() // File Logger
fileLogger.rollingFrequency = TimeInterval(60*60*24)  // 24 hours
fileLogger.logFileManager.maximumNumberOfLogFiles = 7
AWSDDLog.add(fileLogger)
```

```objective-c tab="Objective-C"
AWSDDFileLogger *fileLogger = [[AWSDDFileLogger alloc] init]; // File Logger
fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
[AWSDDLog addLogger:fileLogger];
```

To initialize logging to your Xcode console, use the following code:

```swift tab="Swift"
AWSDDLog.add(AWSDDTTYLogger.sharedInstance) // TTY = Xcode console
```

```objective-c tab="Objective-C"
[AWSDDLog addLogger:[AWSDDTTYLogger sharedInstance]]; // TTY = Xcode console
```