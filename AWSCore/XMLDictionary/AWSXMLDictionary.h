//
//  XMLDictionary.h
//
//  Version 1.4
//
//  Created by Nick Lockwood on 15/11/2010.
//  Copyright 2010 Charcoal Design. All rights reserved.
//
//  Get the latest version of XMLDictionary from here:
//
//  https://github.com/nicklockwood/XMLDictionary
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

#import <Foundation/Foundation.h>
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wobjc-missing-property-synthesis"


typedef NS_ENUM(NSInteger, AWSXMLDictionaryAttributesMode)
{
    AWSXMLDictionaryAttributesModePrefixed = 0, //default
    AWSXMLDictionaryAttributesModeDictionary,
    AWSXMLDictionaryAttributesModeUnprefixed,
    AWSXMLDictionaryAttributesModeDiscard
};


typedef NS_ENUM(NSInteger, AWSXMLDictionaryNodeNameMode)
{
    AWSXMLDictionaryNodeNameModeRootOnly = 0, //default
    AWSXMLDictionaryNodeNameModeAlways,
    AWSXMLDictionaryNodeNameModeNever
};


static NSString *const AWSXMLDictionaryAttributesKey   = @"__attributes";
static NSString *const AWSXMLDictionaryCommentsKey     = @"__comments";
static NSString *const AWSXMLDictionaryTextKey         = @"__text";
static NSString *const AWSXMLDictionaryNodeNameKey     = @"__name";
static NSString *const AWSXMLDictionaryAttributePrefix = @"_";


@interface AWSXMLDictionaryParser : NSObject <NSCopying>

+ (AWSXMLDictionaryParser *)sharedInstance;

@property (nonatomic, assign) BOOL collapseTextNodes; // defaults to YES
@property (nonatomic, assign) BOOL stripEmptyNodes;   // defaults to YES
@property (nonatomic, assign) BOOL trimWhiteSpace;    // defaults to YES
@property (nonatomic, assign) BOOL alwaysUseArrays;   // defaults to NO
@property (nonatomic, assign) BOOL preserveComments;  // defaults to NO
@property (nonatomic, assign) BOOL wrapRootNode;      // defaults to NO

@property (nonatomic, assign) AWSXMLDictionaryAttributesMode attributesMode;
@property (nonatomic, assign) AWSXMLDictionaryNodeNameMode nodeNameMode;

- (NSDictionary *)dictionaryWithParser:(NSXMLParser *)parser;
- (NSDictionary *)dictionaryWithData:(NSData *)data;
- (NSDictionary *)dictionaryWithString:(NSString *)string;
- (NSDictionary *)dictionaryWithFile:(NSString *)path;

@end


@interface NSDictionary (AWSXMLDictionary)

+ (NSDictionary *)awsxml_dictionaryWithXMLParser:(NSXMLParser *)parser;
+ (NSDictionary *)awsxml_dictionaryWithXMLData:(NSData *)data;
+ (NSDictionary *)awsxml_dictionaryWithXMLString:(NSString *)string;
+ (NSDictionary *)awsxml_dictionaryWithXMLFile:(NSString *)path;

- (NSDictionary *)awsxml_attributes;
- (NSDictionary *)awsxml_childNodes;
- (NSArray *)awsxml_comments;
- (NSString *)awsxml_nodeName;
- (NSString *)awsxml_innerText;
- (NSString *)awsxml_innerXML;
- (NSString *)awsxml_XMLString;

- (NSArray *)awsxml_arrayValueForKeyPath:(NSString *)keyPath;
- (NSString *)awsxml_stringValueForKeyPath:(NSString *)keyPath;
- (NSDictionary *)awsxml_dictionaryValueForKeyPath:(NSString *)keyPath;

@end


@interface NSString (AWSXMLDictionary)

- (NSString *)awsxml_XMLEncodedString;

@end


#pragma GCC diagnostic pop
