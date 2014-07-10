/***************************************************************************
 *
 * XMLWriter: An XML stream writer for iOS.
 * This file is part of the XSWI library - http://code.google.com/p/xswi/
 *
 * Copyright (C) 2010 by Thomas Rørvik Skjølberg
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 ****************************************************************************/

// Updated for 64bit architecture - 2014.02.18

#import "AWSXMLWriter.h"

#define NSBOOL(_X_) ((_X_) ? (id)kCFBooleanTrue : (id)kCFBooleanFalse)

@interface AWSXMLWriter (UtilityMethods)
// methods for internal use only
// pop the namespace stack, removing any namespaces which become out-of-scope
- (void) popNamespaceStack;
// push the namespace stack, denoting the namespaces whihch are in-scope
- (void) pushNamespaceStack;

// add namespace and local name to the top of the element stack
- (void) pushElementStack:(NSString*)namespaceURI localName:(NSString*)localName;
// remove the top member of the element stack
- (void) popElementStack;

// write close element, optionally as empty element
- (void) writeCloseElement:(BOOL)empty;
// write namespace attribute to stream
- (void) writeNamespaceToStream:(NSString*)prefix namespaceURI:(NSString*)namespaceURI;
// write a length of text to the stream with escaping
- (void) writeEscapeCharacters:(const UniChar*)characters length:(NSUInteger)length;
@end


static NSString *const EMPTY_STRING = @"";
static NSString *const XML_NAMESPACE_URI = @"http://www.w3.org/XML/1998/namespace";
static NSString *const XML_NAMESPACE_URI_PREFIX = @"xml";
static NSString *const XMLNS_NAMESPACE_URI = @"http://www.w3.org/2000/xmlns/";
static NSString *const XMLNS_NAMESPACE_URI_PREFIX = @"xmlns";
static NSString *const XSI_NAMESPACE_URI = @"http://www.w3.org/2001/XMLSchema/";
static NSString *const XSI_NAMESPACE_URI_PREFIX = @"xsi";

@implementation AWSXMLWriter

@synthesize automaticEmptyElements, indentation, lineBreak, level;

- (AWSXMLWriter*) init {
	self = [super init];
	if (self != nil) {
		// intialize variables
		writer = [[NSMutableString alloc] init];
		level = 0;
		openElement = NO;
		emptyElement = NO;

		elementLocalNames = [[NSMutableArray alloc]init];
		elementNamespaceURIs = [[NSMutableArray alloc]init];

		namespaceURIs = [[NSMutableArray alloc]init];
		namespaceCounts = [[NSMutableArray alloc]init];
		namespaceWritten = [[NSMutableArray alloc]init];

		namespaceURIPrefixMap = [[NSMutableDictionary alloc] init];
		prefixNamespaceURIMap = [[NSMutableDictionary alloc] init];

		// load default custom behaviour
		indentation = @"\t";
		lineBreak = @"\n";
		automaticEmptyElements = YES;

		// setup default xml namespaces. assume both are previously known.
		[namespaceCounts addObject:[NSNumber numberWithInt:2]];
		[self setPrefix:XML_NAMESPACE_URI_PREFIX namespaceURI:XML_NAMESPACE_URI];
		[self setPrefix:XMLNS_NAMESPACE_URI_PREFIX namespaceURI:XMLNS_NAMESPACE_URI];
	}
	return self;
}

- (void) pushNamespaceStack {
	// step namespace count - add the current namespace count
	NSNumber* previousCount = [namespaceCounts lastObject];
	if([namespaceURIs count] == [previousCount intValue]) {
		// the count is still the same
		[namespaceCounts addObject:previousCount];
	} else {
		// the count has changed, save the it
		NSNumber* count = [NSNumber numberWithUnsignedInteger:[namespaceURIs count]];

		[namespaceCounts addObject:count];
	}
}

- (void) writeNamespaceAttributes {
	if(openElement) {
		// write namespace attributes in the namespace stack
		NSNumber* previousCount = [namespaceCounts lastObject];
		for(int i = [previousCount intValue]; i < [namespaceURIs count]; i++) {

			// did we already write this namespace?
			id written = [namespaceWritten objectAtIndex:i];
			if(written == NSBOOL(NO)) {
				// write namespace
				NSString* namespaceURI = [namespaceURIs objectAtIndex:i];
				NSString* prefix = [namespaceURIPrefixMap objectForKey:namespaceURI];

				[self writeNamespaceToStream:prefix namespaceURI:namespaceURI];

				[namespaceWritten replaceObjectAtIndex:i withObject:NSBOOL(YES)];
			} else {
				// already written namespace
			}
		}
	} else {
		@throw([NSException exceptionWithName:@"XMLWriterException" reason:@"No open start element" userInfo:NULL]);
	}
}

