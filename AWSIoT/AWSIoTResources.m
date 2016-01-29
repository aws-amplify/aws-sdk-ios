//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSIoTResources.h"
#import <AWSCore/AWSLogging.h>

@interface AWSIoTResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSIoTResources

+ (instancetype)sharedInstance {
    static AWSIoTResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSIoTResources new];
    });

    return _sharedResources;
}
- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
  return @" \
{ \
  \"version\":\"2.0\", \
  \"metadata\":{ \
    \"apiVersion\":\"2015-05-28\", \
    \"endpointPrefix\":\"iot\", \
    \"serviceFullName\":\"AWS IoT\", \
    \"signatureVersion\":\"v4\", \
    \"signingName\":\"execute-api\", \
    \"protocol\":\"rest-json\" \
  }, \
  \"documentation\":\"<fullname>AWS IoT</fullname> <p>AWS IoT provides secure, bi-directional communication between Internet-connected things (such as sensors, actuators, embedded devices, or smart appliances) and the AWS cloud. You can discover your custom IoT-Data endpoint to communicate with, configure rules for data processing and integration with other services, organize resources associated with each thing (Thing Registry), configure logging, and create and manage policies and credentials to authenticate things.</p> <p>For more information about how AWS IoT works, see the <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/aws-iot-how-it-works.html\\\">Developer Guide</a>.</p>\", \
  \"operations\":{ \
    \"AcceptCertificateTransfer\":{ \
      \"name\":\"AcceptCertificateTransfer\", \
      \"http\":{ \
        \"method\":\"PATCH\", \
        \"requestUri\":\"/accept-certificate-transfer/{certificateId}\" \
      }, \
      \"input\":{ \
        \"shape\":\"AcceptCertificateTransferRequest\", \
        \"documentation\":\"<p>The input for the AcceptCertificateTransfer operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"TransferAlreadyCompletedException\", \
          \"error\":{\"httpStatusCode\":410}, \
          \"exception\":true, \
          \"documentation\":\"<p>You can't revert the certificate transfer because it has already completed.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Accepts a pending certificate transfer. The default state of the certificate is INACTIVE.</p> <p>To check for pending certificate transfers, call <a>ListCertificates</a> to enumerate your certificates.</p>\" \
    }, \
    \"AttachPrincipalPolicy\":{ \
      \"name\":\"AttachPrincipalPolicy\", \
      \"http\":{ \
        \"method\":\"PUT\", \
        \"requestUri\":\"/principal-policies/{policyName}\" \
      }, \
      \"input\":{ \
        \"shape\":\"AttachPrincipalPolicyRequest\", \
        \"documentation\":\"<p>The input for the AttachPrincipalPolicy operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"LimitExceededException\", \
          \"error\":{\"httpStatusCode\":410}, \
          \"exception\":true, \
          \"documentation\":\"<p>The number of attached entities exceeds the limit.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Attaches the specified policy to the specified principal (certificate or other credential).</p>\" \
    }, \
    \"AttachThingPrincipal\":{ \
      \"name\":\"AttachThingPrincipal\", \
      \"http\":{ \
        \"method\":\"PUT\", \
        \"requestUri\":\"/things/{thingName}/principals\" \
      }, \
      \"input\":{ \
        \"shape\":\"AttachThingPrincipalRequest\", \
        \"documentation\":\"<p>The input for the AttachThingPrincipal operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"AttachThingPrincipalResponse\", \
        \"documentation\":\"<p>The output from the AttachThingPrincipal operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Attaches the specified principal to the specified thing.</p>\" \
    }, \
    \"CancelCertificateTransfer\":{ \
      \"name\":\"CancelCertificateTransfer\", \
      \"http\":{ \
        \"method\":\"PATCH\", \
        \"requestUri\":\"/cancel-certificate-transfer/{certificateId}\" \
      }, \
      \"input\":{ \
        \"shape\":\"CancelCertificateTransferRequest\", \
        \"documentation\":\"<p>The input for the CancelCertificateTransfer operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"TransferAlreadyCompletedException\", \
          \"error\":{\"httpStatusCode\":410}, \
          \"exception\":true, \
          \"documentation\":\"<p>You can't revert the certificate transfer because it has already completed.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Cancels a pending transfer for the specified certificate.</p> <p><b>Note</b> Only the transfer source account can use this operation to cancel a transfer (transfer destinations can use <a>RejectCertificateTransfer</a> instead). After transfer, AWS IoT returns the certificate to the source account in the INACTIVE state. Once the destination account has accepted the transfer, the transfer may no longer be cancelled.</p> <p>After a certificate transfer is cancelled, the status of the certificate changes from PENDING_TRANSFER to INACTIVE.</p>\" \
    }, \
    \"CreateCertificateFromCsr\":{ \
      \"name\":\"CreateCertificateFromCsr\", \
      \"http\":{ \
        \"method\":\"POST\", \
        \"requestUri\":\"/certificates\" \
      }, \
      \"input\":{ \
        \"shape\":\"CreateCertificateFromCsrRequest\", \
        \"documentation\":\"<p>The input for the CreateCertificateFromCsr operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"CreateCertificateFromCsrResponse\", \
        \"documentation\":\"<p>The output from the CreateCertificateFromCsr operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Creates an X.509 certificate using the specified certificate signing request.</p> <p><b>Note</b> Reusing the same certificate signing request (CSR) results in a distinct certificate.</p> <p>You can create multiple certificates in a batch by creating a directory and copying multiple .csr files into that directory and specifying that directory on the command line. The following commands show how to create a batch of certificates given a batch of CSRs. </p> <p>Assuming a set of CSRs are located inside of the directory my-csr-directory:</p>&gt; <p>On Linux and OSX, the command is:</p> <p>$ ls my-csr-directory/ | xargs -I {} aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/{}</p> <p> This command lists all of the CSRs in my-csr-directory and pipes each CSR filename to the aws iot create-certificate-from-csr AWS CLI command to create a certificate for the corresponding CSR. </p> <p> The aws iot create-certificate-from-csr part of the command can also be run in parallel to speed up the certificate creation process: </p> <p> $ ls my-csr-directory/ | xargs -P 10 -I {} aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/{} </p> <p> On Windows PowerShell, the command to create certificates for all CSRs in my-csr-directory is: </p> <p> &gt; ls -Name my-csr-directory | %{aws iot create-certificate-from-csr --certificate-signing-request file://my-csr-directory/$_} </p> <p> On Windows Command Prompt, the command to create certificates for all CSRs in my-csr-directory is: </p> <p> &gt; forfiles /p my-csr-directory /c \\\"cmd /c aws iot create-certificate-from-csr --certificate-signing-request file://@path\\\"</p>\" \
    }, \
    \"CreateKeysAndCertificate\":{ \
      \"name\":\"CreateKeysAndCertificate\", \
      \"http\":{ \
        \"method\":\"POST\", \
        \"requestUri\":\"/keys-and-certificate\" \
      }, \
      \"input\":{ \
        \"shape\":\"CreateKeysAndCertificateRequest\", \
        \"documentation\":\"<p>The input for the CreateKeysAndCertificate operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"CreateKeysAndCertificateResponse\", \
        \"documentation\":\"<p>The output of the CreateKeysAndCertificate operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Creates a 2048 bit RSA key pair and issues an X.509 certificate using the issued public key.</p> <p><b>Note</b> This is the only time AWS IoT issues the private key for this certificate. It is important to keep track of the private key.</p>\" \
    }, \
    \"CreatePolicy\":{ \
      \"name\":\"CreatePolicy\", \
      \"http\":{ \
        \"method\":\"POST\", \
        \"requestUri\":\"/policies/{policyName}\" \
      }, \
      \"input\":{ \
        \"shape\":\"CreatePolicyRequest\", \
        \"documentation\":\"<p>The input for the CreatePolicy operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"CreatePolicyResponse\", \
        \"documentation\":\"<p>The output from the CreatePolicy operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceAlreadyExistsException\", \
          \"error\":{\"httpStatusCode\":409}, \
          \"exception\":true, \
          \"documentation\":\"<p>The resource already exists.</p>\" \
        }, \
        { \
          \"shape\":\"MalformedPolicyException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The policy documentation is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Creates an AWS IoT policy.</p> <p>The created policy is the default version for the policy. This operation creates a policy version with a version identifier of <b>1</b> and sets <b>1</b> as the policy's default version.</p>\" \
    }, \
    \"CreatePolicyVersion\":{ \
      \"name\":\"CreatePolicyVersion\", \
      \"http\":{ \
        \"method\":\"POST\", \
        \"requestUri\":\"/policies/{policyName}/version\" \
      }, \
      \"input\":{ \
        \"shape\":\"CreatePolicyVersionRequest\", \
        \"documentation\":\"<p>The input for the CreatePolicyVersion operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"CreatePolicyVersionResponse\", \
        \"documentation\":\"<p>The output of the CreatePolicyVersion operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"MalformedPolicyException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The policy documentation is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"VersionsLimitExceededException\", \
          \"error\":{\"httpStatusCode\":409}, \
          \"exception\":true, \
          \"documentation\":\"<p>The number of policy versions exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Creates a new version of the specified AWS IoT policy. To update a policy, create a new policy version. A managed policy can have up to five versions. If the policy has five versions, you must delete an existing version using <a>DeletePolicyVersion</a> before you create a new version.</p> <p>Optionally, you can set the new version as the policy's default version. The default version is the operative version; that is, the version that is in effect for the certificates that the policy is attached to.</p>\" \
    }, \
    \"CreateThing\":{ \
      \"name\":\"CreateThing\", \
      \"http\":{ \
        \"method\":\"POST\", \
        \"requestUri\":\"/things/{thingName}\" \
      }, \
      \"input\":{ \
        \"shape\":\"CreateThingRequest\", \
        \"documentation\":\"<p>The input for the CreateThing operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"CreateThingResponse\", \
        \"documentation\":\"<p>The output of the CreateThing operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"ResourceAlreadyExistsException\", \
          \"error\":{\"httpStatusCode\":409}, \
          \"exception\":true, \
          \"documentation\":\"<p>The resource already exists.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Creates a thing in the thing registry.</p>\" \
    }, \
    \"CreateTopicRule\":{ \
      \"name\":\"CreateTopicRule\", \
      \"http\":{ \
        \"method\":\"POST\", \
        \"requestUri\":\"/rules/{ruleName}\" \
      }, \
      \"input\":{ \
        \"shape\":\"CreateTopicRuleRequest\", \
        \"documentation\":\"<p>The input for the CreateTopicRule operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"SqlParseException\", \
          \"error\":{\"httpStatusCode\":406}, \
          \"exception\":true, \
          \"documentation\":\"<p>The Rule-SQL expression can't be parsed correctly.</p>\" \
        }, \
        { \
          \"shape\":\"InternalException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ResourceAlreadyExistsException\", \
          \"error\":{\"httpStatusCode\":409}, \
          \"exception\":true, \
          \"documentation\":\"<p>The resource already exists.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Creates a rule.</p>\" \
    }, \
    \"DeleteCertificate\":{ \
      \"name\":\"DeleteCertificate\", \
      \"http\":{ \
        \"method\":\"DELETE\", \
        \"requestUri\":\"/certificates/{certificateId}\" \
      }, \
      \"input\":{ \
        \"shape\":\"DeleteCertificateRequest\", \
        \"documentation\":\"<p>The input for the DeleteCertificate operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"DeleteConflictException\", \
          \"error\":{\"httpStatusCode\":409}, \
          \"exception\":true, \
          \"documentation\":\"<p>You can't delete the resource because it is attached to one or more resources.</p>\" \
        }, \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"CertificateStateException\", \
          \"error\":{\"httpStatusCode\":406}, \
          \"exception\":true, \
          \"documentation\":\"<p>The certificate operation is not allowed.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Deletes the specified certificate.</p> <p>A certificate cannot be deleted if it has a policy attached to it or if its status is set to ACTIVE. To delete a certificate, first detach all policies using the <a>DetachPrincipalPolicy</a> API. Next use the <a>UpdateCertificate</a> API to set the certificate to the INACTIVE status.</p>\" \
    }, \
    \"DeletePolicy\":{ \
      \"name\":\"DeletePolicy\", \
      \"http\":{ \
        \"method\":\"DELETE\", \
        \"requestUri\":\"/policies/{policyName}\" \
      }, \
      \"input\":{ \
        \"shape\":\"DeletePolicyRequest\", \
        \"documentation\":\"<p>The input for the DeletePolicy operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"DeleteConflictException\", \
          \"error\":{\"httpStatusCode\":409}, \
          \"exception\":true, \
          \"documentation\":\"<p>You can't delete the resource because it is attached to one or more resources.</p>\" \
        }, \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Deletes the specified policy.</p> <p>A policy cannot be deleted if it has non-default versions and/or it is attached to any certificate.</p> <p>To delete a policy, delete all non-default versions of the policy using the DeletePolicyVersion API, detach the policy from any certificate using the DetachPrincipalPolicy API, and then use the DeletePolicy API to delete the policy.</p> <p>When a policy is deleted using DeletePolicy, its default version is deleted with it.</p>\" \
    }, \
    \"DeletePolicyVersion\":{ \
      \"name\":\"DeletePolicyVersion\", \
      \"http\":{ \
        \"method\":\"DELETE\", \
        \"requestUri\":\"/policies/{policyName}/version/{policyVersionId}\" \
      }, \
      \"input\":{ \
        \"shape\":\"DeletePolicyVersionRequest\", \
        \"documentation\":\"<p>The input for the DeletePolicyVersion operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"DeleteConflictException\", \
          \"error\":{\"httpStatusCode\":409}, \
          \"exception\":true, \
          \"documentation\":\"<p>You can't delete the resource because it is attached to one or more resources.</p>\" \
        }, \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Deletes the specified version of the specified policy. You cannot delete the default version of a policy using this API. To delete the default version of a policy, use <a>DeletePolicy</a>. To find out which version of a policy is marked as the default version, use ListPolicyVersions.</p>\" \
    }, \
    \"DeleteThing\":{ \
      \"name\":\"DeleteThing\", \
      \"http\":{ \
        \"method\":\"DELETE\", \
        \"requestUri\":\"/things/{thingName}\" \
      }, \
      \"input\":{ \
        \"shape\":\"DeleteThingRequest\", \
        \"documentation\":\"<p>The input for the DeleteThing operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"DeleteThingResponse\", \
        \"documentation\":\"<p>The output of the DeleteThing operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Deletes the specified thing from the Thing Registry.</p>\" \
    }, \
    \"DeleteTopicRule\":{ \
      \"name\":\"DeleteTopicRule\", \
      \"http\":{ \
        \"method\":\"DELETE\", \
        \"requestUri\":\"/rules/{ruleName}\" \
      }, \
      \"input\":{ \
        \"shape\":\"DeleteTopicRuleRequest\", \
        \"documentation\":\"<p>The input for the DeleteTopicRule operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InternalException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Deletes the specified rule.</p>\" \
    }, \
    \"DescribeCertificate\":{ \
      \"name\":\"DescribeCertificate\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/certificates/{certificateId}\" \
      }, \
      \"input\":{ \
        \"shape\":\"DescribeCertificateRequest\", \
        \"documentation\":\"<p>The input for the DescribeCertificate operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"DescribeCertificateResponse\", \
        \"documentation\":\"<p>The output of the DescribeCertificate operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Gets information about the specified certificate.</p>\" \
    }, \
    \"DescribeEndpoint\":{ \
      \"name\":\"DescribeEndpoint\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/endpoint\" \
      }, \
      \"input\":{ \
        \"shape\":\"DescribeEndpointRequest\", \
        \"documentation\":\"<p>The input for the DescribeEndpoint operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"DescribeEndpointResponse\", \
        \"documentation\":\"<p>The output from the DescribeEndpoint operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Returns a unique endpoint specific to the AWS account making the call. You specify the following URI when updating state information for your thing: https://<i>endpoint</i>/things/<i>thingName</i>/shadow.</p>\" \
    }, \
    \"DescribeThing\":{ \
      \"name\":\"DescribeThing\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/things/{thingName}\" \
      }, \
      \"input\":{ \
        \"shape\":\"DescribeThingRequest\", \
        \"documentation\":\"<p>The input for the DescribeThing operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"DescribeThingResponse\", \
        \"documentation\":\"<p>The output from the DescribeThing operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Gets information about the specified thing.</p>\" \
    }, \
    \"DetachPrincipalPolicy\":{ \
      \"name\":\"DetachPrincipalPolicy\", \
      \"http\":{ \
        \"method\":\"DELETE\", \
        \"requestUri\":\"/principal-policies/{policyName}\" \
      }, \
      \"input\":{ \
        \"shape\":\"DetachPrincipalPolicyRequest\", \
        \"documentation\":\"<p>The input for the DetachPrincipalPolicy operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Removes the specified policy from the specified certificate.</p>\" \
    }, \
    \"DetachThingPrincipal\":{ \
      \"name\":\"DetachThingPrincipal\", \
      \"http\":{ \
        \"method\":\"DELETE\", \
        \"requestUri\":\"/things/{thingName}/principals\" \
      }, \
      \"input\":{ \
        \"shape\":\"DetachThingPrincipalRequest\", \
        \"documentation\":\"<p>The input for the DetachThingPrincipal operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"DetachThingPrincipalResponse\", \
        \"documentation\":\"<p>The output from the DetachThingPrincipal operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Detaches the specified principal from the specified thing.</p>\" \
    }, \
    \"GetLoggingOptions\":{ \
      \"name\":\"GetLoggingOptions\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/loggingOptions\" \
      }, \
      \"input\":{ \
        \"shape\":\"GetLoggingOptionsRequest\", \
        \"documentation\":\"<p>The input for the GetLoggingOptions operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"GetLoggingOptionsResponse\", \
        \"documentation\":\"<p>The output from the GetLoggingOptions operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InternalException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Gets the logging options.</p>\" \
    }, \
    \"GetPolicy\":{ \
      \"name\":\"GetPolicy\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/policies/{policyName}\" \
      }, \
      \"input\":{ \
        \"shape\":\"GetPolicyRequest\", \
        \"documentation\":\"<p>The input for the GetPolicy operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"GetPolicyResponse\", \
        \"documentation\":\"<p>The output from the GetPolicy operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Gets information about the specified policy with the policy document of the default version.</p>\" \
    }, \
    \"GetPolicyVersion\":{ \
      \"name\":\"GetPolicyVersion\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/policies/{policyName}/version/{policyVersionId}\" \
      }, \
      \"input\":{ \
        \"shape\":\"GetPolicyVersionRequest\", \
        \"documentation\":\"<p>The input for the GetPolicyVersion operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"GetPolicyVersionResponse\", \
        \"documentation\":\"<p>The output from the GetPolicyVersion operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Gets information about the specified policy version.</p>\" \
    }, \
    \"GetTopicRule\":{ \
      \"name\":\"GetTopicRule\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/rules/{ruleName}\" \
      }, \
      \"input\":{ \
        \"shape\":\"GetTopicRuleRequest\", \
        \"documentation\":\"<p>The input for the GetTopicRule operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"GetTopicRuleResponse\", \
        \"documentation\":\"<p>The output from the GetTopicRule operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InternalException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Gets information about the specified rule.</p>\" \
    }, \
    \"ListCertificates\":{ \
      \"name\":\"ListCertificates\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/certificates\" \
      }, \
      \"input\":{ \
        \"shape\":\"ListCertificatesRequest\", \
        \"documentation\":\"<p>The input for the ListCertificates operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"ListCertificatesResponse\", \
        \"documentation\":\"<p>The output of the ListCertificates operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Lists your certificates.</p> <p>The results are paginated with a default page size of 25. You can retrieve additional results using the returned marker.</p>\" \
    }, \
    \"ListPolicies\":{ \
      \"name\":\"ListPolicies\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/policies\" \
      }, \
      \"input\":{ \
        \"shape\":\"ListPoliciesRequest\", \
        \"documentation\":\"<p>The input for the ListPolicies operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"ListPoliciesResponse\", \
        \"documentation\":\"<p>The output from the ListPolicies operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Lists your policies.</p>\" \
    }, \
    \"ListPolicyVersions\":{ \
      \"name\":\"ListPolicyVersions\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/policies/{policyName}/version\" \
      }, \
      \"input\":{ \
        \"shape\":\"ListPolicyVersionsRequest\", \
        \"documentation\":\"<p>The input for the ListPolicyVersions operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"ListPolicyVersionsResponse\", \
        \"documentation\":\"<p>The output from the ListPolicyVersions operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Lists the versions of the specified policy, and identifies the default version.</p>\" \
    }, \
    \"ListPrincipalPolicies\":{ \
      \"name\":\"ListPrincipalPolicies\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/principal-policies\" \
      }, \
      \"input\":{ \
        \"shape\":\"ListPrincipalPoliciesRequest\", \
        \"documentation\":\"<p>The input for the ListPrincipalPolicies operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"ListPrincipalPoliciesResponse\", \
        \"documentation\":\"<p>The output from the ListPrincipalPolicies operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Lists the policies attached to the specified principal. If you use an Amazon Cognito identity, the ID needs to be in <a href=\\\"http://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetCredentialsForIdentity.html#API_GetCredentialsForIdentity_RequestSyntax\\\">Amazon Cognito Identity format</a>.</p>\" \
    }, \
    \"ListPrincipalThings\":{ \
      \"name\":\"ListPrincipalThings\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/principals/things\" \
      }, \
      \"input\":{ \
        \"shape\":\"ListPrincipalThingsRequest\", \
        \"documentation\":\"<p>The input for the ListPrincipalThings operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"ListPrincipalThingsResponse\", \
        \"documentation\":\"<p>The output from the ListPrincipalThings operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Lists the things associated with the specified principal.</p>\" \
    }, \
    \"ListThingPrincipals\":{ \
      \"name\":\"ListThingPrincipals\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/things/{thingName}/principals\" \
      }, \
      \"input\":{ \
        \"shape\":\"ListThingPrincipalsRequest\", \
        \"documentation\":\"<p>The input for the ListThingPrincipal operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"ListThingPrincipalsResponse\", \
        \"documentation\":\"<p>The output from the ListThingPrincipals operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Lists the principals associated with the specified thing.</p>\" \
    }, \
    \"ListThings\":{ \
      \"name\":\"ListThings\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/things\" \
      }, \
      \"input\":{ \
        \"shape\":\"ListThingsRequest\", \
        \"documentation\":\"<p>The input for the ListThings operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"ListThingsResponse\", \
        \"documentation\":\"<p>The output from the ListThings operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Lists your things. You can pass an AttributeName and/or AttributeValue to filter your things. For example: \\\"ListThings where AttributeName=Color and AttributeValue=Red\\\"</p>\" \
    }, \
    \"ListTopicRules\":{ \
      \"name\":\"ListTopicRules\", \
      \"http\":{ \
        \"method\":\"GET\", \
        \"requestUri\":\"/rules\" \
      }, \
      \"input\":{ \
        \"shape\":\"ListTopicRulesRequest\", \
        \"documentation\":\"<p>The input for the ListTopicRules operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"ListTopicRulesResponse\", \
        \"documentation\":\"<p>The output from the ListTopicRules operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InternalException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Lists the rules for the specific topic.</p>\" \
    }, \
    \"RejectCertificateTransfer\":{ \
      \"name\":\"RejectCertificateTransfer\", \
      \"http\":{ \
        \"method\":\"PATCH\", \
        \"requestUri\":\"/reject-certificate-transfer/{certificateId}\" \
      }, \
      \"input\":{ \
        \"shape\":\"RejectCertificateTransferRequest\", \
        \"documentation\":\"<p>The input for the RejectCertificateTransfer operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"TransferAlreadyCompletedException\", \
          \"error\":{\"httpStatusCode\":410}, \
          \"exception\":true, \
          \"documentation\":\"<p>You can't revert the certificate transfer because it has already completed.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Rejects a pending certificate transfer. After AWS IoT rejects a certificate transfer, the certificate status changes from <b>PENDING_TRANFER</b> to <b>INACTIVE</b>.</p> <p>To check for pending certificate transfers, call <a>ListCertificates</a> to enumerate your certificates.</p> <p>This operation can only be called by the transfer destination. Once called, the certificate will be returned to the source's account in the INACTIVE state.</p>\" \
    }, \
    \"ReplaceTopicRule\":{ \
      \"name\":\"ReplaceTopicRule\", \
      \"http\":{ \
        \"method\":\"PATCH\", \
        \"requestUri\":\"/rules/{ruleName}\" \
      }, \
      \"input\":{ \
        \"shape\":\"ReplaceTopicRuleRequest\", \
        \"documentation\":\"<p>The input for the ReplaceTopicRule operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"SqlParseException\", \
          \"error\":{\"httpStatusCode\":406}, \
          \"exception\":true, \
          \"documentation\":\"<p>The Rule-SQL expression can't be parsed correctly.</p>\" \
        }, \
        { \
          \"shape\":\"InternalException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Replaces the specified rule. You must specify all parameters for the new rule.</p>\" \
    }, \
    \"SetDefaultPolicyVersion\":{ \
      \"name\":\"SetDefaultPolicyVersion\", \
      \"http\":{ \
        \"method\":\"PATCH\", \
        \"requestUri\":\"/policies/{policyName}/version/{policyVersionId}\" \
      }, \
      \"input\":{ \
        \"shape\":\"SetDefaultPolicyVersionRequest\", \
        \"documentation\":\"<p>The input for the SetDefaultPolicyVersion operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Sets the specified version of the specified policy as the policy's default (operative) version. This action affects all certificates that the policy is attached to. To list the principals the policy is attached to, use the ListPrincipalPolicy API.</p>\" \
    }, \
    \"SetLoggingOptions\":{ \
      \"name\":\"SetLoggingOptions\", \
      \"http\":{ \
        \"method\":\"POST\", \
        \"requestUri\":\"/loggingOptions\" \
      }, \
      \"input\":{ \
        \"shape\":\"SetLoggingOptionsRequest\", \
        \"documentation\":\"<p>The input for the SetLoggingOptions operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InternalException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Sets the logging options.</p>\" \
    }, \
    \"TransferCertificate\":{ \
      \"name\":\"TransferCertificate\", \
      \"http\":{ \
        \"method\":\"PATCH\", \
        \"requestUri\":\"/transfer-certificate/{certificateId}\" \
      }, \
      \"input\":{ \
        \"shape\":\"TransferCertificateRequest\", \
        \"documentation\":\"<p>The input for the TransferCertificate operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"TransferCertificateResponse\", \
        \"documentation\":\"<p>The output from the TransferCertificate operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"CertificateStateException\", \
          \"error\":{\"httpStatusCode\":406}, \
          \"exception\":true, \
          \"documentation\":\"<p>The certificate operation is not allowed.</p>\" \
        }, \
        { \
          \"shape\":\"TransferConflictException\", \
          \"error\":{\"httpStatusCode\":409}, \
          \"exception\":true, \
          \"documentation\":\"<p>You can't transfer the the certificate because authorization policies are still attached.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Transfers the specified certificate to the specified AWS account.</p> <p>You can cancel the transfer until it is acknowledged by the recipient.</p> <p>No notification is sent to the transfer destination's account, it is up to the caller to notify the transfer target.</p> <p>The certificate being transferred must not be in the ACTIVE state. It can be deactivated using the UpdateCertificate API.</p> <p>The certificate must not have any policies attached to it. These can be detached using the DetachPrincipalPolicy API.</p>\" \
    }, \
    \"UpdateCertificate\":{ \
      \"name\":\"UpdateCertificate\", \
      \"http\":{ \
        \"method\":\"PUT\", \
        \"requestUri\":\"/certificates/{certificateId}\" \
      }, \
      \"input\":{ \
        \"shape\":\"UpdateCertificateRequest\", \
        \"documentation\":\"<p>The input for the UpdateCertificate operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        }, \
        { \
          \"shape\":\"CertificateStateException\", \
          \"error\":{\"httpStatusCode\":406}, \
          \"exception\":true, \
          \"documentation\":\"<p>The certificate operation is not allowed.</p>\" \
        }, \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Updates the status of the specified certificate. This operation is idempotent.</p> <p>Moving a cert from the ACTIVE state (including REVOKED) will NOT disconnect currently-connected devices, although these devices will be unable to reconnect.</p> <p>The ACTIVE state is required to authenticate devices connecting to AWS IoT using a certificate.</p>\" \
    }, \
    \"UpdateThing\":{ \
      \"name\":\"UpdateThing\", \
      \"http\":{ \
        \"method\":\"PATCH\", \
        \"requestUri\":\"/things/{thingName}\" \
      }, \
      \"input\":{ \
        \"shape\":\"UpdateThingRequest\", \
        \"documentation\":\"<p>The input for the UpdateThing operation.</p>\" \
      }, \
      \"output\":{ \
        \"shape\":\"UpdateThingResponse\", \
        \"documentation\":\"<p>The output from the UpdateThing operation.</p>\" \
      }, \
      \"errors\":[ \
        { \
          \"shape\":\"InvalidRequestException\", \
          \"error\":{\"httpStatusCode\":400}, \
          \"exception\":true, \
          \"documentation\":\"<p>The request is not valid.</p>\" \
        }, \
        { \
          \"shape\":\"ThrottlingException\", \
          \"error\":{\"httpStatusCode\":429}, \
          \"exception\":true, \
          \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
        }, \
        { \
          \"shape\":\"UnauthorizedException\", \
          \"error\":{\"httpStatusCode\":401}, \
          \"exception\":true, \
          \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
        }, \
        { \
          \"shape\":\"ServiceUnavailableException\", \
          \"error\":{\"httpStatusCode\":503}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
        }, \
        { \
          \"shape\":\"InternalFailureException\", \
          \"error\":{\"httpStatusCode\":500}, \
          \"exception\":true, \
          \"fault\":true, \
          \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
        }, \
        { \
          \"shape\":\"ResourceNotFoundException\", \
          \"error\":{\"httpStatusCode\":404}, \
          \"exception\":true, \
          \"documentation\":\"<p>The specified resource does not exist.</p>\" \
        } \
      ], \
      \"documentation\":\"<p>Updates the data for a thing.</p>\" \
    } \
  }, \
  \"shapes\":{ \
    \"AcceptCertificateTransferRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"certificateId\"], \
      \"members\":{ \
        \"certificateId\":{ \
          \"shape\":\"CertificateId\", \
          \"location\":\"uri\", \
          \"locationName\":\"certificateId\", \
          \"documentation\":\"<p>The ID of the certificate.</p>\" \
        }, \
        \"setAsActive\":{ \
          \"shape\":\"SetAsActive\", \
          \"location\":\"querystring\", \
          \"locationName\":\"setAsActive\", \
          \"documentation\":\"<p>Specifies whether the certificate is active.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the AcceptCertificateTransfer operation.</p>\" \
    }, \
    \"Action\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"dynamoDB\":{ \
          \"shape\":\"DynamoDBAction\", \
          \"documentation\":\"<p>Write to a DynamoDB table.</p>\" \
        }, \
        \"lambda\":{ \
          \"shape\":\"LambdaAction\", \
          \"documentation\":\"<p>Invoke a Lambda function.</p>\" \
        }, \
        \"sns\":{ \
          \"shape\":\"SnsAction\", \
          \"documentation\":\"<p>Publish to an SNS topic.</p>\" \
        }, \
        \"sqs\":{ \
          \"shape\":\"SqsAction\", \
          \"documentation\":\"<p>Publish to an SQS queue.</p>\" \
        }, \
        \"kinesis\":{ \
          \"shape\":\"KinesisAction\", \
          \"documentation\":\"<p>Write data to a Kinesis stream.</p>\" \
        }, \
        \"republish\":{ \
          \"shape\":\"RepublishAction\", \
          \"documentation\":\"<p>Publish to another MQTT topic.</p>\" \
        }, \
        \"s3\":{ \
          \"shape\":\"S3Action\", \
          \"documentation\":\"<p>Write to an S3 bucket.</p>\" \
        }, \
        \"firehose\":{\"shape\":\"FirehoseAction\"} \
      }, \
      \"documentation\":\"<p>Describes the actions associated with a rule.</p>\" \
    }, \
    \"ActionList\":{ \
      \"type\":\"list\", \
      \"member\":{\"shape\":\"Action\"}, \
      \"min\":0, \
      \"max\":10 \
    }, \
    \"AscendingOrder\":{\"type\":\"boolean\"}, \
    \"AttachPrincipalPolicyRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"policyName\", \
        \"principal\" \
      ], \
      \"members\":{ \
        \"policyName\":{ \
          \"shape\":\"PolicyName\", \
          \"location\":\"uri\", \
          \"locationName\":\"policyName\", \
          \"documentation\":\"<p>The policy name.</p>\" \
        }, \
        \"principal\":{ \
          \"shape\":\"Principal\", \
          \"location\":\"header\", \
          \"locationName\":\"x-amzn-iot-principal\", \
          \"documentation\":\"<p>The principal which can be a certificate ARN (as returned from the CreateCertificate operation) or a Cognito ID.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the AttachPrincipalPolicy operation.</p>\" \
    }, \
    \"AttachThingPrincipalRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"thingName\", \
        \"principal\" \
      ], \
      \"members\":{ \
        \"thingName\":{ \
          \"shape\":\"ThingName\", \
          \"location\":\"uri\", \
          \"locationName\":\"thingName\", \
          \"documentation\":\"<p>The name of the thing.</p>\" \
        }, \
        \"principal\":{ \
          \"shape\":\"Principal\", \
          \"location\":\"header\", \
          \"locationName\":\"x-amzn-principal\", \
          \"documentation\":\"<p>The principal (certificate or other credential).</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the AttachThingPrincipal operation.</p>\" \
    }, \
    \"AttachThingPrincipalResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
      }, \
      \"documentation\":\"<p>The output from the AttachThingPrincipal operation.</p>\" \
    }, \
    \"AttributeName\":{ \
      \"type\":\"string\", \
      \"max\":128, \
      \"pattern\":\"[a-zA-Z0-9_.,@/:#-]+\" \
    }, \
    \"AttributePayload\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"attributes\":{ \
          \"shape\":\"Attributes\", \
          \"documentation\":\"<p>A JSON string containing up to three key-value pair in JSON format.</p> <p>For example: {\\\\\\\"attributes\\\\\\\":{\\\\\\\"string1\\\\\\\":\\\\\\\"string2\\\\\\\"}}</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The attribute payload, a JSON string containing up to three key-value pairs.</p> <p>For example: {\\\\\\\"attributes\\\\\\\":{\\\\\\\"string1\\\\\\\":\\\\\\\"string2\\\\\\\"}}</p>\" \
    }, \
    \"AttributeValue\":{ \
      \"type\":\"string\", \
      \"max\":1024, \
      \"pattern\":\"[a-zA-Z0-9_.,@/:#-]+\" \
    }, \
    \"Attributes\":{ \
      \"type\":\"map\", \
      \"key\":{\"shape\":\"AttributeName\"}, \
      \"value\":{\"shape\":\"AttributeValue\"} \
    }, \
    \"AwsAccountId\":{ \
      \"type\":\"string\", \
      \"pattern\":\"[0-9]{12}\" \
    }, \
    \"AwsArn\":{\"type\":\"string\"}, \
    \"BucketName\":{\"type\":\"string\"}, \
    \"CancelCertificateTransferRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"certificateId\"], \
      \"members\":{ \
        \"certificateId\":{ \
          \"shape\":\"CertificateId\", \
          \"location\":\"uri\", \
          \"locationName\":\"certificateId\", \
          \"documentation\":\"<p>The ID of the certificate.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the CancelCertificateTransfer operation.</p>\" \
    }, \
    \"Certificate\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"certificateArn\":{ \
          \"shape\":\"CertificateArn\", \
          \"documentation\":\"<p>The ARN of the certificate.</p>\" \
        }, \
        \"certificateId\":{ \
          \"shape\":\"CertificateId\", \
          \"documentation\":\"<p>The ID of the certificate.</p>\" \
        }, \
        \"status\":{ \
          \"shape\":\"CertificateStatus\", \
          \"documentation\":\"<p>The status of the certificate.</p>\" \
        }, \
        \"creationDate\":{ \
          \"shape\":\"DateType\", \
          \"documentation\":\"<p>The date and time the certificate was created.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Information about a certificate.</p>\" \
    }, \
    \"CertificateArn\":{\"type\":\"string\"}, \
    \"CertificateDescription\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"certificateArn\":{ \
          \"shape\":\"CertificateArn\", \
          \"documentation\":\"<p>The ARN of the certificate.</p>\" \
        }, \
        \"certificateId\":{ \
          \"shape\":\"CertificateId\", \
          \"documentation\":\"<p>The ID of the certificate.</p>\" \
        }, \
        \"status\":{ \
          \"shape\":\"CertificateStatus\", \
          \"documentation\":\"<p>The status of the certificate.</p>\" \
        }, \
        \"certificatePem\":{ \
          \"shape\":\"CertificatePem\", \
          \"documentation\":\"<p>The certificate data, in PEM format.</p>\" \
        }, \
        \"ownedBy\":{ \
          \"shape\":\"AwsAccountId\", \
          \"documentation\":\"<p>The ID of the AWS account that owns the certificate.</p>\" \
        }, \
        \"creationDate\":{ \
          \"shape\":\"DateType\", \
          \"documentation\":\"<p>The date and time the certificate was created.</p>\" \
        }, \
        \"lastModifiedDate\":{ \
          \"shape\":\"DateType\", \
          \"documentation\":\"<p>The date and time the certificate was last modified.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes a certificate.</p>\" \
    }, \
    \"CertificateId\":{ \
      \"type\":\"string\", \
      \"min\":64, \
      \"max\":64, \
      \"pattern\":\"(0x)?[a-fA-F0-9]+\" \
    }, \
    \"CertificatePem\":{ \
      \"type\":\"string\", \
      \"min\":1 \
    }, \
    \"CertificateSigningRequest\":{ \
      \"type\":\"string\", \
      \"min\":1 \
    }, \
    \"CertificateStateException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":406}, \
      \"exception\":true, \
      \"documentation\":\"<p>The certificate operation is not allowed.</p>\" \
    }, \
    \"CertificateStatus\":{ \
      \"type\":\"string\", \
      \"enum\":[ \
        \"ACTIVE\", \
        \"INACTIVE\", \
        \"REVOKED\", \
        \"PENDING_TRANSFER\" \
      ] \
    }, \
    \"Certificates\":{ \
      \"type\":\"list\", \
      \"member\":{\"shape\":\"Certificate\"} \
    }, \
    \"ClientId\":{\"type\":\"string\"}, \
    \"CreateCertificateFromCsrRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"certificateSigningRequest\"], \
      \"members\":{ \
        \"certificateSigningRequest\":{ \
          \"shape\":\"CertificateSigningRequest\", \
          \"documentation\":\"<p>The certificate signing request (CSR).</p>\" \
        }, \
        \"setAsActive\":{ \
          \"shape\":\"SetAsActive\", \
          \"location\":\"querystring\", \
          \"locationName\":\"setAsActive\", \
          \"documentation\":\"<p>Specifies whether the certificate is active.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the CreateCertificateFromCsr operation.</p>\" \
    }, \
    \"CreateCertificateFromCsrResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"certificateArn\":{ \
          \"shape\":\"CertificateArn\", \
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the certificate. You can use the ARN as a principal for policy operations.</p>\" \
        }, \
        \"certificateId\":{ \
          \"shape\":\"CertificateId\", \
          \"documentation\":\"<p>The ID of the certificate. Certificate management operations only take a certificateId.</p>\" \
        }, \
        \"certificatePem\":{ \
          \"shape\":\"CertificatePem\", \
          \"documentation\":\"<p>The certificate data, in PEM format.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the CreateCertificateFromCsr operation.</p>\" \
    }, \
    \"CreateKeysAndCertificateRequest\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"setAsActive\":{ \
          \"shape\":\"SetAsActive\", \
          \"location\":\"querystring\", \
          \"locationName\":\"setAsActive\", \
          \"documentation\":\"<p>Specifies whether the certificate is active.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the CreateKeysAndCertificate operation.</p>\" \
    }, \
    \"CreateKeysAndCertificateResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"certificateArn\":{ \
          \"shape\":\"CertificateArn\", \
          \"documentation\":\"<p>The ARN of the certificate.</p>\" \
        }, \
        \"certificateId\":{ \
          \"shape\":\"CertificateId\", \
          \"documentation\":\"<p>The ID of the certificate. AWS IoT issues a default subject name for the certificate (e.g., AWS IoT Certificate).</p>\" \
        }, \
        \"certificatePem\":{ \
          \"shape\":\"CertificatePem\", \
          \"documentation\":\"<p>The certificate data, in PEM format.</p>\" \
        }, \
        \"keyPair\":{ \
          \"shape\":\"KeyPair\", \
          \"documentation\":\"<p>The generated key pair.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output of the CreateKeysAndCertificate operation.</p>\" \
    }, \
    \"CreatePolicyRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"policyName\", \
        \"policyDocument\" \
      ], \
      \"members\":{ \
        \"policyName\":{ \
          \"shape\":\"PolicyName\", \
          \"location\":\"uri\", \
          \"locationName\":\"policyName\", \
          \"documentation\":\"<p>The policy name.</p>\" \
        }, \
        \"policyDocument\":{ \
          \"shape\":\"PolicyDocument\", \
          \"documentation\":\"<p>The JSON document that describes the policy. The length of the <b>policyDocument</b> must be a minimum length of 1, with a maximum length of 2048, excluding whitespace.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the CreatePolicy operation.</p>\" \
    }, \
    \"CreatePolicyResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"policyName\":{ \
          \"shape\":\"PolicyName\", \
          \"documentation\":\"<p>The policy name.</p>\" \
        }, \
        \"policyArn\":{ \
          \"shape\":\"PolicyArn\", \
          \"documentation\":\"<p>The policy ARN.</p>\" \
        }, \
        \"policyDocument\":{ \
          \"shape\":\"PolicyDocument\", \
          \"documentation\":\"<p>The JSON document that describes the policy.</p>\" \
        }, \
        \"policyVersionId\":{ \
          \"shape\":\"PolicyVersionId\", \
          \"documentation\":\"<p>The policy version ID.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the CreatePolicy operation.</p>\" \
    }, \
    \"CreatePolicyVersionRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"policyName\", \
        \"policyDocument\" \
      ], \
      \"members\":{ \
        \"policyName\":{ \
          \"shape\":\"PolicyName\", \
          \"location\":\"uri\", \
          \"locationName\":\"policyName\", \
          \"documentation\":\"<p>The policy name.</p>\" \
        }, \
        \"policyDocument\":{ \
          \"shape\":\"PolicyDocument\", \
          \"documentation\":\"<p>The JSON document that describes the policy. Minimum length of 1. Maximum length of 2048 excluding whitespaces</p>\" \
        }, \
        \"setAsDefault\":{ \
          \"shape\":\"SetAsDefault\", \
          \"location\":\"querystring\", \
          \"locationName\":\"setAsDefault\", \
          \"documentation\":\"<p>Specifies whether the policy version is set as the default. When this parameter is true, the new policy version becomes the operative version; that is, the version that is in effect for the certificates that the policy is attached to.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the CreatePolicyVersion operation.</p>\" \
    }, \
    \"CreatePolicyVersionResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"policyArn\":{ \
          \"shape\":\"PolicyArn\", \
          \"documentation\":\"<p>The policy ARN.</p>\" \
        }, \
        \"policyDocument\":{ \
          \"shape\":\"PolicyDocument\", \
          \"documentation\":\"<p>The JSON document that describes the policy.</p>\" \
        }, \
        \"policyVersionId\":{ \
          \"shape\":\"PolicyVersionId\", \
          \"documentation\":\"<p>The policy version ID.</p>\" \
        }, \
        \"isDefaultVersion\":{ \
          \"shape\":\"IsDefaultVersion\", \
          \"documentation\":\"<p>Specifies whether the policy version is the default.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output of the CreatePolicyVersion operation.</p>\" \
    }, \
    \"CreateThingRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"thingName\"], \
      \"members\":{ \
        \"thingName\":{ \
          \"shape\":\"ThingName\", \
          \"location\":\"uri\", \
          \"locationName\":\"thingName\", \
          \"documentation\":\"<p>The name of the thing.</p>\" \
        }, \
        \"attributePayload\":{ \
          \"shape\":\"AttributePayload\", \
          \"documentation\":\"<p>The attribute payload. Which consists of up to 3 name/value pairs in a JSON document. For example: {\\\\\\\"attributes\\\\\\\":{\\\\\\\"string1\\\\\\\":\\\\\\\"string2\\\\\\\"}}</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the CreateThing operation.</p>\" \
    }, \
    \"CreateThingResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"thingName\":{ \
          \"shape\":\"ThingName\", \
          \"documentation\":\"<p>The name of the thing.</p>\" \
        }, \
        \"thingArn\":{ \
          \"shape\":\"ThingArn\", \
          \"documentation\":\"<p>The thing ARN.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output of the CreateThing operation.</p>\" \
    }, \
    \"CreateTopicRuleRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"ruleName\", \
        \"topicRulePayload\" \
      ], \
      \"members\":{ \
        \"ruleName\":{ \
          \"shape\":\"RuleName\", \
          \"location\":\"uri\", \
          \"locationName\":\"ruleName\", \
          \"documentation\":\"<p>The name of the rule.</p>\" \
        }, \
        \"topicRulePayload\":{ \
          \"shape\":\"TopicRulePayload\", \
          \"documentation\":\"<p>The rule payload.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the CreateTopicRule operation.</p>\", \
      \"payload\":\"topicRulePayload\" \
    }, \
    \"CreatedAtDate\":{\"type\":\"timestamp\"}, \
    \"DateType\":{\"type\":\"timestamp\"}, \
    \"DeleteCertificateRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"certificateId\"], \
      \"members\":{ \
        \"certificateId\":{ \
          \"shape\":\"CertificateId\", \
          \"location\":\"uri\", \
          \"locationName\":\"certificateId\", \
          \"documentation\":\"<p>The ID of the certificate.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the DeleteCertificate operation.</p>\" \
    }, \
    \"DeleteConflictException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":409}, \
      \"exception\":true, \
      \"documentation\":\"<p>You can't delete the resource because it is attached to one or more resources.</p>\" \
    }, \
    \"DeletePolicyRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"policyName\"], \
      \"members\":{ \
        \"policyName\":{ \
          \"shape\":\"PolicyName\", \
          \"location\":\"uri\", \
          \"locationName\":\"policyName\", \
          \"documentation\":\"<p>The name of the policy to delete.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the DeletePolicy operation.</p>\" \
    }, \
    \"DeletePolicyVersionRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"policyName\", \
        \"policyVersionId\" \
      ], \
      \"members\":{ \
        \"policyName\":{ \
          \"shape\":\"PolicyName\", \
          \"location\":\"uri\", \
          \"locationName\":\"policyName\", \
          \"documentation\":\"<p>The name of the policy.</p>\" \
        }, \
        \"policyVersionId\":{ \
          \"shape\":\"PolicyVersionId\", \
          \"location\":\"uri\", \
          \"locationName\":\"policyVersionId\", \
          \"documentation\":\"<p>The policy version ID.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the DeletePolicyVersion operation.</p>\" \
    }, \
    \"DeleteThingRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"thingName\"], \
      \"members\":{ \
        \"thingName\":{ \
          \"shape\":\"ThingName\", \
          \"location\":\"uri\", \
          \"locationName\":\"thingName\", \
          \"documentation\":\"<p>The thing name.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the DeleteThing operation.</p>\" \
    }, \
    \"DeleteThingResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
      }, \
      \"documentation\":\"<p>The output of the DeleteThing operation.</p>\" \
    }, \
    \"DeleteTopicRuleRequest\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"ruleName\":{ \
          \"shape\":\"RuleName\", \
          \"location\":\"uri\", \
          \"locationName\":\"ruleName\", \
          \"documentation\":\"<p>The name of the rule.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the DeleteTopicRule operation.</p>\", \
      \"required\":[\"ruleName\"] \
    }, \
    \"DeliveryStreamName\":{\"type\":\"string\"}, \
    \"DescribeCertificateRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"certificateId\"], \
      \"members\":{ \
        \"certificateId\":{ \
          \"shape\":\"CertificateId\", \
          \"location\":\"uri\", \
          \"locationName\":\"certificateId\", \
          \"documentation\":\"<p>The ID of the certificate.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the DescribeCertificate operation.</p>\" \
    }, \
    \"DescribeCertificateResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"certificateDescription\":{ \
          \"shape\":\"CertificateDescription\", \
          \"documentation\":\"<p>The description of the certificate.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output of the DescribeCertificate operation.</p>\" \
    }, \
    \"DescribeEndpointRequest\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
      }, \
      \"documentation\":\"<p>The input for the DescribeEndpoint operation.</p>\" \
    }, \
    \"DescribeEndpointResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"endpointAddress\":{ \
          \"shape\":\"EndpointAddress\", \
          \"documentation\":\"<p>The endpoint. The format of the endpoint is as follows: <i>identifier</i>.iot.<i>region</i>.amazonaws.com.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the DescribeEndpoint operation.</p>\" \
    }, \
    \"DescribeThingRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"thingName\"], \
      \"members\":{ \
        \"thingName\":{ \
          \"shape\":\"ThingName\", \
          \"location\":\"uri\", \
          \"locationName\":\"thingName\", \
          \"documentation\":\"<p>The name of the thing.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the DescribeThing operation.</p>\" \
    }, \
    \"DescribeThingResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"defaultClientId\":{ \
          \"shape\":\"ClientId\", \
          \"documentation\":\"<p>The default client ID.</p>\" \
        }, \
        \"thingName\":{ \
          \"shape\":\"ThingName\", \
          \"documentation\":\"<p>The name of the thing.</p>\" \
        }, \
        \"attributes\":{ \
          \"shape\":\"Attributes\", \
          \"documentation\":\"<p>The attributes which are name/value pairs in JSON format. For example: </p> <p>{\\\\\\\"attributes\\\\\\\":{\\\\\\\"some-name1\\\\\\\":\\\\\\\"some-value1\\\\\\\"}, {\\\\\\\"some-name2\\\\\\\":\\\\\\\"some-value2\\\\\\\"}, {\\\\\\\"some-name3\\\\\\\":\\\\\\\"some-value3\\\\\\\"}}</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the DescribeThing operation.</p>\" \
    }, \
    \"Description\":{\"type\":\"string\"}, \
    \"DetachPrincipalPolicyRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"policyName\", \
        \"principal\" \
      ], \
      \"members\":{ \
        \"policyName\":{ \
          \"shape\":\"PolicyName\", \
          \"location\":\"uri\", \
          \"locationName\":\"policyName\", \
          \"documentation\":\"<p>The name of the policy to detach.</p>\" \
        }, \
        \"principal\":{ \
          \"shape\":\"Principal\", \
          \"location\":\"header\", \
          \"locationName\":\"x-amzn-iot-principal\", \
          \"documentation\":\"<p>The principal</p> <p>If the principal is a certificate, specify the certificate ARN. If the principal is a Cognito identity specify the identity ID.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the DetachPrincipalPolicy operation.</p>\" \
    }, \
    \"DetachThingPrincipalRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"thingName\", \
        \"principal\" \
      ], \
      \"members\":{ \
        \"thingName\":{ \
          \"shape\":\"ThingName\", \
          \"location\":\"uri\", \
          \"locationName\":\"thingName\", \
          \"documentation\":\"<p>The name of the thing.</p>\" \
        }, \
        \"principal\":{ \
          \"shape\":\"Principal\", \
          \"location\":\"header\", \
          \"locationName\":\"x-amzn-principal\", \
          \"documentation\":\"<p>The principal.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the DetachThingPrincipal operation.</p>\" \
    }, \
    \"DetachThingPrincipalResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
      }, \
      \"documentation\":\"<p>The output from the DetachThingPrincipal operation.</p>\" \
    }, \
    \"DynamoDBAction\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"tableName\", \
        \"roleArn\", \
        \"hashKeyField\", \
        \"hashKeyValue\", \
        \"rangeKeyField\", \
        \"rangeKeyValue\" \
      ], \
      \"members\":{ \
        \"tableName\":{ \
          \"shape\":\"TableName\", \
          \"documentation\":\"<p>The name of the DynamoDB table.</p>\" \
        }, \
        \"roleArn\":{ \
          \"shape\":\"AwsArn\", \
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\" \
        }, \
        \"hashKeyField\":{ \
          \"shape\":\"HashKeyField\", \
          \"documentation\":\"<p>The hash key name.</p>\" \
        }, \
        \"hashKeyValue\":{ \
          \"shape\":\"HashKeyValue\", \
          \"documentation\":\"<p>The hash key value.</p>\" \
        }, \
        \"rangeKeyField\":{ \
          \"shape\":\"RangeKeyField\", \
          \"documentation\":\"<p>The range key name.</p>\" \
        }, \
        \"rangeKeyValue\":{ \
          \"shape\":\"RangeKeyValue\", \
          \"documentation\":\"<p>The range key value.</p>\" \
        }, \
        \"payloadField\":{ \
          \"shape\":\"PayloadField\", \
          \"documentation\":\"<p>The action payload, this name can be customized.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes an action to write to a DynamoDB table.</p> <p>The <code>tableName</code>, <code>hashKeyField</code>, and <code>rangeKeyField</code> values must match the values used when you created the table.</p> <p>The <code>hashKeyValue</code> and <code>rangeKeyvalue</code> fields use a substitution template syntax. These templates provide data at runtime. The syntax is as follows: ${<i>sql-expression</i>}.</p> <p>You can specify any expression that's valid in a WHERE or SELECT clause, including JSON properties, comparisons, calculations, and functions. For example, the following field uses the third level of the topic:</p> <p><code>\\\"hashKeyValue\\\": \\\"${topic(3)}\\\"</code></p> <p>The following field uses the timestamp:</p> <p><code>\\\"rangeKeyValue\\\": \\\"${timestamp()}\\\"</code></p>\" \
    }, \
    \"EndpointAddress\":{\"type\":\"string\"}, \
    \"FirehoseAction\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"roleArn\", \
        \"deliveryStreamName\" \
      ], \
      \"members\":{ \
        \"roleArn\":{\"shape\":\"AwsArn\"}, \
        \"deliveryStreamName\":{\"shape\":\"DeliveryStreamName\"} \
      } \
    }, \
    \"FunctionArn\":{\"type\":\"string\"}, \
    \"GetLoggingOptionsRequest\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
      }, \
      \"documentation\":\"<p>The input for the GetLoggingOptions operation.</p>\" \
    }, \
    \"GetLoggingOptionsResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"roleArn\":{ \
          \"shape\":\"AwsArn\", \
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\" \
        }, \
        \"logLevel\":{ \
          \"shape\":\"LogLevel\", \
          \"documentation\":\"<p>The logging level.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the GetLoggingOptions operation.</p>\" \
    }, \
    \"GetPolicyRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"policyName\"], \
      \"members\":{ \
        \"policyName\":{ \
          \"shape\":\"PolicyName\", \
          \"location\":\"uri\", \
          \"locationName\":\"policyName\", \
          \"documentation\":\"<p>The name of the policy.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the GetPolicy operation.</p>\" \
    }, \
    \"GetPolicyResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"policyName\":{ \
          \"shape\":\"PolicyName\", \
          \"documentation\":\"<p>The policy name.</p>\" \
        }, \
        \"policyArn\":{ \
          \"shape\":\"PolicyArn\", \
          \"documentation\":\"<p>The policy ARN.</p>\" \
        }, \
        \"policyDocument\":{ \
          \"shape\":\"PolicyDocument\", \
          \"documentation\":\"<p>The JSON document that describes the policy.</p>\" \
        }, \
        \"defaultVersionId\":{ \
          \"shape\":\"PolicyVersionId\", \
          \"documentation\":\"<p>The default policy version ID.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the GetPolicy operation.</p>\" \
    }, \
    \"GetPolicyVersionRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"policyName\", \
        \"policyVersionId\" \
      ], \
      \"members\":{ \
        \"policyName\":{ \
          \"shape\":\"PolicyName\", \
          \"location\":\"uri\", \
          \"locationName\":\"policyName\", \
          \"documentation\":\"<p>The name of the policy.</p>\" \
        }, \
        \"policyVersionId\":{ \
          \"shape\":\"PolicyVersionId\", \
          \"location\":\"uri\", \
          \"locationName\":\"policyVersionId\", \
          \"documentation\":\"<p>The policy version ID.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the GetPolicyVersion operation.</p>\" \
    }, \
    \"GetPolicyVersionResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"policyArn\":{ \
          \"shape\":\"PolicyArn\", \
          \"documentation\":\"<p>The policy ARN.</p>\" \
        }, \
        \"policyName\":{ \
          \"shape\":\"PolicyName\", \
          \"documentation\":\"<p>The policy name.</p>\" \
        }, \
        \"policyDocument\":{ \
          \"shape\":\"PolicyDocument\", \
          \"documentation\":\"<p>The JSON document that describes the policy.</p>\" \
        }, \
        \"policyVersionId\":{ \
          \"shape\":\"PolicyVersionId\", \
          \"documentation\":\"<p>The policy version ID.</p>\" \
        }, \
        \"isDefaultVersion\":{ \
          \"shape\":\"IsDefaultVersion\", \
          \"documentation\":\"<p>Specifies whether the policy version is the default.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the GetPolicyVersion operation.</p>\" \
    }, \
    \"GetTopicRuleRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"ruleName\"], \
      \"members\":{ \
        \"ruleName\":{ \
          \"shape\":\"RuleName\", \
          \"location\":\"uri\", \
          \"locationName\":\"ruleName\", \
          \"documentation\":\"<p>The name of the rule.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the GetTopicRule operation.</p>\" \
    }, \
    \"GetTopicRuleResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"rule\":{ \
          \"shape\":\"TopicRule\", \
          \"documentation\":\"<p>The rule.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the GetTopicRule operation.</p>\" \
    }, \
    \"HashKeyField\":{\"type\":\"string\"}, \
    \"HashKeyValue\":{\"type\":\"string\"}, \
    \"InternalException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":500}, \
      \"exception\":true, \
      \"fault\":true, \
      \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
    }, \
    \"InternalFailureException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":500}, \
      \"exception\":true, \
      \"fault\":true, \
      \"documentation\":\"<p>An unexpected error has occurred.</p>\" \
    }, \
    \"InvalidRequestException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":400}, \
      \"exception\":true, \
      \"documentation\":\"<p>The request is not valid.</p>\" \
    }, \
    \"IsDefaultVersion\":{\"type\":\"boolean\"}, \
    \"IsDisabled\":{\"type\":\"boolean\"}, \
    \"Key\":{\"type\":\"string\"}, \
    \"KeyPair\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"PublicKey\":{ \
          \"shape\":\"PublicKey\", \
          \"documentation\":\"<p>The public key.</p>\" \
        }, \
        \"PrivateKey\":{ \
          \"shape\":\"PrivateKey\", \
          \"documentation\":\"<p>The private key.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes a key pair.</p>\" \
    }, \
    \"KinesisAction\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"roleArn\", \
        \"streamName\" \
      ], \
      \"members\":{ \
        \"roleArn\":{ \
          \"shape\":\"AwsArn\", \
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\" \
        }, \
        \"streamName\":{ \
          \"shape\":\"StreamName\", \
          \"documentation\":\"<p>The name of the Kinesis stream.</p>\" \
        }, \
        \"partitionKey\":{ \
          \"shape\":\"PartitionKey\", \
          \"documentation\":\"<p>The partition key.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes an action to write data to an Amazon Kinesis stream.</p>\" \
    }, \
    \"LambdaAction\":{ \
      \"type\":\"structure\", \
      \"required\":[\"functionArn\"], \
      \"members\":{ \
        \"functionArn\":{ \
          \"shape\":\"FunctionArn\", \
          \"documentation\":\"<p>The ARN of the Lambda function.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes an action to invoke a Lamdba function.</p>\" \
    }, \
    \"LimitExceededException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":410}, \
      \"exception\":true, \
      \"documentation\":\"<p>The number of attached entities exceeds the limit.</p>\" \
    }, \
    \"ListCertificatesRequest\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"pageSize\":{ \
          \"shape\":\"PageSize\", \
          \"location\":\"querystring\", \
          \"locationName\":\"pageSize\", \
          \"documentation\":\"<p>The result page size.</p>\" \
        }, \
        \"marker\":{ \
          \"shape\":\"Marker\", \
          \"location\":\"querystring\", \
          \"locationName\":\"marker\", \
          \"documentation\":\"<p>The marker for the next set of results.</p>\" \
        }, \
        \"ascendingOrder\":{ \
          \"shape\":\"AscendingOrder\", \
          \"location\":\"querystring\", \
          \"locationName\":\"isAscendingOrder\", \
          \"documentation\":\"<p>Specifies the order for results. If True, the results are returned in ascending order, based on the creation date.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the ListCertificates operation.</p>\" \
    }, \
    \"ListCertificatesResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"certificates\":{ \
          \"shape\":\"Certificates\", \
          \"documentation\":\"<p>The descriptions of the certificates.</p>\" \
        }, \
        \"nextMarker\":{ \
          \"shape\":\"Marker\", \
          \"documentation\":\"<p>The marker for the next set of results, or null if there are no additional results.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output of the ListCertificates operation.</p>\" \
    }, \
    \"ListPoliciesRequest\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"marker\":{ \
          \"shape\":\"Marker\", \
          \"location\":\"querystring\", \
          \"locationName\":\"marker\", \
          \"documentation\":\"<p>The marker for the next set of results.</p>\" \
        }, \
        \"pageSize\":{ \
          \"shape\":\"PageSize\", \
          \"location\":\"querystring\", \
          \"locationName\":\"pageSize\", \
          \"documentation\":\"<p>The result page size.</p>\" \
        }, \
        \"ascendingOrder\":{ \
          \"shape\":\"AscendingOrder\", \
          \"location\":\"querystring\", \
          \"locationName\":\"isAscendingOrder\", \
          \"documentation\":\"<p>Specifies the order for results. If true, the results are returned in ascending creation order.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the ListPolicies operation.</p>\" \
    }, \
    \"ListPoliciesResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"policies\":{ \
          \"shape\":\"Policies\", \
          \"documentation\":\"<p>The descriptions of the policies.</p>\" \
        }, \
        \"nextMarker\":{ \
          \"shape\":\"Marker\", \
          \"documentation\":\"<p>The marker for the next set of results, or null if there are no additional results.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the ListPolicies operation.</p>\" \
    }, \
    \"ListPolicyVersionsRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"policyName\"], \
      \"members\":{ \
        \"policyName\":{ \
          \"shape\":\"PolicyName\", \
          \"location\":\"uri\", \
          \"locationName\":\"policyName\", \
          \"documentation\":\"<p>The policy name.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the ListPolicyVersions operation.</p>\" \
    }, \
    \"ListPolicyVersionsResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"policyVersions\":{ \
          \"shape\":\"PolicyVersions\", \
          \"documentation\":\"<p>The policy versions.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the ListPolicyVersions operation.</p>\" \
    }, \
    \"ListPrincipalPoliciesRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"principal\"], \
      \"members\":{ \
        \"principal\":{ \
          \"shape\":\"Principal\", \
          \"location\":\"header\", \
          \"locationName\":\"x-amzn-iot-principal\", \
          \"documentation\":\"<p>The principal.</p>\" \
        }, \
        \"marker\":{ \
          \"shape\":\"Marker\", \
          \"location\":\"querystring\", \
          \"locationName\":\"marker\", \
          \"documentation\":\"<p>The marker for the next set of results.</p>\" \
        }, \
        \"pageSize\":{ \
          \"shape\":\"PageSize\", \
          \"location\":\"querystring\", \
          \"locationName\":\"pageSize\", \
          \"documentation\":\"<p>The result page size.</p>\" \
        }, \
        \"ascendingOrder\":{ \
          \"shape\":\"AscendingOrder\", \
          \"location\":\"querystring\", \
          \"locationName\":\"isAscendingOrder\", \
          \"documentation\":\"<p>Specifies the order for results. If true, results are returned in ascending creation order.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the ListPrincipalPolicies operation.</p>\" \
    }, \
    \"ListPrincipalPoliciesResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"policies\":{ \
          \"shape\":\"Policies\", \
          \"documentation\":\"<p>The policies.</p>\" \
        }, \
        \"nextMarker\":{ \
          \"shape\":\"Marker\", \
          \"documentation\":\"<p>The marker for the next set of results, or null if there are no additional results.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the ListPrincipalPolicies operation.</p>\" \
    }, \
    \"ListPrincipalThingsRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"principal\"], \
      \"members\":{ \
        \"nextToken\":{ \
          \"shape\":\"NextToken\", \
          \"location\":\"querystring\", \
          \"locationName\":\"nextToken\" \
        }, \
        \"maxResults\":{ \
          \"shape\":\"MaxResults\", \
          \"location\":\"querystring\", \
          \"locationName\":\"maxResults\", \
          \"documentation\":\"<p>The maximum number of principals to return.</p>\" \
        }, \
        \"principal\":{ \
          \"shape\":\"Principal\", \
          \"location\":\"header\", \
          \"locationName\":\"x-amzn-principal\", \
          \"documentation\":\"<p>The principal.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the ListPrincipalThings operation.</p>\" \
    }, \
    \"ListPrincipalThingsResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"things\":{ \
          \"shape\":\"ThingNameList\", \
          \"documentation\":\"<p>The things.</p>\" \
        }, \
        \"nextToken\":{ \
          \"shape\":\"NextToken\", \
          \"documentation\":\"<p>A token used to retrieve the next value.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the ListPrincipalThings operation.</p>\" \
    }, \
    \"ListThingPrincipalsRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"thingName\"], \
      \"members\":{ \
        \"thingName\":{ \
          \"shape\":\"ThingName\", \
          \"location\":\"uri\", \
          \"locationName\":\"thingName\", \
          \"documentation\":\"<p>The name of the thing.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the ListThingPrincipal operation.</p>\" \
    }, \
    \"ListThingPrincipalsResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"principals\":{ \
          \"shape\":\"Principals\", \
          \"documentation\":\"<p>The principals.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the ListThingPrincipals operation.</p>\" \
    }, \
    \"ListThingsRequest\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"nextToken\":{ \
          \"shape\":\"NextToken\", \
          \"location\":\"querystring\", \
          \"locationName\":\"nextToken\", \
          \"documentation\":\"<p>The token for the next value.</p>\" \
        }, \
        \"maxResults\":{ \
          \"shape\":\"MaxResults\", \
          \"location\":\"querystring\", \
          \"locationName\":\"maxResults\", \
          \"documentation\":\"<p>The maximum number of results.</p>\" \
        }, \
        \"attributeName\":{ \
          \"shape\":\"AttributeName\", \
          \"location\":\"querystring\", \
          \"locationName\":\"attributeName\", \
          \"documentation\":\"<p>The attribute name.</p>\" \
        }, \
        \"attributeValue\":{ \
          \"shape\":\"AttributeValue\", \
          \"location\":\"querystring\", \
          \"locationName\":\"attributeValue\", \
          \"documentation\":\"<p>The attribute value.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the ListThings operation.</p>\" \
    }, \
    \"ListThingsResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"things\":{ \
          \"shape\":\"ThingAttributeList\", \
          \"documentation\":\"<p>The things.</p>\" \
        }, \
        \"nextToken\":{ \
          \"shape\":\"NextToken\", \
          \"documentation\":\"<p>A token used to retrieve the next value.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the ListThings operation.</p>\" \
    }, \
    \"ListTopicRulesRequest\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"topic\":{ \
          \"shape\":\"Topic\", \
          \"location\":\"querystring\", \
          \"locationName\":\"topic\", \
          \"documentation\":\"<p>The topic.</p>\" \
        }, \
        \"maxResults\":{ \
          \"shape\":\"MaxResults\", \
          \"location\":\"querystring\", \
          \"locationName\":\"maxResults\", \
          \"documentation\":\"<p>The maximum number of results to return.</p>\" \
        }, \
        \"nextToken\":{ \
          \"shape\":\"NextToken\", \
          \"location\":\"querystring\", \
          \"locationName\":\"nextToken\", \
          \"documentation\":\"<p>A token used to retrieve the next value.</p>\" \
        }, \
        \"ruleDisabled\":{ \
          \"shape\":\"IsDisabled\", \
          \"location\":\"querystring\", \
          \"locationName\":\"ruleDisabled\", \
          \"documentation\":\"<p>Specifies whether the rule is disabled.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the ListTopicRules operation.</p>\" \
    }, \
    \"ListTopicRulesResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"rules\":{ \
          \"shape\":\"TopicRuleList\", \
          \"documentation\":\"<p>The rules.</p>\" \
        }, \
        \"nextToken\":{ \
          \"shape\":\"NextToken\", \
          \"documentation\":\"<p>A token used to retrieve the next value.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the ListTopicRules operation.</p>\" \
    }, \
    \"LogLevel\":{ \
      \"type\":\"string\", \
      \"enum\":[ \
        \"DEBUG\", \
        \"INFO\", \
        \"ERROR\", \
        \"WARN\", \
        \"DISABLED\" \
      ] \
    }, \
    \"LoggingOptionsPayload\":{ \
      \"type\":\"structure\", \
      \"required\":[\"roleArn\"], \
      \"members\":{ \
        \"roleArn\":{ \
          \"shape\":\"AwsArn\", \
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\" \
        }, \
        \"logLevel\":{ \
          \"shape\":\"LogLevel\", \
          \"documentation\":\"<p>The logging level.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes the logging options payload.</p>\" \
    }, \
    \"MalformedPolicyException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":400}, \
      \"exception\":true, \
      \"documentation\":\"<p>The policy documentation is not valid.</p>\" \
    }, \
    \"Marker\":{\"type\":\"string\"}, \
    \"MaxResults\":{ \
      \"type\":\"integer\", \
      \"min\":1, \
      \"max\":10000 \
    }, \
    \"NextToken\":{\"type\":\"string\"}, \
    \"PageSize\":{ \
      \"type\":\"integer\", \
      \"min\":1, \
      \"max\":250 \
    }, \
    \"PartitionKey\":{\"type\":\"string\"}, \
    \"PayloadField\":{\"type\":\"string\"}, \
    \"Policies\":{ \
      \"type\":\"list\", \
      \"member\":{\"shape\":\"Policy\"} \
    }, \
    \"Policy\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"policyName\":{ \
          \"shape\":\"PolicyName\", \
          \"documentation\":\"<p>The policy name.</p>\" \
        }, \
        \"policyArn\":{ \
          \"shape\":\"PolicyArn\", \
          \"documentation\":\"<p>The policy ARN.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes an AWS IoT policy.</p>\" \
    }, \
    \"PolicyArn\":{\"type\":\"string\"}, \
    \"PolicyDocument\":{\"type\":\"string\"}, \
    \"PolicyName\":{ \
      \"type\":\"string\", \
      \"min\":1, \
      \"max\":128, \
      \"pattern\":\"[\\\\w+=,.@-]+\" \
    }, \
    \"PolicyVersion\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"versionId\":{ \
          \"shape\":\"PolicyVersionId\", \
          \"documentation\":\"<p>The policy version ID.</p>\" \
        }, \
        \"isDefaultVersion\":{ \
          \"shape\":\"IsDefaultVersion\", \
          \"documentation\":\"<p>Specifies whether the policy version is the default.</p>\" \
        }, \
        \"createDate\":{ \
          \"shape\":\"DateType\", \
          \"documentation\":\"<p>The date and time the policy was created.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes a policy version.</p>\" \
    }, \
    \"PolicyVersionId\":{ \
      \"type\":\"string\", \
      \"pattern\":\"[0-9]+\" \
    }, \
    \"PolicyVersions\":{ \
      \"type\":\"list\", \
      \"member\":{\"shape\":\"PolicyVersion\"} \
    }, \
    \"Principal\":{\"type\":\"string\"}, \
    \"PrincipalArn\":{\"type\":\"string\"}, \
    \"Principals\":{ \
      \"type\":\"list\", \
      \"member\":{\"shape\":\"PrincipalArn\"} \
    }, \
    \"PrivateKey\":{ \
      \"type\":\"string\", \
      \"min\":1, \
      \"sensitive\":true \
    }, \
    \"PublicKey\":{ \
      \"type\":\"string\", \
      \"min\":1 \
    }, \
    \"QueueUrl\":{\"type\":\"string\"}, \
    \"RangeKeyField\":{\"type\":\"string\"}, \
    \"RangeKeyValue\":{\"type\":\"string\"}, \
    \"RejectCertificateTransferRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[\"certificateId\"], \
      \"members\":{ \
        \"certificateId\":{ \
          \"shape\":\"CertificateId\", \
          \"location\":\"uri\", \
          \"locationName\":\"certificateId\", \
          \"documentation\":\"<p>The ID of the certificate.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the RejectCertificateTransfer operation.</p>\" \
    }, \
    \"ReplaceTopicRuleRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"ruleName\", \
        \"topicRulePayload\" \
      ], \
      \"members\":{ \
        \"ruleName\":{ \
          \"shape\":\"RuleName\", \
          \"location\":\"uri\", \
          \"locationName\":\"ruleName\", \
          \"documentation\":\"<p>The name of the rule.</p>\" \
        }, \
        \"topicRulePayload\":{ \
          \"shape\":\"TopicRulePayload\", \
          \"documentation\":\"<p>The rule payload.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the ReplaceTopicRule operation.</p>\", \
      \"payload\":\"topicRulePayload\" \
    }, \
    \"RepublishAction\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"roleArn\", \
        \"topic\" \
      ], \
      \"members\":{ \
        \"roleArn\":{ \
          \"shape\":\"AwsArn\", \
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\" \
        }, \
        \"topic\":{ \
          \"shape\":\"TopicPattern\", \
          \"documentation\":\"<p>The name of the MQTT topic.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes an action to republish to another topic.</p>\" \
    }, \
    \"ResourceAlreadyExistsException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":409}, \
      \"exception\":true, \
      \"documentation\":\"<p>The resource already exists.</p>\" \
    }, \
    \"ResourceNotFoundException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":404}, \
      \"exception\":true, \
      \"documentation\":\"<p>The specified resource does not exist.</p>\" \
    }, \
    \"RuleName\":{ \
      \"type\":\"string\", \
      \"min\":1, \
      \"max\":128, \
      \"pattern\":\"^[a-zA-Z0-9_]+$\" \
    }, \
    \"S3Action\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"roleArn\", \
        \"bucketName\", \
        \"key\" \
      ], \
      \"members\":{ \
        \"roleArn\":{ \
          \"shape\":\"AwsArn\", \
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\" \
        }, \
        \"bucketName\":{ \
          \"shape\":\"BucketName\", \
          \"documentation\":\"<p>The S3 bucket.</p>\" \
        }, \
        \"key\":{ \
          \"shape\":\"Key\", \
          \"documentation\":\"<p>The object key.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes an action to write data to an Amazon S3 bucket.</p>\" \
    }, \
    \"SQL\":{\"type\":\"string\"}, \
    \"ServiceUnavailableException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":503}, \
      \"exception\":true, \
      \"fault\":true, \
      \"documentation\":\"<p>The service is temporarily unavailable.</p>\" \
    }, \
    \"SetAsActive\":{\"type\":\"boolean\"}, \
    \"SetAsDefault\":{\"type\":\"boolean\"}, \
    \"SetDefaultPolicyVersionRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"policyName\", \
        \"policyVersionId\" \
      ], \
      \"members\":{ \
        \"policyName\":{ \
          \"shape\":\"PolicyName\", \
          \"location\":\"uri\", \
          \"locationName\":\"policyName\", \
          \"documentation\":\"<p>The policy name.</p>\" \
        }, \
        \"policyVersionId\":{ \
          \"shape\":\"PolicyVersionId\", \
          \"location\":\"uri\", \
          \"locationName\":\"policyVersionId\", \
          \"documentation\":\"<p>The policy version ID.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the SetDefaultPolicyVersion operation.</p>\" \
    }, \
    \"SetLoggingOptionsRequest\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"loggingOptionsPayload\":{ \
          \"shape\":\"LoggingOptionsPayload\", \
          \"documentation\":\"<p>The logging options payload.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the SetLoggingOptions operation.</p>\", \
      \"payload\":\"loggingOptionsPayload\" \
    }, \
    \"SnsAction\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"targetArn\", \
        \"roleArn\" \
      ], \
      \"members\":{ \
        \"targetArn\":{ \
          \"shape\":\"AwsArn\", \
          \"documentation\":\"<p>The ARN of the SNS topic.</p>\" \
        }, \
        \"roleArn\":{ \
          \"shape\":\"AwsArn\", \
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes an action to publish to an Amazon SNS topic.</p>\" \
    }, \
    \"SqlParseException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":406}, \
      \"exception\":true, \
      \"documentation\":\"<p>The Rule-SQL expression can't be parsed correctly.</p>\" \
    }, \
    \"SqsAction\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"roleArn\", \
        \"queueUrl\" \
      ], \
      \"members\":{ \
        \"roleArn\":{ \
          \"shape\":\"AwsArn\", \
          \"documentation\":\"<p>The ARN of the IAM role that grants access.</p>\" \
        }, \
        \"queueUrl\":{ \
          \"shape\":\"QueueUrl\", \
          \"documentation\":\"<p>The URL of the Amazon SQS queue.</p>\" \
        }, \
        \"useBase64\":{ \
          \"shape\":\"UseBase64\", \
          \"documentation\":\"<p>Specifies whether to use Base64 encoding.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes an action to publish data to an SQS queue.</p>\" \
    }, \
    \"StreamName\":{\"type\":\"string\"}, \
    \"TableName\":{\"type\":\"string\"}, \
    \"ThingArn\":{\"type\":\"string\"}, \
    \"ThingAttribute\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"thingName\":{ \
          \"shape\":\"ThingName\", \
          \"documentation\":\"<p>The name of the thing.</p>\" \
        }, \
        \"attributes\":{ \
          \"shape\":\"Attributes\", \
          \"documentation\":\"<p>The attributes.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes a thing attribute.</p>\" \
    }, \
    \"ThingAttributeList\":{ \
      \"type\":\"list\", \
      \"member\":{\"shape\":\"ThingAttribute\"} \
    }, \
    \"ThingName\":{ \
      \"type\":\"string\", \
      \"min\":1, \
      \"max\":128, \
      \"pattern\":\"[a-zA-Z0-9_-]+\" \
    }, \
    \"ThingNameList\":{ \
      \"type\":\"list\", \
      \"member\":{\"shape\":\"ThingName\"} \
    }, \
    \"ThrottlingException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":429}, \
      \"exception\":true, \
      \"documentation\":\"<p>The rate exceeds the limit.</p>\" \
    }, \
    \"Topic\":{\"type\":\"string\"}, \
    \"TopicPattern\":{\"type\":\"string\"}, \
    \"TopicRule\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"ruleName\":{ \
          \"shape\":\"RuleName\", \
          \"documentation\":\"<p>The name of the rule.</p>\" \
        }, \
        \"sql\":{ \
          \"shape\":\"SQL\", \
          \"documentation\":\"<p>The SQL statement used to query the topic. When using a SQL query with multiple lines, be sure to escape the newline characters properly.</p>\" \
        }, \
        \"description\":{ \
          \"shape\":\"Description\", \
          \"documentation\":\"<p>The description of the rule.</p>\" \
        }, \
        \"createdAt\":{ \
          \"shape\":\"CreatedAtDate\", \
          \"documentation\":\"<p>The date and time the rule was created.</p>\" \
        }, \
        \"actions\":{ \
          \"shape\":\"ActionList\", \
          \"documentation\":\"<p>The actions associated with the rule.</p>\" \
        }, \
        \"ruleDisabled\":{ \
          \"shape\":\"IsDisabled\", \
          \"documentation\":\"<p>Specifies whether the rule is disabled.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes a rule.</p>\" \
    }, \
    \"TopicRuleList\":{ \
      \"type\":\"list\", \
      \"member\":{\"shape\":\"TopicRuleListItem\"} \
    }, \
    \"TopicRuleListItem\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"ruleName\":{ \
          \"shape\":\"RuleName\", \
          \"documentation\":\"<p>The name of the rule.</p>\" \
        }, \
        \"topicPattern\":{ \
          \"shape\":\"TopicPattern\", \
          \"documentation\":\"<p>The pattern for the topic names that apply.</p>\" \
        }, \
        \"createdAt\":{ \
          \"shape\":\"CreatedAtDate\", \
          \"documentation\":\"<p>The date and time the rule was created.</p>\" \
        }, \
        \"ruleDisabled\":{ \
          \"shape\":\"IsDisabled\", \
          \"documentation\":\"<p>Specifies whether the rule is disabled.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes a rule.</p>\" \
    }, \
    \"TopicRulePayload\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"sql\", \
        \"actions\" \
      ], \
      \"members\":{ \
        \"sql\":{ \
          \"shape\":\"SQL\", \
          \"documentation\":\"<p>The SQL statement used to query the topic. For more information, see <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/iot-rules.html#aws-iot-sql-reference\\\">AWS IoT SQL Reference</a> in the <i>AWS IoT Developer Guide</i>.</p>\" \
        }, \
        \"description\":{ \
          \"shape\":\"Description\", \
          \"documentation\":\"<p>The description of the rule.</p>\" \
        }, \
        \"actions\":{ \
          \"shape\":\"ActionList\", \
          \"documentation\":\"<p>The actions associated with the rule.</p>\" \
        }, \
        \"ruleDisabled\":{ \
          \"shape\":\"IsDisabled\", \
          \"documentation\":\"<p>Specifies whether the rule is disabled.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>Describes a rule.</p>\" \
    }, \
    \"TransferAlreadyCompletedException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":410}, \
      \"exception\":true, \
      \"documentation\":\"<p>You can't revert the certificate transfer because it has already completed.</p>\" \
    }, \
    \"TransferCertificateRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"certificateId\", \
        \"targetAwsAccount\" \
      ], \
      \"members\":{ \
        \"certificateId\":{ \
          \"shape\":\"CertificateId\", \
          \"location\":\"uri\", \
          \"locationName\":\"certificateId\", \
          \"documentation\":\"<p>The ID of the certificate.</p>\" \
        }, \
        \"targetAwsAccount\":{ \
          \"shape\":\"AwsAccountId\", \
          \"location\":\"querystring\", \
          \"locationName\":\"targetAwsAccount\", \
          \"documentation\":\"<p>The AWS account.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the TransferCertificate operation.</p>\" \
    }, \
    \"TransferCertificateResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"transferredCertificateArn\":{ \
          \"shape\":\"CertificateArn\", \
          \"documentation\":\"<p>The ARN of the certificate.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The output from the TransferCertificate operation.</p>\" \
    }, \
    \"TransferConflictException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":409}, \
      \"exception\":true, \
      \"documentation\":\"<p>You can't transfer the the certificate because authorization policies are still attached.</p>\" \
    }, \
    \"UnauthorizedException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":401}, \
      \"exception\":true, \
      \"documentation\":\"<p>You are not authorized to perform this operation.</p>\" \
    }, \
    \"UpdateCertificateRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"certificateId\", \
        \"newStatus\" \
      ], \
      \"members\":{ \
        \"certificateId\":{ \
          \"shape\":\"CertificateId\", \
          \"location\":\"uri\", \
          \"locationName\":\"certificateId\", \
          \"documentation\":\"<p>The ID of the certificate.</p>\" \
        }, \
        \"newStatus\":{ \
          \"shape\":\"CertificateStatus\", \
          \"location\":\"querystring\", \
          \"locationName\":\"newStatus\", \
          \"documentation\":\"<p>The new status.</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the UpdateCertificate operation.</p>\" \
    }, \
    \"UpdateThingRequest\":{ \
      \"type\":\"structure\", \
      \"required\":[ \
        \"thingName\", \
        \"attributePayload\" \
      ], \
      \"members\":{ \
        \"thingName\":{ \
          \"shape\":\"ThingName\", \
          \"location\":\"uri\", \
          \"locationName\":\"thingName\", \
          \"documentation\":\"<p>The thing name.</p>\" \
        }, \
        \"attributePayload\":{ \
          \"shape\":\"AttributePayload\", \
          \"documentation\":\"<p>The attribute payload, a JSON string containing up to three key-value pairs.</p> <p>For example: {\\\\\\\"attributes\\\\\\\":{\\\\\\\"string1\\\\\\\":\\\\\\\"string2\\\\\\\"}}</p>\" \
        } \
      }, \
      \"documentation\":\"<p>The input for the UpdateThing operation.</p>\" \
    }, \
    \"UpdateThingResponse\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
      }, \
      \"documentation\":\"<p>The output from the UpdateThing operation.</p>\" \
    }, \
    \"UseBase64\":{\"type\":\"boolean\"}, \
    \"VersionsLimitExceededException\":{ \
      \"type\":\"structure\", \
      \"members\":{ \
        \"message\":{ \
          \"shape\":\"errorMessage\", \
          \"documentation\":\"<p>The message for the exception.</p>\" \
        } \
      }, \
      \"error\":{\"httpStatusCode\":409}, \
      \"exception\":true, \
      \"documentation\":\"<p>The number of policy versions exceeds the limit.</p>\" \
    }, \
    \"errorMessage\":{\"type\":\"string\"} \
  }, \
  \"examples\":{ \
  } \
} \
 \
";
}

@end
