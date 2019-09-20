//
//  AWSCognitoIdentityUserPool+Extension.h
//  AWSAuthSDK
//
//  Created by Roy, Jithin on 9/20/19.
//  Copyright © 2019 Amazon Web Services. All rights reserved.
//

#ifndef AWSCognitoIdentityUserPool_Extension_h
#define AWSCognitoIdentityUserPool_Extension_h

#import <AWSCognitoIdentityProvider/AWSCognitoIdentityProvider.h>

@interface AWSCognitoIdentityUserPool (Internal)

@property (nonatomic, assign) BOOL isCustomAuth;

@end

@protocol AWSCognitoUserPoolInternalDelegate

-(id<AWSCognitoIdentityCustomAuthentication>) startCustomAuthentication_v2;

@end

#endif /* AWSCognitoIdentityUserPool_Extension_h */
