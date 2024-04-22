// Software License Agreement (BSD License)
//
// Copyright (c) 2010-2024, Deusty, LLC
// All rights reserved.
//
// Redistribution and use of this software in source and binary forms,
// with or without modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//
// * Neither the name of Deusty nor the names of its contributors may be used
//   to endorse or promote products derived from this software without specific
//   prior written permission of Deusty, LLC.

#import <sys/mount.h>

#import "AWSDDFileLogger+Buffering.h"
#import "AWSDDFileLogger+Internal.h"

static const NSUInteger kAWSDDDefaultBufferSize = 4096; // 4 kB, block f_bsize on iphone7
static const NSUInteger kAWSDDMaxBufferSize = 1048576; // ~1 mB, f_iosize on iphone7

// Reads attributes from base file system to determine buffer size.
// see statfs in sys/mount.h for descriptions of f_iosize and f_bsize.
// f_bsize == "default", and f_iosize == "max"
static inline NSUInteger p_AWSDDGetDefaultBufferSizeBytesMax(const BOOL max) {
    struct statfs *mountedFileSystems = NULL;
    __auto_type count = getmntinfo(&mountedFileSystems, 0);

    for (int i = 0; i < count; i++) {
        __auto_type mounted = mountedFileSystems[i];
        __auto_type name = mounted.f_mntonname;

        // We can use 2 as max here, since any length > 1 will fail the if-statement.
        if (strnlen(name, 2) == 1 && *name == '/') {
            return max ? (NSUInteger)mounted.f_iosize : (NSUInteger)mounted.f_bsize;
        }
    }

    return max ? kAWSDDMaxBufferSize : kAWSDDDefaultBufferSize;
}

static NSUInteger AWSDDGetMaxBufferSizeBytes(void) {
    static NSUInteger maxBufferSize = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        maxBufferSize = p_AWSDDGetDefaultBufferSizeBytesMax(YES);
    });
    return maxBufferSize;
}

static NSUInteger AWSDDGetDefaultBufferSizeBytes(void) {
    static NSUInteger defaultBufferSize = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultBufferSize = p_AWSDDGetDefaultBufferSizeBytesMax(NO);
    });
    return defaultBufferSize;
}

@interface AWSDDBufferedProxy : NSProxy

@property (nonatomic) AWSDDFileLogger *fileLogger;
@property (nonatomic) NSOutputStream *buffer;

@property (nonatomic) NSUInteger maxBufferSizeBytes;
@property (nonatomic) NSUInteger currentBufferSizeBytes;

@end

@implementation AWSDDBufferedProxy

- (instancetype)initWithFileLogger:(AWSDDFileLogger *)fileLogger {
    _fileLogger = fileLogger;
    _maxBufferSizeBytes = AWSDDGetDefaultBufferSizeBytes();
    [self flushBuffer];

    return self;
}

- (void)dealloc {
    __auto_type block = ^{
        [self lt_sendBufferedDataToFileLogger];
        self.fileLogger = nil;
    };

    if ([self->_fileLogger isOnInternalLoggerQueue]) {
        block();
    } else {
        dispatch_sync(self->_fileLogger.loggerQueue, block);
    }
}

#pragma mark - Buffering

- (void)flushBuffer {
    [_buffer close];
    _buffer = [NSOutputStream outputStreamToMemory];
    [_buffer open];
    _currentBufferSizeBytes = 0;
}

- (void)lt_sendBufferedDataToFileLogger {
    NSData *data = [_buffer propertyForKey:NSStreamDataWrittenToMemoryStreamKey];
    [_fileLogger lt_logData:data];
    [self flushBuffer];
}

#pragma mark - Logging

- (void)logMessage:(AWSDDLogMessage *)logMessage {
    // Don't need to check for isOnInternalLoggerQueue, -lt_dataForMessage: will do it for us.
    __auto_type data = [_fileLogger lt_dataForMessage:logMessage];

    if (data.length == 0) {
        return;
    }

    [data enumerateByteRangesUsingBlock:^(const void * __nonnull bytes, NSRange byteRange, BOOL * __nonnull __unused stop) {
        __auto_type bytesLength = byteRange.length;
#ifdef NS_BLOCK_ASSERTIONS
        __unused
#endif
        __auto_type written = [_buffer write:bytes maxLength:bytesLength];
        NSAssert(written > 0 && (NSUInteger)written == bytesLength, @"Failed to write to memory buffer.");

        _currentBufferSizeBytes += bytesLength;

        if (_currentBufferSizeBytes >= _maxBufferSizeBytes) {
            [self lt_sendBufferedDataToFileLogger];
        }
    }];
}

- (void)flush {
    // This method is public.
    // We need to execute the rolling on our logging thread/queue.

    __auto_type block = ^{
        @autoreleasepool {
            [self lt_sendBufferedDataToFileLogger];
            [self.fileLogger flush];
        }
    };

    // The design of this method is taken from the AWSDDAbstractLogger implementation.
    // For extensive documentation please refer to the AWSDDAbstractLogger implementation.

    if ([self.fileLogger isOnInternalLoggerQueue]) {
        block();
    } else {
        NSAssert(![self.fileLogger isOnGlobalLoggingQueue], @"Core architecture requirement failure");
        dispatch_sync(AWSDDLog.loggingQueue, ^{
            dispatch_sync(self.fileLogger.loggerQueue, block);
        });
    }
}

#pragma mark - Properties

- (void)setMaxBufferSizeBytes:(NSUInteger)newBufferSizeBytes {
    _maxBufferSizeBytes = MIN(newBufferSizeBytes, AWSDDGetMaxBufferSizeBytes());
}

#pragma mark - Wrapping

- (AWSDDFileLogger *)wrapWithBuffer {
    return (AWSDDFileLogger *)self;
}

- (AWSDDFileLogger *)unwrapFromBuffer {
    return (AWSDDFileLogger *)self.fileLogger;
}

#pragma mark - NSProxy

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.fileLogger methodSignatureForSelector:sel];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [self.fileLogger respondsToSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.fileLogger];
}

@end

@implementation AWSDDFileLogger (Buffering)

- (instancetype)wrapWithBuffer {
    return (AWSDDFileLogger *)[[AWSDDBufferedProxy alloc] initWithFileLogger:self];
}

- (instancetype)unwrapFromBuffer {
    return self;
}

@end
