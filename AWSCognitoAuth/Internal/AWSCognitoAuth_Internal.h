#import "AWSCognitoAuth.h"
#import "AWSCognitoAuthUICKeyChainStore.h"

FOUNDATION_EXPORT NSString *const AWSCognitoAuthUserAccessToken;


@interface AWSCognitoAuth()
@property (nonatomic, strong) AWSCognitoAuthUICKeyChainStore *keychain;

- (NSString*) currentUsername;
- (NSString *) keyChainNamespaceClientId:(NSString *)username;
- (NSString *) keyChainKey: (NSString *) namespace key:(const NSString *) key;
-(NSError *) getError:(NSString *) error code:(AWSCognitoAuthClientErrorType) code;


@end

@interface AWSCognitoAuthUserSessionToken()
@property (nonatomic, strong) NSString * tokenString;
-(instancetype) initWithToken:(NSString *)token;
@end

@interface AWSCognitoAuthUserSession()
@property (nonatomic, strong) AWSCognitoAuthUserSessionToken * idToken;
@property (nonatomic, strong) AWSCognitoAuthUserSessionToken * accessToken;
@property (nonatomic, strong) AWSCognitoAuthUserSessionToken * refreshToken;
@property (nonatomic, strong) NSDate * expirationTime;
-(instancetype) initWithIdToken: (NSString *)idToken accessToken:(NSString *) accessToken refreshToken:(NSString *) refreshToken expirationTime:(NSDate*) expirationTime;
-(instancetype) initWithIdToken: (NSString *)idToken accessToken:(NSString *) accessToken refreshToken:(NSString *) refreshToken expiresIn:(NSNumber*) expiresIn;
@end
