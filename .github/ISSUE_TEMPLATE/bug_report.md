---
name: Bug Report
about: Create a report to help us improve
title: ''
labels: ''
assignees: ''

---

**Describe the bug**
A clear and concise description of what the bug is. Please be as detailed as possible and help us help you.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Observed Behavior**

**Expected Behavior**
A clear and concise description of what you expected to happen.

**Stack Trace**
Please provide a stack trace if applicable e.g. a crash is occurring.

**Code Snippet**
Please provide a snippet of the code causing the issue or how you are using the service that has the bug.

**Unique Configuration**
If you are reporting an issue with a unique configuration or where configuration can make a difference in code execution (i.e. Cognito) please provide your configuration. Please make sure to obfuscate sensitive information from the configuration before posting.

**Areas of the SDK you are using (AWSMobileClient, Cognito, Pinpoint, IoT, etc)?**

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Environment(please complete the following information):**
 - SDK Version: [e.g. 2.6.29]
 - Dependency Manager: [e.g. Cocoapods, Carthage]
 - Swift Version : [e.g. 4.0]
 - Xcode Version: [e.g. 11.4]

**Device Information (please complete the following information):**
 - Device: [e.g. iPhone6, Simulator]
 - iOS Version: [e.g. iOS 11.4]
 - Specific to simulators:

**Additional context**
Add any other context about the problem here like your specific use case.

**Relevant Console Output**
In some cases, it might be helpful to add any logs from your console that better help you tell the story of this issue. You can easily enable logging in your app by putting the following code in your app delegate.
```
AWSDDLog.sharedInstance.logLevel = .debug
AWSDDLog.add(AWSDDTTYLogger.sharedInstance)
```
