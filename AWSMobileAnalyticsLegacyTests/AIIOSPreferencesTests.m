//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AIIOSPreferencesTests.h"
#import "AWSMobileAnalyticsDefaultFileManager.h"
#import "AWSMobileAnalyticsIOSSystem.h"
#import "AWSMockFileManager.h"

NSString *const AIAppKey = @"appKey";
NSString *const AIPrivateKey = @"0123456789abcdef0123456789abcdef";

@interface AWSMobileAnalyticsIOSSystem(Testing)
+ (NSString *) rootFileDirectoryWithFileManager:(NSFileManager *) theFileManager;
@end

@interface AWSMobileAnalyticsIOSPreferences(Testing)

@property (nonatomic, readwrite) AWSMobileAnalyticsFile* file;
@property (nonatomic, readwrite) id<AWSMobileAnalyticsFileManager> fileManager;
@property (nonatomic, readwrite) NSMutableDictionary* preferences;


@end

@implementation AIIOSPreferencesTests

-(void)setUp
{
     
    
    [self cleanInsightsDir];
    
    AWSMobileAnalyticsIOSSystem *system = [[AWSMobileAnalyticsIOSSystem alloc] initWithIdentifier:AIAppKey];
    testFileManager = system.fileManager;
    
   
    
    target = [AWSMobileAnalyticsIOSPreferences preferencesWithFileManager:testFileManager];
}

-(void)tearDown
{
    [self cleanInsightsDir];
}

-(void)cleanInsightsDir
{
    NSFileManager *internalFileManager = [NSFileManager defaultManager];
    NSString *rootPath = [AWSMobileAnalyticsIOSSystem rootFileDirectoryWithFileManager:internalFileManager];
    NSString *absolutePath = [rootPath stringByAppendingPathComponent:AWSMobileAnalyticsRoot];
    
    NSError *error;
    [internalFileManager removeItemAtPath:absolutePath error:&error];
}

-(void) test_initialize
{
    assertThat(target.preferences, is(notNilValue()));
    assertThatInteger([target.preferences count], is(equalToInteger(0)));
    assertThatBool([target.file exists], is(equalToBool(NO)));
}

-(void) test_boolForKey_getOptValue
{
    assertThatBool([target boolForKey:@"key" withOptValue:YES], is(equalToBool(YES)));
}

-(void) test_intForKey_getOptValue
{
    assertThatInt([target intForKey:@"key" withOptValue:INT_MAX], is(equalToInt(INT_MAX)));
    assertThatInt([target intForKey:@"key" withOptValue:INT_MIN], is(equalToInt(INT_MIN)));
}

-(void) test_longLongForKey_getOptValue
{
    assertThatLongLong([target longLongForKey:@"key" withOptValue:LONG_LONG_MAX], is(equalToLongLong(LONG_LONG_MAX)));
    assertThatLongLong([target longLongForKey:@"key" withOptValue:LONG_LONG_MIN], is(equalToLongLong(LONG_LONG_MIN)));
}

-(void) test_stringforKey_getOptValue
{
    assertThat([target stringForKey:@"key" withOptValue:@"String"], is(equalTo(@"String")));
}

-(void) test_putBool_getValue
{
    assertThatBool([target.file exists], is(equalToBool(NO)));
    
    [target putBool:YES forKey:@"key"];
    
    assertThatInteger([target.preferences count], is(equalToInteger(1)));
    assertThatBool([target.file length] > 0, is(equalToBool(YES)));
    assertThatBool([target boolForKey:@"key" withOptValue:NO], is(equalToBool(YES)));
}

-(void) test_putInt_getValue
{
    assertThatBool([target.file exists], is(equalToBool(NO)));
    
    [target putInt:1000000 forKey:@"key"];
    
    assertThatInteger([target.preferences count], is(equalToInteger(1)));
    assertThatBool([target.file length] > 0, is(equalToBool(YES)));
    assertThatInt([target intForKey:@"key" withOptValue:0], is(equalToInt(1000000)));
    
    [target putInt:-1000000 forKey:@"key"];
    
    assertThatInteger([target.preferences count], is(equalToInteger(1)));
    assertThatBool([target.file length] > 0, is(equalToBool(YES)));
    assertThatInt([target intForKey:@"key" withOptValue:0], is(equalToInt(-1000000)));
}

-(void) test_putDouble_getValue
{
    assertThatBool([target.file exists], is(equalToBool(NO)));
    
    [target putDouble:DBL_MAX forKey:@"key"];
    
    assertThatInteger([target.preferences count], is(equalToInteger(1)));
    assertThatBool([target.file length] > 0, is(equalToBool(YES)));
    assertThatDouble([target doubleForKey:@"key" withOptValue:0], is(equalToDouble(DBL_MAX)));
    
    [target putDouble:DBL_MIN forKey:@"key"];
    
    assertThatInteger([target.preferences count], is(equalToInteger(1)));
    assertThatBool([target.file length] > 0, is(equalToBool(YES)));
    assertThatDouble([target doubleForKey:@"key" withOptValue:0], is(equalToDouble(DBL_MIN)));
}

