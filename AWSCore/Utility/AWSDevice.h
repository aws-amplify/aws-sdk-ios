//
//  AWSDevice.h
//  AWSiOSSDKv2
//
//  Created by Emmanuel Merali on 19/10/2016.
//  Copyright © 2016 Amazon Web Services. All rights reserved.
//
//

//  FTWDevice.h
//  FTW
//
//  Created by Soroush Khanlou on 7/13/12.
//  Copyright (c) 2012 FTW. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_OS_IOS || TARGET_OS_TV
#import <UIKit/UIKit.h>
#elif TARGET_OS_WATCH
#import <WatchKit/WatchKit.h>
#define UIDevice WKInterfaceDevice
#elif TARGET_OS_OSX

@interface UIDevice : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *localizedName;
@property (nonatomic, copy, readonly) NSString *systemName;
@property (nonatomic, copy, readonly) NSString *systemVersion;
@property (nonatomic, copy, readonly) NSString *model;
@property (nonatomic, copy, readonly) NSString *uniqueIdentifier;

@property (nonatomic, copy, readonly) NSString *MACAddress;
@property (nonatomic, copy, readonly) NSString *platform;
@property (nonatomic, copy, readonly) NSString *hardwareModel;

@property (nonatomic, assign, readonly) NSUInteger CPUFrequency;
@property (nonatomic, assign, readonly) NSUInteger busFrequency;
@property (nonatomic, assign, readonly) NSUInteger CPUCount;
@property (nonatomic, assign, readonly) NSUInteger totalMemory;
@property (nonatomic, assign, readonly) NSUInteger userMemory;

@property (nonatomic, strong, readonly) NSNumber *totalDiskSpace;
@property (nonatomic, strong, readonly) NSNumber *freeDiskSpace;
@property (nonatomic, assign, readonly) BOOL isRetina;
@property (nonatomic, copy, readonly) NSString *serialNumber;

+ (UIDevice *)currentDevice;

@end

#else

@interface UIDevice : NSObject
@end

#endif
