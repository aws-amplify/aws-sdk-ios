//
//  AWSDevice.m
//  AWSiOSSDKv2
//
//  Created by Emmanuel Merali on 19/10/2016.
//  Copyright © 2016 Amazon Web Services. All rights reserved.
//

//
//  FTWDevice.m
//  FTW
//
//  Created by Soroush Khanlou on 7/13/12.
//  Copyright (c) 2012 FTW. All rights reserved.
//

#import "AWSDevice.h"

#if TARGET_OS_OSX

#include <CoreFoundation/CoreFoundation.h>

//for mac address
#include <IOKit/IOKitLib.h>
#include <IOKit/network/IOEthernetInterface.h>
#include <IOKit/network/IONetworkInterface.h>
#include <IOKit/network/IOEthernetController.h>

//for sys info
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

#import "AWSCategory.h"

#import <Cocoa/Cocoa.h>

static kern_return_t FindEthernetInterfaces(io_iterator_t *matchingServices);
static kern_return_t GetMACAddress(io_iterator_t intfIterator, UInt8 *MACAddress, UInt8 bufferSize);

typedef enum {
    FTWDeviceFamilyMacBookAir,
    FTWDeviceFamilyMacBookPro,
    FTWDeviceFamilyMacBook,
    FTWDeviceFamilyMacPro,
    FTWDeviceFamilyiMac,
    FTWDeviceFamilyMacMini,
    FTWDeviceFamilyXserve,
    FTWDeviceFamilyUnknown
} FTWDeviceFamily;

@implementation UIDevice

+ (UIDevice *)currentDevice {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[UIDevice alloc] init];
    });
    return _sharedObject;
}

- (id) init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSString *)name {
    return [[NSHost currentHost] name];
}

- (NSString *)localizedName {
    return [[NSHost currentHost] localizedName];
}


- (NSString *)MACAddress {
    kern_return_t   kernResult = KERN_SUCCESS;
    io_iterator_t   intfIterator;
    UInt8           lMACAddress[kIOEthernetAddressSize]; //lMACAddress for local instance
    
    kernResult = FindEthernetInterfaces(&intfIterator);
    
    if (KERN_SUCCESS != kernResult) {
        printf("FindEthernetInterfaces returned 0x%08x\n", kernResult);
    }
    else {
        kernResult = GetMACAddress(intfIterator, lMACAddress, sizeof(lMACAddress));
        
        if (KERN_SUCCESS != kernResult) {
            printf("GetMACAddress returned 0x%08x\n", kernResult);
            return nil;
        }
        else {
            return [NSString stringWithFormat:@"%02X:%02x:%02X:%02X:%02X:%02X",lMACAddress[0], lMACAddress[1], lMACAddress[2], lMACAddress[3], lMACAddress[4], lMACAddress[5]];
        }
    }
    
    (void) IOObjectRelease(intfIterator);   // Release the iterator.
    return @"";
}

- (NSString *)systemName {
    return @"OS X";
}

- (NSString *)systemVersion {
    return [NSProcessInfo processInfo].operatingSystemVersionString;
}


#pragma mark sysctlbyname utils
- (NSString  *)getSysInfoByName:(char *)typeSpecifier {
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    
    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    
    free(answer);
    return results;
}

- (NSString  *)platform {
    return [self getSysInfoByName:"hw.machine"];
}

- (FTWDeviceFamily) deviceFamily {
    NSString *hardwareModelVal = [self hardwareModel];
    
    if ([hardwareModelVal hasPrefix:@"Macmini"]) {
        return FTWDeviceFamilyMacMini;
    } else if ([hardwareModelVal hasPrefix:@"MacBookAir"]) {
        return FTWDeviceFamilyMacBookAir;
    } else if ([hardwareModelVal hasPrefix:@"MacBookPro"]) {
        return FTWDeviceFamilyMacBookPro;
    } else if ([hardwareModelVal hasPrefix:@"MacPro"]) {
        return FTWDeviceFamilyMacPro;
    } else if ([hardwareModelVal hasPrefix:@"iMac"]) {
        return FTWDeviceFamilyiMac;
    } else if ([hardwareModelVal hasPrefix:@"MacBook"]) {
        return FTWDeviceFamilyMacBook;
    } else if ([hardwareModelVal hasPrefix:@"Xserve"]) {
        return FTWDeviceFamilyXserve;
    }
    return FTWDeviceFamilyUnknown;
}

- (NSString *)model {
    switch ([self deviceFamily]) {
        case FTWDeviceFamilyiMac:
            return @"iMac";
            break;
        case FTWDeviceFamilyMacBookAir:
            return @"MacBook Air";
            break;
        case FTWDeviceFamilyMacPro:
            return @"Mac Pro";
            break;
        case FTWDeviceFamilyMacBook:
            return @"MacBook";
            break;
        case FTWDeviceFamilyMacMini:
            return @"Mac mini";
            break;
        case FTWDeviceFamilyMacBookPro:
            return @"MacBook Pro";
            break;
            
        default:
            break;
    }
    return @"";
}