-(void) test_putLongLong_getValue
{
    assertThatBool([target.file exists], is(equalToBool(NO)));
    
    [target putLongLong:123456789012345 forKey:@"key"];
    
    assertThatInteger([target.preferences count], is(equalToInteger(1)));
    assertThatBool([target.file length] > 0, is(equalToBool(YES)));
    assertThatLongLong([target longLongForKey:@"key" withOptValue:0], is(equalToLongLong(123456789012345)));
    
    [target putLongLong:-123456789012345 forKey:@"key"];
    
    assertThatInteger([target.preferences count], is(equalToInteger(1)));
    assertThatBool([target.file length] > 0, is(equalToBool(YES)));
    assertThatLongLong([target longLongForKey:@"key" withOptValue:0], is(equalToLongLong(-123456789012345)));
}

-(void) test_putString_getValue
{
    assertThatBool([target.file exists], is(equalToBool(NO)));
    
    [target putString:@"String" forKey:@"key"];
    
    assertThatInteger([target.preferences count], is(equalToInteger(1)));
    assertThatBool([target.file length] > 0, is(equalToBool(YES)));
    assertThat([target stringForKey:@"key" withOptValue:0], is(equalTo(@"String")));
}

-(void) test_manyValues
{
    assertThatBool([target.file exists], is(equalToBool(NO)));
    
    [target putBool:YES forKey:@"keyBoolYES"];
    [target putBool:NO forKey:@"keyBoolNO"];
    [target putString:@"true" forKey:@"keyBoolTrue"];
    [target putString:@"false" forKey:@"keyBoolFalse"];
    [target putInt:INT_MAX forKey:@"keyIntMax"];
    [target putInt:INT_MIN forKey:@"keyIntMin"];
    [target putDouble:DBL_MAX forKey:@"keyDoubleMax"];
    [target putDouble:DBL_MIN forKey:@"keyDoubleMin"];
    [target putLongLong:LONG_LONG_MAX forKey:@"keyLongLongMax"];
    [target putLongLong:LONG_LONG_MIN forKey:@"keyLongLongMin"];
    [target putString:@"String" forKey:@"keyString"];
    
    assertThatInteger([target.preferences count], is(equalToInteger(11)));
    assertThatBool([target.file length] > 0, is(equalToBool(YES)));
    assertThatBool([target boolForKey:@"keyBoolYES" withOptValue:NO], is(equalToBool(YES)));
    assertThatBool([target boolForKey:@"keyBoolNO" withOptValue:YES], is(equalToBool(NO)));
    assertThatBool([target boolForKey:@"keyBoolTrue" withOptValue:NO], is(equalToBool(YES)));
    assertThatBool([target boolForKey:@"keyBoolFalse" withOptValue:YES], is(equalToBool(NO)));
    assertThatInt([target intForKey:@"keyIntMax" withOptValue:0], is(equalToInt(INT_MAX)));
    assertThatInt([target intForKey:@"keyIntMin" withOptValue:0], is(equalToInt(INT_MIN)));
    assertThatDouble([target doubleForKey:@"keyDoubleMax" withOptValue:0], is(equalToDouble(DBL_MAX)));
    assertThatDouble([target doubleForKey:@"keyDoubleMin" withOptValue:0], is(equalToDouble(DBL_MIN)));
    assertThatLongLong([target longLongForKey:@"keyLongLongMax" withOptValue:0], is(equalToLongLong(LONG_LONG_MAX)));
    assertThatLongLong([target longLongForKey:@"keyLongLongMin" withOptValue:0], is(equalToLongLong(LONG_LONG_MIN)));
    assertThat([target stringForKey:@"keyString" withOptValue:0], is(equalTo(@"String")));
}

-(void) test_manyValuesLoadedFromFile
{
    [self test_manyValues];
    
    AWSMobileAnalyticsIOSPreferences *otherTarget = [AWSMobileAnalyticsIOSPreferences preferencesWithFileManager:testFileManager ];
    assertThatInteger([otherTarget.preferences count], is(equalToInteger(11)));
    assertThatBool([otherTarget.file length] > 0, is(equalToBool(YES)));
    assertThatBool([target boolForKey:@"keyBoolYES" withOptValue:NO], is(equalToBool(YES)));
    assertThatBool([target boolForKey:@"keyBoolNO" withOptValue:YES], is(equalToBool(NO)));
    assertThatBool([target boolForKey:@"keyBoolTrue" withOptValue:NO], is(equalToBool(YES)));
    assertThatBool([target boolForKey:@"keyBoolFalse" withOptValue:YES], is(equalToBool(NO)));
    assertThatInt([target intForKey:@"keyIntMax" withOptValue:0], is(equalToInt(INT_MAX)));
    assertThatInt([target intForKey:@"keyIntMin" withOptValue:0], is(equalToInt(INT_MIN)));
    assertThatDouble([target doubleForKey:@"keyDoubleMax" withOptValue:0], is(equalToDouble(DBL_MAX)));
    assertThatDouble([target doubleForKey:@"keyDoubleMin" withOptValue:0], is(equalToDouble(DBL_MIN)));
    assertThatLongLong([target longLongForKey:@"keyLongLongMax" withOptValue:0], is(equalToLongLong(LONG_LONG_MAX)));
    assertThatLongLong([target longLongForKey:@"keyLongLongMin" withOptValue:0], is(equalToLongLong(LONG_LONG_MIN)));
    assertThat([otherTarget stringForKey:@"keyString" withOptValue:0], is(equalTo(@"String")));
}

@end
