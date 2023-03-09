# AWSMobileClientUnitTestWithApp

Unit test added with a host app. The test inside this package require an host app to function because it make
use of some of the functionality from the host app like keychain. These test could not be tested without a host 
app present.


Some of the test are flaky, running the whole test case might result in some test failing. Test them
individually to see if they pass. The test are not stable because we could not reset the singleton
classes inside the legacy Cognito SDK. Once these singleton like AWSInfo are created, we could not
reset them with new configuration.
