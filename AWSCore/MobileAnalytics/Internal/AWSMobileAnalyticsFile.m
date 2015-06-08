/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSMobileAnalyticsFile.h"
#import "AWSLogging.h"

@interface AWSMobileAnalyticsFile()
@property (nonatomic, readwrite) NSFileManager* fileManager;
@end

@implementation AWSMobileAnalyticsFile

-(id) initWithFileMananager:(NSFileManager*) theFileManager
           withAbsolutePath:(NSString*) thePathName
{
    return [self initWithFileMananager:theFileManager withParentPath:nil withChildPath:thePathName];
}

-(id) initWithFileMananager:(NSFileManager*) theFileManager
                 withParent:(AWSMobileAnalyticsFile*) theParent
              withChildPath:(NSString*) theChildPathName
{
    return [self initWithFileMananager:theFileManager withParentPath:theParent.absolutePath withChildPath:theChildPathName];
}

-(id) initWithFileMananager:(NSFileManager*) theFileManager
             withParentPath:(NSString*) theParentPathName
              withChildPath:(NSString*) theChildPathName
{
    NSAssert(theFileManager != nil, @"theFileManager should not have been nil");
    NSAssert(!(theParentPathName == nil && theChildPathName == nil), @"Both theParentPathName and theChildPathName were nil");
    if (self = [self init])
    {
        self.fileManager = theFileManager;
        if(self.fileManager == nil)
        {
            AWSLogWarn( @"The file path is nil.");
            return nil;
        }
        
        if([AWSMobileAnalyticsStringUtils isNotBlank:theParentPathName] && [AWSMobileAnalyticsStringUtils isNotBlank:theChildPathName])
        {
            self->_absolutePath = [theParentPathName stringByAppendingPathComponent:theChildPathName];
        }
        else
        {
            if([AWSMobileAnalyticsStringUtils isNotBlank:theParentPathName])
            {
                self->_absolutePath = theParentPathName;
            }
            else if([AWSMobileAnalyticsStringUtils isNotBlank:theChildPathName])
            {
                self->_absolutePath = theChildPathName;
            }
            else
            {
                AWSLogWarn( @"Both parent path name and child path name were nil");
                self->_absolutePath = nil;
            }
        }
        
        if([AWSMobileAnalyticsStringUtils isNotBlank:self.absolutePath])
        {
            self->_fileName = [self.absolutePath lastPathComponent];
            
            BOOL isDir;
            BOOL exists = [theFileManager fileExistsAtPath:self.absolutePath isDirectory:&isDir];
            if(exists == YES)
            {
                if(isDir == YES)
                {
                    self->_isDirectory = YES;
                    self->_isFile = NO;
                    
                }
                else
                {
                    self->_isDirectory = NO;
                    self->_isFile = YES;
                }
            }
        }
    }
    return self;
}

-(id) init
{
    if (self = [super init])
    {
        self->_isFile = NO;
        self->_isDirectory = NO;
        self->_absolutePath = nil;
        self->_fileName = nil;
    }
    return self;
}


-(BOOL) createNewFile
{
    if(self.fileManager == nil)
    {
        AWSLogWarn( @"The file manager is nil.");
        return NO;
    }
    if([AWSMobileAnalyticsStringUtils isBlank:self.absolutePath])
    {
        AWSLogWarn( @"The file path is nil.");
        return NO;
    }
    
    if([self exists])
    {
        return YES;
    }
    
    BOOL created = [self.fileManager createFileAtPath:self.absolutePath
                                             contents:nil
                                           attributes:nil];
    if(created)
    {
        self->_isFile = YES;
        self->_isDirectory = NO;
    }
    return created;
}

-(BOOL) deleteFile
{
    BOOL deleted = NO;
    if([self exists])
    {
        NSError* error;
        deleted = [self.fileManager removeItemAtPath:self.absolutePath
                                                      error:&error];
        if(error != nil)
        {
            AWSLogError( @"The file could not be deleted. Error:%@", [error localizedDescription]);
        }
    }
    else
    {
        AWSLogWarn( @"The file does not exist. path:%@", self.absolutePath);
        deleted = NO;
    }
    return deleted;
}

-(BOOL) exists
{
    if([AWSMobileAnalyticsStringUtils isBlank:self.absolutePath])
    {
        AWSLogWarn( @"The file path is nil.");
        return NO;
    }
    if(self.fileManager == nil)
    {
        AWSLogWarn( @"The file manager is nil.");
        return NO;
    }
    
    return [self.fileManager fileExistsAtPath:self.absolutePath];
}

-(BOOL) mkdirs
{
    if(self.absolutePath == nil)
    {
        AWSLogWarn( @"The file path is nil.");
        return NO;
    }
    if(self.fileManager == nil)
    {
        AWSLogWarn( @"The file manager is nil.");
        return NO;
    }
    
    //If the directory exists, just return YES for success
    if([self exists])
    {
        return YES;
    }
    
    NSError* error;
    BOOL created = [self.fileManager createDirectoryAtPath:self.absolutePath
                  withIntermediateDirectories:YES
                                   attributes:nil
                                        error:&error];
    if(error != nil) {
        AWSLogError( @"The directory could not be created. Error:%@", [error localizedDescription]);
        created = NO;
        self->_isDirectory = NO;
        self->_isFile = NO;
    }
    else if(!created)
    {
        self->_isDirectory = NO;
        self->_isFile = NO;
    } else
    {
        self->_isDirectory = YES;
        self->_isFile = NO;
    }
    
    return created;
}

-(unsigned long long) length
{
    NSError *error;
    NSDictionary *attributes = [self.fileManager attributesOfItemAtPath:self.absolutePath error:&error];
    if(error != nil || attributes == nil)
    {
        AWSLogError( @"The file size could not be determined. Error:%@", [error localizedDescription]);
        return -1;
    }
    return [attributes fileSize];
}

-(NSArray*) listFiles
{
    if(![self exists])
    {
        return [NSArray array];
    }
    
    NSError* error;
    NSArray* fileNames = [self.fileManager contentsOfDirectoryAtPath:self.absolutePath error:&error];
    
    if(error != nil)
    {
        AWSLogError( @"The list of files in directory could not be retreived. Error:%@", [error localizedDescription]);
       return [NSArray array]; 
    }
    
    NSMutableArray* files = [NSMutableArray array];
    for (NSString* fileName in fileNames)
    {
        [files addObject:[[AWSMobileAnalyticsFile alloc] initWithFileMananager:self.fileManager
                                                    withParent:self
                                                 withChildPath:fileName]];
    }
    
    return files;
}

-(BOOL) renameTo:(NSString *) theNewFilename
{
    NSError *error;
    NSString *newAbsolutePath = [[self.absolutePath stringByDeletingLastPathComponent] stringByAppendingPathComponent:theNewFilename];
    BOOL success = [self.fileManager moveItemAtPath:self.absolutePath toPath:newAbsolutePath error:&error];
    if(error != nil)
    {
        AWSLogError( @"Failed to rename file to %@. Error:%@", theNewFilename, [error localizedDescription]);
        success = NO;
    }
    return success;
}

@end