- (void) popNamespaceStack {
	// step namespaces one level down
	if([namespaceCounts lastObject] != [namespaceCounts objectAtIndex:([namespaceCounts count] - 2)]) {
		// remove namespaces which now are out of scope, i.e. between the current and the previus count
		NSNumber* previousCount = [namespaceCounts lastObject];
		NSNumber* currentCount = [namespaceCounts objectAtIndex:([namespaceCounts count] - 2)];
		for(int i = [previousCount intValue] - 1; i >= [currentCount intValue]; i--) {
			NSString* removedNamespaceURI = [namespaceURIs objectAtIndex:i];
			NSString* removedPrefix = [namespaceURIPrefixMap objectForKey:removedNamespaceURI];

			[prefixNamespaceURIMap removeObjectForKey:removedPrefix];
			[namespaceURIPrefixMap removeObjectForKey:removedNamespaceURI];

			[namespaceURIs removeLastObject];

			[namespaceWritten removeLastObject];
		}
	} else {
		// not necessary to remove any namespaces
	}
	[namespaceCounts removeLastObject];
}

- (void)setPrefix:(NSString*)prefix namespaceURI:(NSString *)namespaceURI {
	if(!namespaceURI) {
		// raise exception
		@throw([NSException exceptionWithName:@"XMLWriterException" reason:@"Namespace cannot be NULL" userInfo:NULL]);
	}
	if(!prefix) {
		// raise exception
		@throw([NSException exceptionWithName:@"XMLWriterException" reason:@"Prefix cannot be NULL" userInfo:NULL]);
	}
	if([namespaceURIPrefixMap objectForKey:namespaceURI]) {
		// raise exception
		@throw([NSException exceptionWithName:@"XMLWriterException" reason:[NSString stringWithFormat:@"Name namespace %@ has already been set", namespaceURI] userInfo:NULL]);
	}
	if([prefixNamespaceURIMap objectForKey:prefix]) {
		// raise exception
		if([prefix length]) {
			@throw([NSException exceptionWithName:@"XMLWriterException" reason:[NSString stringWithFormat:@"Prefix %@ has already been set", prefix] userInfo:NULL]);
		} else {
			@throw([NSException exceptionWithName:@"XMLWriterException" reason:@"Default namespace has already been set" userInfo:NULL]);
		}
	}

	// increase the namespaces and add prefix mapping
	[namespaceURIs addObject:namespaceURI];
	[namespaceURIPrefixMap setObject:prefix forKey:namespaceURI];
	[prefixNamespaceURIMap setObject:namespaceURI forKey:prefix];

	if(openElement) { // write the namespace now
		[self writeNamespaceToStream:prefix namespaceURI:namespaceURI];

		[namespaceWritten addObject:NSBOOL(YES)];
	} else {
		// write the namespace as the next start element is closed
		[namespaceWritten addObject:NSBOOL(NO)];
	}
}

- (NSString*)getPrefix:(NSString*)namespaceURI {
	return [namespaceURIPrefixMap objectForKey:namespaceURI];
}

- (void) pushElementStack:(NSString*)namespaceURI localName:(NSString*)localName {
	// save for end elements
	[elementLocalNames addObject:localName];
	if(namespaceURI) {
		[elementNamespaceURIs addObject:namespaceURI];
	} else {
		[elementNamespaceURIs addObject:EMPTY_STRING];
	}
}

- (void) popElementStack {
	// remove element traces
	[elementNamespaceURIs removeLastObject];
	[elementLocalNames removeLastObject];
}

- (void) writeStartDocument {
	[self writeStartDocumentWithEncodingAndVersion:NULL version:NULL];
}

- (void) writeStartDocumentWithVersion:(NSString*)version {
	[self writeStartDocumentWithEncodingAndVersion:NULL version:version];
}

- (void) writeStartDocumentWithEncodingAndVersion:(NSString*)aEncoding version:(NSString*)version {
	if([writer length] != 0) {
		// raise exception - Starting document which is not empty
		@throw([NSException exceptionWithName:@"XMLWriterException" reason:@"Document has already been started" userInfo:NULL]);
	} else {
		[self write:@"<?xml version=\""];
		if(version) {
			[self write:version];
		} else {
			// default to 1.0
			[self write:@"1.0"];
		}
		[self write:@"\""];

		if(aEncoding) {
			[self write:@" encoding=\""];
			[self write:aEncoding];
			[self write:@"\""];

			encoding = aEncoding;
		}
		[self write:@" ?>"];

	}
}