- (NSString *)uniqueIdentifier {
    return [[[self name] stringByAppendingString:[self MACAddress]] aws_md5String];
}

// Thanks, Tom Harrington (Atomicbird)
- (NSString  *)hardwareModel {
    return [self getSysInfoByName:"hw.model"];
}

#pragma mark sysctl utils
- (NSUInteger) getSysInfo: (uint) typeSpecifier {
    size_t size = sizeof(unsigned int);
    unsigned int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

- (NSUInteger) CPUFrequency {
    return [self getSysInfo:HW_CPU_FREQ];
}

- (NSUInteger) busFrequency {
    return [self getSysInfo:HW_BUS_FREQ];
}

- (NSUInteger) CPUCount {
    return [self getSysInfo:HW_NCPU];
}

- (NSUInteger) totalMemory {
    return [self getSysInfo:HW_PHYSMEM];
}

- (NSUInteger) userMemory {
    return [self getSysInfo:HW_USERMEM];
}

- (NSUInteger) maxSocketBufferSize {
    return [self getSysInfo:KIPC_MAXSOCKBUF];
}

- (NSNumber  *)totalDiskSpace {
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [fattributes objectForKey:NSFileSystemSize];
}

- (NSNumber  *)freeDiskSpace {
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [fattributes objectForKey:NSFileSystemFreeSize];
}

- (BOOL) isRetina {
    return ([[NSScreen mainScreen] backingScaleFactor] == 2.0f);
}

- (NSString *)serialNumber {
    NSString *result;
    CFStringRef aSerialNumber = NULL;
    
    io_service_t platformExpert = IOServiceGetMatchingService(
                                                              kIOMasterPortDefault,
                                                              IOServiceMatching("IOPlatformExpertDevice")
                                                              );
    
    if (platformExpert)
    {
        CFTypeRef serialNumberAsCFString = IORegistryEntryCreateCFProperty(
                                                                           platformExpert,
                                                                           CFSTR(kIOPlatformSerialNumberKey),
                                                                           kCFAllocatorDefault,
                                                                           0
                                                                           );
        aSerialNumber = (CFStringRef)serialNumberAsCFString;
        IOObjectRelease(platformExpert);
    }
    
    if (aSerialNumber)
        result = (__bridge NSString*)aSerialNumber;
    else
        result = @"unknown";
    return result;
    
}

static kern_return_t FindEthernetInterfaces(io_iterator_t *matchingServices)
{
    kern_return_t           kernResult;
    CFMutableDictionaryRef  matchingDict;
    CFMutableDictionaryRef  propertyMatchDict;
    
    matchingDict = IOServiceMatching(kIOEthernetInterfaceClass);
    
    if (NULL == matchingDict) {
        printf("IOServiceMatching returned a NULL dictionary.\n");
    }
    else {
        propertyMatchDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0,
                                                      &kCFTypeDictionaryKeyCallBacks,
                                                      &kCFTypeDictionaryValueCallBacks);
        
        if (NULL == propertyMatchDict) {
            printf("CFDictionaryCreateMutable returned a NULL dictionary.\n");
        }
        else {
            CFDictionarySetValue(propertyMatchDict, CFSTR(kIOPrimaryInterface), kCFBooleanTrue);
            CFDictionarySetValue(matchingDict, CFSTR(kIOPropertyMatchKey), propertyMatchDict);
            CFRelease(propertyMatchDict);
        }
    }
    kernResult = IOServiceGetMatchingServices(kIOMasterPortDefault, matchingDict, matchingServices);
    if (KERN_SUCCESS != kernResult) {
        printf("IOServiceGetMatchingServices returned 0x%08x\n", kernResult);
    }
    
    return kernResult;
}

static kern_return_t GetMACAddress(io_iterator_t intfIterator, UInt8 *MACAddress, UInt8 bufferSize)
{
    io_object_t     intfService;
    io_object_t     controllerService;
    kern_return_t   kernResult = KERN_FAILURE;
    
    if (bufferSize < kIOEthernetAddressSize) {
        return kernResult;
    }
    
    bzero(MACAddress, bufferSize);
    
    while ((intfService = IOIteratorNext(intfIterator)))
    {
        CFTypeRef   MACAddressAsCFData;
        kernResult = IORegistryEntryGetParentEntry(intfService,
                                                   kIOServicePlane,
                                                   &controllerService);
        
        if (KERN_SUCCESS != kernResult) {
            printf("IORegistryEntryGetParentEntry returned 0x%08x\n", kernResult);
        }
        else {
            MACAddressAsCFData = IORegistryEntryCreateCFProperty(controllerService,
                                                                 CFSTR(kIOMACAddress),
                                                                 kCFAllocatorDefault,
                                                                 0);
            if (MACAddressAsCFData) {
                CFDataGetBytes(MACAddressAsCFData, CFRangeMake(0, kIOEthernetAddressSize), MACAddress);
                CFRelease(MACAddressAsCFData);
            }
            (void) IOObjectRelease(controllerService);
        }
        (void) IOObjectRelease(intfService);
    }
    
    return kernResult;
}

@end

#endif
