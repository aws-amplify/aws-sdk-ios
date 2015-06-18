Purpose
--------------

XMLDictionary is a class designed to simplify parsing and generating of XML on iOS and Mac OS. XMLDictionary is built on top of the NSXMLParser classes, but behaves more like a DOM-style parser rather than SAX parser, in that it creates a tree of objects rather than generating events at the start and end of each node.

Unlike other DOM parsers, XMLDictionary does not attempt to replicate all of the nuances of the XML standard such as the ability to nest tags within text. If you need to represent something like an HTML document then XMLDictionary won't work for you. If you want to use XML as a data interchange format for passing nested data structures then XMLDictionary may well provide a simpler solution than other DOM-based parsers.


Supported OS & SDK Versions
-----------------------------

* Supported build target - iOS 7.1 / Mac OS 10.9 (Xcode 5.1, Apple LLVM compiler 5.1)
* Earliest supported deployment target - iOS 5.0 / Mac OS 10.7
* Earliest compatible deployment target - iOS 4.3 / Mac OS 10.6

NOTE: 'Supported' means that the library has been tested with this version. 'Compatible' means that the library should work on this OS version (i.e. it doesn't rely on any unavailable SDK features) but is no longer being tested for compatibility and may require tweaking or bug fixes to run correctly.


ARC Compatibility
------------------

As of version 1.1, XMLDictionary requires ARC. If you wish to use XMLDictionary in a non-ARC project, just add the -fobjc-arc compiler flag to the XMLDictionary.m class. To do this, go to the Build Phases tab in your target settings, open the Compile Sources group, double-click XMLDictionary.m in the list and type -fobjc-arc into the popover.

If you wish to convert your whole project to ARC, comment out the #error line in XMLDictionary.m, then run the Edit > Refactor > Convert to Objective-C ARC... tool in Xcode and make sure all files that you wish to use ARC for (including XMLDictionary.m) are checked.


Thread Safety
--------------

XMLDictionary's methods should all be thread safe. It is safe to use multiple XMLDictionaryParsers concurrently on different threads, but it is not safe to call the same parser concurrently on multiple threads.


Installation
--------------

To use the XMLDictionary in an app, just drag the class files into your project.


XMLDictionaryParser
---------------------

The XMLDictionaryParser class is responsible for parsing an XML file into a dictionary. You don't normally need to use this class explicitly as you can just use the utility methods added to NSDictionary, however it can be useful if you want to modify the default parser settings.

You can create new instances of XMLDictionaryParser if you need to use multiple different settings for different dictionaries. Once you have created an XMLDictionaryParser you can use the following methods to parse XML files using that specific parser instance:

    - (NSDictionary *)dictionaryWithData:(NSData *)data;
    - (NSDictionary *)dictionaryWithString:(NSString *)string;
    - (NSDictionary *)dictionaryWithFile:(NSString *)path;
    - (NSDictionary *)dictionaryWithParser:(NSXMLParser *)parser;

Alternatively, you can simply modify the settings of `[XMLDictionaryParser sharedInstance]` to affect the settings for all dictionaries parsed subsequently using the NSDictionary category extension methods.

Use the following properties to tweak the parsing behaviour:

    @property (nonatomic, assign) BOOL collapseTextNodes;

If YES (the default value), tags that contain only text and have no children, attributes or comments will be collapsed into a single string object, simplifying traversal of the object tree.

    @property (nonatomic, assign) BOOL stripEmptyNodes;

If YES (the default value), tags that are empty (have no children, attributes, text or comments) will be stripped.

    @property (nonatomic, assign) BOOL trimWhiteSpace;

If YES (the default value), leading and trailing white space will be trimmed from text nodes, and text nodes containing only white space will be omitted from the dictionary.

    @property (nonatomic, assign) BOOL alwaysUseArrays;

If `YES`, the every child node will be represented as an array, even if there is only one of them. This simplifies the logic needed to cope with properties that may be duplicated because you don't need to use `[value isKindOfClass:[NSArray class]]` to check the for the singular case. Defaults to `NO`.

    @property (nonatomic, assign) BOOL preserveComments;

If `YES`, XML comments will be grouped into an array under the key `__comments` and can be accessed via the `comments` method. Defaults to `NO`.

    @property (nonatomic, assign) XMLDictionaryAttributesMode attributesMode;

This property controls how XML attributes are handled. The default is `XMLDictionaryAttributesModePrefixed` meaning that attributes will be included in the dictionary, with an _ (underscore) prefix to avoid namespace collisions. Alternative values are `XMLDictionaryAttributesModeDictionary`, which will place all the attributes in a separate dictionary, `XMLDictionaryAttributesModeUnprefixed`, which includes the attributes without prefix (which may cause collisions with nodes) and `XMLDictionaryAttributesModeDiscard`, which will strip the attributes.

    @property (nonatomic, assign) XMLDictionaryNodeNameMode nodeNameMode;

This property controls how the node name is handled. The default value is `XMLDictionaryNodeNameModeRootOnly`, meaning that the node name will only be included in the root dictionary (the names for the children can be inferred from the dictionary keys, but the `nodeName` method won't work for anything except the root node). Alternative values are `XMLDictionaryNodeNameModeAlways`, meaning that the node name will be included in the dictionary with the key `__name` (and can be accessed using the `nodeName`) method, or `XMLDictionaryNodeNameModeNever` which will never include the `__name' key.


Category Methods
-----------------

XMLDictionary extends NSDictionary with the following methods:

  + (NSDictionary *)dictionaryWithXMLParser:(NSParser *)parser;

Create a new NSDictionary object from an existing NSXMLParser.  Useful if fetching data through AFNetworking.

	+ (NSDictionary *)dictionaryWithXMLData:(NSData *)data;

Create a new NSDictionary object from XML-encoded data.

	+ (NSDictionary *)dictionaryWithXMLString:(NSString *)string;

Create a new NSDictionary object from XML-encoded string.

	+ (NSDictionary *)dictionaryWithXMLFile:(NSString *)path;

Create a new NSDictionary object from and XML-encoded file.

	- (NSString *)attributeForKey:(NSString *)key;

Get the XML attribute for a given key (key name should not include prefix).

	- (NSDictionary *)attributes;

Get a dictionary of all XML attributes for a given node's dictionary. If the node has no attributes then this will return nil.

	- (NSDictionary *)childNodes;

Get a dictionary of all child nodes for a given node's dictionary. If multiple nodes have the same name they will be grouped into an array. If the node has no children then this will return nil.

	- (NSArray *)comments;

Get an array of all comments for a given node. Note that the nesting relative to other nodes is not preserved. If the node has no comments then this will return nil.

	- (NSString *)nodeName;

Get the name of the node. If the name is not known this will return nil.

	- (NSString *)innerText;

Get the text content of the node. If the node has no text content, this will return nil;

	- (NSString *)innerXML;

Get the contents of the node as an XML-encoded string. This XML string will not include the container node itself.

	- (NSString *)XMLString;

Get the node and its content as an XML-encoded string. If the node name is not known, the top level tag will be called `<root>`.

    - (NSArray *)arrayValueForKeyPath:(NSString *)keyPath;

Works just like `valueForKeyPath:` except that the value returned will always be an array. So if there is only a single value, it will be returned as `@[value]`.

    - (NSString *)stringValueForKeyPath:(NSString *)keyPath;

Works just like `valueForKeyPath:` except that the value returned will always be a string. So if the value is a dictionary, the text value of `innerText` will be returned, and if the value is an array, the first item will be returned.

    - (NSDictionary *)dictionaryValueForKeyPath:(NSString *)keyPath;

Works just like `valueForKeyPath:` except that the value returned will always be a dictionary. So if the collapseTextNodes option is enabled and the value is a string, this will convert it back to a dictionary before returning, and if the value is an array, the first item will be returned.


Usage
--------

The simplest way to load an XML file is as follows:

	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"someFile" ofType:@"xml"];
	NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLFile:filePath];