- (void) writeEndDocument {
	while (level > 0) {
		[self writeEndElement];
	}
}

- (void) writeStartElement:(NSString *)localName {
	[self writeStartElementWithNamespace:NULL localName:localName];
}

- (void) writeCloseStartElement {
	if(openElement) {
		[self writeCloseElement:NO];
	} else {
		// raise exception
		@throw([NSException exceptionWithName:@"XMLWriterException" reason:@"No open start element" userInfo:NULL]);
	}
}

- (void) writeCloseElement:(BOOL)empty {
	[self writeNamespaceAttributes];
	[self pushNamespaceStack];

	if(empty) {
		[self write:@" />"];
	} else {
		[self write:@">"];
	}

	openElement = NO;
}

- (void) writeEndElement:(NSString *)localName {
	[self writeEndElementWithNamespace:NULL localName:localName];
}

- (void) writeEndElement {
	if(openElement && automaticEmptyElements) {
		// go for <START />
		[self writeCloseElement:YES]; // write empty end element

		[self popNamespaceStack];
		[self popElementStack];

		emptyElement = YES;
		openElement = NO;

		level -= 1;
	} else {
		NSString* namespaceURI = [elementNamespaceURIs lastObject];
		NSString* localName = [elementLocalNames lastObject];

		if(namespaceURI == EMPTY_STRING) {
			[self writeEndElementWithNamespace:NULL localName:localName];
		} else {
			[self writeEndElementWithNamespace:namespaceURI localName:localName];
		}
	}
}

- (void) writeStartElementWithNamespace:(NSString *)namespaceURI localName:(NSString *)localName {
	if(openElement) {
		[self writeCloseElement:NO];
	}

	[self writeLinebreak];
	[self writeIndentation];

	[self write:@"<"];
	if(namespaceURI) {
		NSString* prefix = [namespaceURIPrefixMap objectForKey:namespaceURI];

		if(!prefix) {
			// raise exception
			@throw([NSException exceptionWithName:@"XMLWriterException" reason:[NSString stringWithFormat:@"Unknown namespace URI %@", namespaceURI] userInfo:NULL]);
		}

		if([prefix length]) {
			[self write:prefix];
			[self write:@":"];
		}
	}
	[self write:localName];

	[self pushElementStack:namespaceURI localName:localName];

	openElement = YES;
	emptyElement = YES;
	level += 1;

}

- (void) writeEndElementWithNamespace:(NSString *)namespaceURI localName:(NSString *)localName {
	if(level <= 0) {
		// raise exception
		@throw([NSException exceptionWithName:@"XMLWriterException" reason:@"Cannot write more end elements than start elements." userInfo:NULL]);
	}

	level -= 1;

	if(openElement) {
		// go for <START><END>
		[self writeCloseElement:NO];
	} else {
		if(emptyElement) {
			// go for linebreak + indentation + <END>
			[self writeLinebreak];
			[self writeIndentation];
		} else {
			// go for <START>characters<END>
		}
	}

	// write standard end element
	[self write:@"</"];

	if(namespaceURI) {
		NSString* prefix = [namespaceURIPrefixMap objectForKey:namespaceURI];

		if(!prefix) {
			// raise exception
			@throw([NSException exceptionWithName:@"XMLWriterException" reason:[NSString stringWithFormat:@"Unknown namespace URI %@", namespaceURI] userInfo:NULL]);
		}

		if([prefix length]) {
			[self write:prefix];
			[self write:@":"];
		}
	}

	[self write:localName];
	[self write:@">"];

	[self popNamespaceStack];
	[self popElementStack];

	emptyElement = YES;
	openElement = NO;
}

- (void) writeEmptyElement:(NSString *)localName {
	if(openElement) {
		[self writeCloseElement:NO];
	}

	[self writeLinebreak];
	[self writeIndentation];

	[self write:@"<"];
	[self write:localName];
	[self write:@" />"];

	emptyElement = YES;
	openElement = NO;
}

