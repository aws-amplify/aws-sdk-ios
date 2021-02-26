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

import Foundation

// MARK: - OTAJobResponse

/**
 A "job accepted" response from the OTA service. The struct below only contains fields that we use in IoT tests.

 Based on the following sample

 ```json
 {
   "clientToken": "1:OTATests-TestThing",
   "timestamp": 1570482699,
   "execution": {
     "jobId": "A_JOB_ID-201910041311",
     "status": "QUEUED",
     "queuedAt": 1570478963,
     "lastUpdatedAt": 1570478963,
     "versionNumber": 1,
     "executionNumber": 1,
     "jobDocument": {
       "afr_ota": {
         "protocols": [
           "MQTT"
         ],
         "streamname": "A-Stream-name-123",
         "files": [
           {
             "filepath": "/bogus/path/to/image",
             "filesize": 12345,
             "fileid": 0,
             "certfile": "/bogus/path/to/cert",
             "sig-sha256-ecdsa": "ABCCDEEFG..."
           }
         ]
       }
     }
   }
 }
 ```
 */
struct OTAJobResponse: Codable {
    let execution: Execution

    struct Execution: Codable {
        let jobId: String
        let jobDocument: JobDocument

        struct JobDocument: Codable {
            enum CodingKeys: String, CodingKey {
                case afrOTA = "afr_ota"
            }

            let afrOTA: OTASpec

            struct OTASpec: Codable {
                let streamname: String
                let files: [File]

                struct File: Codable {
                    enum CodingKeys: String, CodingKey {
                        case filepath
                        case filesize
                        case fileid
                        case certfile
                        case sig = "sig-sha256-ecdsa"
                    }

                    let filepath: String
                    let filesize: Int
                    let fileid: Int
                    let certfile: String
                    let sig: String
                }
            }
        }
    }

    init(jsonData: Data) throws {
        let jsonDecoder = JSONDecoder()
        self = try jsonDecoder.decode(OTAJobResponse.self, from: jsonData)
    }
}

// A couple of convenience properties to make addressing the data easier
extension OTAJobResponse {
    var streamName: String {
        return execution.jobDocument.afrOTA.streamname
    }

    var firstFile: Execution.JobDocument.OTASpec.File {
        return execution.jobDocument.afrOTA.files[0]
    }
}
