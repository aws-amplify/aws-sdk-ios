# Logs Guidance

When providing logs in an issue please follow these recommendations.

1. Use an editor to clear out any sensitive information.
2. Remove lines which are not relevant to the problem.
3. Place the logs in the markdown syntax below.

## Screenshots vs Text Logs

Sharing logs as text will make it possible to search for log messages across issues and to trim logs to the relevant details. Collect logs from Xcode Console or the Console app by highlighting lines and copying them to an editor where the text can be prepared for sharing in a new issue.

### Stack Frames

To collect details about the stack frames while debugging, also copy lines from the Xcode Debug Navigator by selecting the stack frames and copying the text to an editor. Showing stack frames shows the backtrace of function calls which is helpful in understanding the context. You can also set a breakpoint which will run a Debugger Command such as `bt 5` which will print 5 of the backtrace from that point where the breakpoint is set. This text will appear in the Xcode Console where it can be copied with other log messages to provide useful context for resolving the issue.

1. Add a breakpoint to where you want to include more context
2. Edit the breakpoint and select the checkbox at the bottom to automatically continue
3. Add an Action which will be a Debugger Command
4. Add `bt 5` to print the last 5 lines of the backtrace to the console
5. Optionally also add action to log a message which can include an expression

Like the watch window displayed while debugging, a log message from a breakpoint can evalulate an expression to print out those details in the Xcode console. For a variable named `info`, simply add `@info@` to the log message text field. You may want to add debugging features to your code which can provide a string or dictionary which provides useful information which can be used when logging from a breakpoint.

## Sensitive Information

Logs should be trimmed of details which should not be shared publicly, such as user names and credentials. Use an editor to find references using either a keyword search or regular expression and either delete that information or replace it with placeholder text if it helps provide context.

## Collapsible details in markdown

Including a lot of log messages in a GitHub issue is helpful but also requires a lot of scrolling. It can be difficult to also copy that log to an editor to filter to the most useful details. GitHub markdown supports collapsing details with the syntax below. It is just the `<details>` tags which must include a `<summary>` tag at the start.

Beyond just making it possible to collapse the details, n button appears at the top right when it is expanded to let you copy to your clipboard making it easy to bring it to an editor.

````markdown
<details>
<summary>Log Messages</summary>

```
INSERT LOG MESSAGES HERE
```
</details>
````