- (void) writeEmptyElementWithNamespace:(NSString *)namespaceURI localName:(NSString *)localName {
	if(openElement) {
		[self writeCloseElement:NO];
	}

	[self writeLinebreak];
	[self writeIndentation];

	[self write:@"<"];

	if(namespaceURI) {
		NSString* prefix = [namespaceURIPrefixMap objectForKey:namespaceURI];

		if(!prefix) {
			// raise exception
			@throw([NSException exceptionWithName:@"XMLWriterException" reason:[NSString stringWithFormat:@"Unknown namespace URI %@", namespaceURI] userInfo:NULL]);
		}

		if([prefix length]) {
			[self write:prefix];
			[self write:@":"];
		}
	}

	[self write:localName];
	[self write:@" />"];

	emptyElement = YES;
	openElement = NO;
}

- (void) writeAttribute:(NSString *)localName value:(NSString *)value {
	[self writeAttributeWithNamespace:NULL localName:localName value:value];
}

- (void) writeAttributeWithNamespace:(NSString *)namespaceURI localName:(NSString *)localName value:(NSString *)value {
	if(openElement) {
		[self write:@" "];

		if(namespaceURI) {
			NSString* prefix = [namespaceURIPrefixMap objectForKey:namespaceURI];
			if(!prefix) {
				// raise exception
				@throw([NSException exceptionWithName:@"XMLWriterException" reason:[NSString stringWithFormat:@"Unknown namespace URI %@", namespaceURI] userInfo:NULL]);
			}

			if([prefix length]) {
				[self write:prefix];
				[self write:@":"];
			}
		}
		[self write:localName];
		[self write:@"=\""];
		[self writeEscape:value];
		[self write:@"\""];
	} else {
		// raise expection
		@throw([NSException exceptionWithName:@"XMLWriterException" reason:@"No open start element" userInfo:NULL]);
	}
}

- (void)setDefaultNamespace:(NSString*)namespaceURI {
	[self setPrefix:EMPTY_STRING namespaceURI:namespaceURI];
}

- (void) writeNamespace:(NSString*)prefix namespaceURI:(NSString *)namespaceURI {
	if(openElement) {
		[self setPrefix:prefix namespaceURI:namespaceURI];
	} else {
		// raise exception
		@throw([NSException exceptionWithName:@"XMLWriterException" reason:@"No open start element" userInfo:NULL]);
	}
}

- (void) writeDefaultNamespace:(NSString*)namespaceURI {
	[self writeNamespace:EMPTY_STRING namespaceURI:namespaceURI];
}

- (NSString*)getNamespaceURI:(NSString*)prefix {
	return [prefixNamespaceURIMap objectForKey:prefix];
}

-(void) writeNamespaceToStream:(NSString*)prefix namespaceURI:(NSString*)namespaceURI {
	if(openElement) { // write the namespace now
		[self write:@" "];

		NSString* xmlnsPrefix = [self getPrefix:XMLNS_NAMESPACE_URI];
		if(!xmlnsPrefix) {
			// raise exception
			@throw([NSException exceptionWithName:@"XMLWriterException" reason:[NSString stringWithFormat:@"Cannot declare namespace without namespace %@", XMLNS_NAMESPACE_URI] userInfo:NULL]);
		}

		[self write:xmlnsPrefix]; // xmlns
		if([prefix length]) {
			// write xmlns:prefix="namespaceURI" attribute

			[self write:@":"]; // colon
			[self write:prefix]; // prefix
		} else {
			// write xmlns="namespaceURI" attribute
		}
		[self write:@"=\""];
		[self writeEscape:namespaceURI];
		[self write:@"\""];
	} else {
		@throw([NSException exceptionWithName:@"XMLWriterException" reason:@"No open start element" userInfo:NULL]);
	}
}

- (void) writeCharacters:(NSString*)text {
	if(openElement) {
		[self writeCloseElement:NO];
	}

	[self writeEscape:text];

	emptyElement = NO;
}

- (void) writeComment:(NSString*)comment {
	if(openElement) {
		[self writeCloseElement:NO];
	}
	[self write:@"<!--"];
	[self write:comment]; // no escape
	[self write:@"-->"];

	emptyElement = NO;
}

- (void) writeProcessingInstruction:(NSString*)target data:(NSString*)data {
	if(openElement) {
		[self writeCloseElement:NO];
	}
	[self write:@"<![CDATA["];
	[self write:target]; // no escape
	[self write:@" "];
	[self write:data]; // no escape
	[self write:@"]]>"];

	emptyElement = NO;
}

- (void) writeCData:(NSString*)cdata {
	if(openElement) {
		[self writeCloseElement:NO];
	}
	[self write:@"<![CDATA["];
	[self write:cdata]; // no escape
	[self write:@"]]>"];

	emptyElement = NO;
}

- (void) write:(NSString*)value {
	[writer appendString:value];
}