You can then iterate over the dictionary as you would with any other object tree, e.g. one loaded from a Plist.

To access nested nodes and attributes, you can use the valueForKeyPath syntax. For example to get the string value of `<foo>` from the following XML:

	<root>
		<bar cliche="true">
			<foo>Hello World</foo>
		</bar>
		<banjo>Was his name-oh</banjo>
	</root>

You would write:

	NSString *foo = [xmlDoc valueForKeyPath:@"bar.foo"];

The above examples assumes that you are using the default setting for `collapseTextNodes` and `alwaysUseArrays`. If `collapseTextNodes` is disabled then you would instead access `<foo>`'s value by writing:

	NSString *foo = [[xmlDoc valueForKeyPath:@"bar.foo"] innerText];

If the `alwaysUseArrays` option is enabled then would use one of the following, depending on the `collapseTextNodes` property:

    NSString *foo = [[xmlDoc valueForKeyPath:@"bar.foo"] firstObject];
    NSString *foo = [[[xmlDoc valueForKeyPath:@"bar.foo"] firstObject] innerText];

To get the cliche attribute of `bar`, you could write:

    NSString *barCliche = [xmlDoc[@"bar] attributes][@"cliche"];

If the `attributesMode` is set to the default value of `XMLDictionaryAttributesModePrefixed` then you can also do this:

	NSString *barCliche = [xmlDoc valueForKeyPath:@"bar._cliche"];

Or if it is set to `XMLDictionaryAttributesModeUnprefixed` you would simply do this:

    NSString *barCliche = [xmlDoc valueForKeyPath:@"bar.cliche"];
    
    
Release Notes
----------------

Version 1.4

- Added dictionaryWithXMLParser: constructor method
- Added wrapRootNode option as a nicer way to preserve root node name
- No longer crashes if non-string values are used as keys or attributes
- Now complies with the -Weverything warning level

Version 1.3

- added stripEmptyNodes property (defaults to YES)
- added arrayValueForKeyPath, stringValueForKeyPath and dictionaryValueForKeyPath methods to simplify working with data

Version 1.2.2

- sharedInstance method no longer returns a new instance each time

Version 1.2.1

- Removed isa reference, deprecated in iOS 7

Version 1.2

- Exposed XMLDictionaryParser object, which can be used to configure the parser
- Parsing options can now be changed without modifying the library
- Added option to always encode properties as arrays
- `__name` and `__coment` keys are no longer included by default
- Apostrophe is now encoded as `&apos;`
- removed `attributeForKey:` method

Version 1.1

- Updated to use ARC
- Added podspec

Version 1.0

- Initial release
