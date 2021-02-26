//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

import AWSTranscribeStreaming

struct TestData {
    /**
    A base64 encoded representation of the raw event data for a transcript event.

    ```json
    {
      "Transcript": {
        "Results": [
          {
            "Alternatives": [
              {
                "Items": [
                  {
                    "Content": "Hello",
                    "EndTime": 0.21,
                    "StartTime": 0.12,
                    "Type": "pronunciation"
                  },
                  {
                    "Content": "were",
                    "EndTime": 0.49,
                    "StartTime": 0.22,
                    "Type": "pronunciation"
                  }
                ],
                "Transcript": "Hello were"
              }
            ],
            "EndTime": 0.53,
            "IsPartial": true,
            "ResultId": "94862f4a-3793-4e5b-8e85-1915c8d33f92",
            "StartTime": 0.12
          }
        ]
      }
    }
    ```
     */
    static let transcriptEventData = Data(base64Encoded: "AAABsgAAAFXfePLDCzpldmVudC10eXBlBwAPVHJhbnNjcmlwdEV2ZW50DTpjb250ZW50LXR5cGUHABBhcHBsaWNhdGlvbi9qc29uDTptZXNzYWdlLXR5cGUHAAVldmVudHsiVHJhbnNjcmlwdCI6eyJSZXN1bHRzIjpbeyJBbHRlcm5hdGl2ZXMiOlt7Ikl0ZW1zIjpbeyJDb250ZW50IjoiSGVsbG8iLCJFbmRUaW1lIjowLjIxLCJTdGFydFRpbWUiOjAuMTIsIlR5cGUiOiJwcm9udW5jaWF0aW9uIn0seyJDb250ZW50Ijoid2VyZSIsIkVuZFRpbWUiOjAuNDksIlN0YXJ0VGltZSI6MC4yMiwiVHlwZSI6InByb251bmNpYXRpb24ifV0sIlRyYW5zY3JpcHQiOiJIZWxsbyB3ZXJlIn1dLCJFbmRUaW1lIjowLjUzLCJJc1BhcnRpYWwiOnRydWUsIlJlc3VsdElkIjoiOTQ4NjJmNGEtMzc5My00ZTViLThlODUtMTkxNWM4ZDMzZjkyIiwiU3RhcnRUaW1lIjowLjEyfV19fRMshLQ=")!

    /// A data event representing a BadRequestException, to test serialization of error members of TranscribeEventStream
    static let transcriptErrorEvent = Data(base64Encoded: "AAAAxwAAAGEEorpsDzpleGNlcHRpb24tdHlwZQcAE0JhZFJlcXVlc3RFeGNlcHRpb24NOmNvbnRlbnQtdHlwZQcAEGFwcGxpY2F0aW9uL2pzb24NOm1lc3NhZ2UtdHlwZQcACWV4Y2VwdGlvbnsiTWVzc2FnZSI6IllvdXIgcmVxdWVzdCB0aW1lZCBvdXQgYmVjYXVzZSBubyBuZXcgYXVkaW8gd2FzIHJlY2VpdmVkIGZvciAxNSBzZWNvbmRzLiJ9PblBbw==")!
}

/// Mock WebSocket to allow for testing conditions where the adaptor inspects ready state
class MockWebSocket: AWSSRWebSocket {
    var overrideReadyState: AWSSRReadyState
    override var readyState: AWSSRReadyState {
        return overrideReadyState
    }
    override init() {
        overrideReadyState = .CLOSED
        super.init()
    }
}
