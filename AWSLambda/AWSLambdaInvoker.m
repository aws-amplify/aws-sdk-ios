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

#import "AWSLambdaInvoker.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSLambdaService.h"
#import "AWSService.h"
#import "AWSClientContext.h"

NSString *const AWSLambdaInvokerErrorDomain = @"com.amazonaws.AWSLambdaInvokerErrorDomain";
NSString *const AWSLambdaInvokerFunctionErrorKey = @"com.amazonaws.AWSLambdaInvokerFunctionErrorKey";
NSString *const AWSLambdaInvokerErrorTypeKey = @"errorType";
NSString *const AWSLambdaInvokerErrorMessageKey = @"errorMessage";
NSString *const AWSLambdaInvokerErrorStackTraceKey = @"stackTrace";
NSString *const AWSLambdaInvokerUserAgent = @"invoker";

static NSString *const AWSInfoLambdaInvoker = @"LambdaInvoker";

@interface AWSLambda()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end

@interface AWSLambdaInvoker()

@property (nonatomic, strong) AWSLambda *lambda;
@property (nonatomic, strong) AWSClientContext *clientContext;

@end

@implementation AWSLambdaInvoker

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultLambdaInvoker {
    static AWSLambdaInvoker *_defaultLambdaInvoker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoLambdaInvoker];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }

        _defaultLambdaInvoker = [[AWSLambdaInvoker alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultLambdaInvoker;
}

+ (void)registerLambdaInvokerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });

    AWSLambdaInvoker *LambdaInvoker = [[AWSLambdaInvoker alloc] initWithConfiguration:configuration];
    [_serviceClients setObject:LambdaInvoker
                        forKey:key];
}

+ (instancetype)LambdaInvokerForKey:(NSString *)key {
    @synchronized(self) {
        AWSLambdaInvoker *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoLambdaInvoker
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSLambdaInvoker registerLambdaInvokerWithConfiguration:serviceConfiguration
                                                              forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeLambdaInvokerForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultLambdaInvoker` or `+ LambdaInvokerForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        AWSServiceConfiguration *_configuration = [configuration copy];
        [_configuration addUserAgentProductToken:AWSLambdaInvokerUserAgent];
        _lambda = [[AWSLambda alloc] initWithConfiguration:_configuration];
        _clientContext = [AWSClientContext new];
    }
    return self;
}

- (AWSTask<AWSLambdaInvokerInvocationResponse *> *)invoke:(AWSLambdaInvokerInvocationRequest *)request {
    AWSLambdaInvocationRequest *invocationRequest = [AWSLambdaInvocationRequest new];
    [invocationRequest aws_copyPropertiesFromObject:request];

    if (!invocationRequest.clientContext) {
        invocationRequest.clientContext = [self.clientContext base64EncodedJSONString];
    }
    if (request.payload) {
        NSError *error = nil;
        invocationRequest.payload = [NSJSONSerialization aws_dataWithJSONObject:request.payload
                                                                        options:kNilOptions
                                                                          error:&error];
        if (!invocationRequest.payload) {
            return [AWSTask taskWithError:error];
        }
    }

    return [[self.lambda invoke:invocationRequest] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSLambdaInvocationResponse *invocationResponse = task.result;
        if (invocationResponse.functionError) {
            NSMutableDictionary *userInfo = nil;
            if ([invocationResponse.payload isKindOfClass:[NSDictionary class]]) {
                userInfo = [NSMutableDictionary dictionaryWithDictionary:invocationResponse.payload];
            } else {
                userInfo = [NSMutableDictionary new];
            }
            [userInfo setValue:invocationResponse.functionError
                        forKey:AWSLambdaInvokerFunctionErrorKey];

            NSError *error = [NSError errorWithDomain:AWSLambdaInvokerErrorDomain
                                                 code:AWSLambdaInvokerErrorTypeFunctionError
                                             userInfo:userInfo];
            return [AWSTask taskWithError:error];
        }

        AWSLambdaInvokerInvocationResponse *response = [AWSLambdaInvokerInvocationResponse new];
        [response aws_copyPropertiesFromObject:invocationResponse];
        return [AWSTask taskWithResult:response];
    }];
}

- (void)invoke:(AWSLambdaInvokerInvocationRequest *)request completionHandler:(void (^ _Nullable)(AWSLambdaInvokerInvocationResponse * _Nullable response, NSError * _Nullable error))completionHandler {
    [[self invoke:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaInvokerInvocationResponse *> * _Nonnull task) {
        AWSLambdaInvokerInvocationResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)invokeFunction:(NSString *)functionName
                JSONObject:(id)JSONObject {
    AWSLambdaInvokerInvocationRequest *invocationRequest = [AWSLambdaInvokerInvocationRequest new];
    invocationRequest.functionName = functionName;
    invocationRequest.invocationType = AWSLambdaInvocationTypeRequestResponse;
    invocationRequest.payload = JSONObject;

    return [[self invoke:invocationRequest] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSLambdaInvokerInvocationResponse *invocationResponse = task.result;
        return [AWSTask taskWithResult:invocationResponse.payload];
    }];
}

- (void)invokeFunction:(NSString *)functionName
            JSONObject:(id)JSONObject
     completionHandler:(void (^ _Nullable)(id _Nullable response, NSError * _Nullable error))completionHandler {
    [[self invokeFunction:functionName JSONObject:JSONObject] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        id result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

@end

@implementation AWSLambdaInvokerInvocationRequest

@end

@implementation AWSLambdaInvokerInvocationResponse

@end