- (void) writeEscape:(NSString*)value {

	const UniChar *characters = CFStringGetCharactersPtr((CFStringRef)value);

	if (characters) {
		// main flow
		[self writeEscapeCharacters:characters length:[value length]];
	} else {
		// we need to read/copy the characters for some reason, from the docs of CFStringGetCharactersPtr:
		// A pointer to a buffer of Unicode character or NULL if the internal storage of the CFString does not allow this to be returned efficiently.
		// Whether or not this function returns a valid pointer or NULL depends on many factors, all of which depend on how the string was created and its properties. In addition, the function result might change between different releases and on different platforms. So do not count on receiving a non- NULL result from this function under any circumstances (except when the object is created with CFStringCreateMutableWithExternalCharactersNoCopy).

		// we dont need the whole data length at once
		NSMutableData *data = [NSMutableData dataWithLength:256 * sizeof(UniChar)];

		if(!data) {
			// raise exception - no more memory
			@throw([NSException exceptionWithName:@"XMLWriterException" reason:[NSString stringWithFormat:@"Could not allocate data buffer of %i unicode characters", 256] userInfo:NULL]);
		}

		NSUInteger count = 0;
		do {
			NSUInteger length;
			if(count + 256 < [value length]) {
				length = 256;
			} else {
				length = [value length] - count;
			}

			[value getCharacters:[data mutableBytes] range:NSMakeRange(count, length)];

			[self writeEscapeCharacters:[data bytes] length:length];

			count += length;
		} while(count < [value length]);

		// buffers autorelease
	}
}

- (void)writeEscapeCharacters:(const UniChar*)characters length:(NSUInteger)length {
	int rangeStart = 0;
	int rangeLength = 0;

	for(int i = 0; i < length; i++) {

		UniChar c = characters[i];
		if (c <= 0xd7ff)  {
			if (c >= 0x20) {
				switch (c) {
					case 34: {
						// write range if any
						if(rangeLength) {
							CFStringAppendCharacters((CFMutableStringRef)writer, characters + rangeStart, rangeLength);
						}
						[self write:@"&quot;"];

						break;
					}
						// quot
					case 38: {
						// write range if any
						if(rangeLength) {
							CFStringAppendCharacters((CFMutableStringRef)writer, characters + rangeStart, rangeLength);
						}
						[self write:@"&amp;"];

						break;
					}
						// amp;
					case 60: {
						// write range if any
						if(rangeLength) {
							CFStringAppendCharacters((CFMutableStringRef)writer, characters + rangeStart, rangeLength);
						}

						[self write:@"&lt;"];

						break;
					}
						// lt;
					case 62: {
						// write range if any
						if(rangeLength) {
							CFStringAppendCharacters((CFMutableStringRef)writer, characters + rangeStart, rangeLength);
						}

						[self write:@"&gt;"];

						break;
					}
						// gt;
					default: {
						// valid
						rangeLength++;

						// note: we dont need to escape char 39 for &apos; because we use double quotes exclusively

						continue;
					}
				}

				// set range start to next
				rangeLength = 0;
				rangeStart = i + 1;

			} else {
				if (c == '\n' || c == '\r' || c == '\t') {
					// valid;
					rangeLength++;

					continue;
				} else {
					// invalid, skip
				}
			}
		} else if (c < 0xE000) {
			// invalid, skip
		} else if (c <= 0xFFFD) {
			// valid
			rangeLength++;

			continue;
		} else {
			// invalid, skip
		}

		// write range if any
		if(rangeLength) {
			CFStringAppendCharacters((CFMutableStringRef)writer, characters + rangeStart, rangeLength);
		}

		// set range start to next
		rangeLength = 0;
		rangeStart = i + 1;
	}

	// write range if any
	if(rangeLength) {
		// main flow will probably write all characters here
		CFStringAppendCharacters((CFMutableStringRef)writer, characters + rangeStart, rangeLength);
	}
}

- (void)writeLinebreak {
	if(lineBreak) {
		[self write:lineBreak];
	}
}

- (void)writeIndentation {
	if(indentation) {
		for (int i = 0; i < level; i++ ) {
			[self write:indentation];
		}
	}
}

- (void) flush {
	// do nothing
}

- (void) close {
	// do nothing
}

- (NSMutableString*) toString {
	return writer;
}

- (NSData*) toData {
	if(encoding) {
		return [writer dataUsingEncoding: CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((CFStringRef)encoding)) allowLossyConversion:NO];
	} else {
		return [writer dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
	}
}


@end
