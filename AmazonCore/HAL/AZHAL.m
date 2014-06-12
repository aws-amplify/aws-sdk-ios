/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "AZHAL.h"
#import "CSURITemplate.h"

NSString *const AZHALEmbedded = @"_embedded";
NSString *const AZHALLinks = @"_links";
NSString *const AZHALCuries = @"curies";

@implementation AZHALResource

- (instancetype)initWithJSONObject:(id)JSONObject {
    if (self = [super init]) {
        _curies = [AZHALResource curiesFromJSONObject:JSONObject];
        _links = [AZHALResource linksFromJSONObject:JSONObject
                                             curies:_curies];
        _embedded = [AZHALResource embeddedFromJSONObject:JSONObject
                                                   curies:_curies];
        _resourceJSON = [AZHALResource resourceJSONFromJSONObject:JSONObject];
    }

    return self;
}

- (instancetype)initWithJSONObject:(id)JSONObject curies:(NSDictionary *)curies {
    if (self = [super init]) {
        _curies = curies;
        _links = [AZHALResource linksFromJSONObject:JSONObject
                                             curies:_curies];
        _embedded = [AZHALResource embeddedFromJSONObject:JSONObject
                                                   curies:_curies];
        _resourceJSON = [AZHALResource resourceJSONFromJSONObject:JSONObject];
    }

    return self;
}

- (instancetype)initWithHALResource:(AZHALResource *)HALResource {
    if ((self = [MTLJSONAdapter modelOfClass:self.class
                          fromJSONDictionary:HALResource.resourceJSON
                                       error:NULL])) {
        _curies = HALResource.curies;
        _links = HALResource.links;
        _embedded = HALResource.embedded;
        _resourceJSON = HALResource.resourceJSON;
    }

    return self;
}

+ (instancetype)resourceWithJSONObject:(id)JSONObject {
    return [[AZHALResource alloc] initWithJSONObject:JSONObject];;
}

+ (instancetype)resourceWithJSONObject:(id)JSONObject curies:(NSDictionary *)curies {
    return [[AZHALResource alloc] initWithJSONObject:JSONObject curies:curies];;
}

+ (instancetype)resourceWithHALResource:(AZHALResource *)HALResource {
    return [[AZHALResource alloc] initWithHALResource:HALResource];
}

+ (NSDictionary *)curiesFromJSONObject:(id)JSONObject {
    NSMutableDictionary *curies = [NSMutableDictionary new];

    if ([JSONObject isKindOfClass:[NSDictionary class]]) {
        id linksJSONObject = [JSONObject objectForKey:AZHALLinks];
        if ([linksJSONObject isKindOfClass:[NSDictionary class]]) {
            id curiesJSONObject = [linksJSONObject objectForKey:AZHALCuries];
            if ([curiesJSONObject isKindOfClass:[NSArray class]]) {
                for (id curie in curiesJSONObject) {
                    AZHALLink *link = [AZHALLink linkWithRel:AZHALCuries
                                                  JSONObject:curie];
                    if (link) {
                        [curies setValue:link
                                  forKey:link.name];
                    }
                }
            }
        }
    }

    return curies;
}

+ (NSDictionary *)linksFromJSONObject:(id)JSONObject curies:(NSDictionary *)curies {
    NSMutableDictionary *links = [NSMutableDictionary new];

    if ([JSONObject isKindOfClass:[NSDictionary class]]) {
        id linksJSONObject = [JSONObject objectForKey:AZHALLinks];
        if ([linksJSONObject isKindOfClass:[NSDictionary class]]) {
            for (id linkKey in linksJSONObject) {
                if ([linkKey isKindOfClass:[NSString class]]) {
                    if (![linkKey isEqualToString:AZHALCuries]) {
                        NSString *expandedRelation = [AZHALResource tryExpandRelation:linkKey
                                                                               curies:curies];
                        if (expandedRelation) {
                            id linkJSONObject = [linksJSONObject objectForKey:linkKey];
                            if ([linkJSONObject isKindOfClass:[NSDictionary class]]) {
                                AZHALLink *link = [AZHALLink linkWithRel:expandedRelation
                                                              JSONObject:linkJSONObject];
                                if (link) {
                                    [links setValue:link
                                             forKey:expandedRelation];
                                }
                            } else if ([linkJSONObject isKindOfClass:[NSArray class]]) {
                                NSMutableArray *linkArray = [NSMutableArray new];

                                for (id linkArrayElement in linkJSONObject) {
                                    AZHALLink *link = [AZHALLink linkWithRel:expandedRelation
                                                                  JSONObject:linkArrayElement];
                                    if (link) {
                                        [linkArray addObject:link];
                                    }
                                }

                                [links setValue:linkArray
                                         forKey:expandedRelation];
                            }
                        }
                    }
                }
            }
        }
    }

    return links;
}

+ (NSDictionary *)embeddedFromJSONObject:(id)JSONObject curies:(NSDictionary *)curies {
    NSMutableDictionary *embedded = [NSMutableDictionary new];

    if ([JSONObject isKindOfClass:[NSDictionary class]]) {
        id embeddedJSONObject = [JSONObject objectForKey:AZHALEmbedded];
        for (id linkRelation in embeddedJSONObject) {
            if ([linkRelation isKindOfClass:[NSString class]]) {
                NSString *expandedRelation = [AZHALResource tryExpandRelation:linkRelation
                                                                       curies:curies];
                if (expandedRelation) {
                    id embeddedJson = [embeddedJSONObject objectForKey:linkRelation];
                    if ([embeddedJson isKindOfClass:[NSDictionary class]]) {
                        [embedded setValue:[AZHALResource resourceWithJSONObject:embeddedJson curies:curies]
                                    forKey:expandedRelation];
                    } else if ([embeddedJson isKindOfClass:[NSArray class]]) {
                        NSMutableArray *embeddedArray = [NSMutableArray new];
                        for (id obj in embeddedJson) {
                            [embeddedArray addObject:[AZHALResource resourceWithJSONObject:obj curies:curies]];
                        }
                        [embedded setValue:embeddedArray
                                    forKey:expandedRelation];
                    }
                }
            }
        }
    }

    return embedded;
}

+ (NSDictionary *)resourceJSONFromJSONObject:(id)JSONObject {
    NSMutableDictionary *JSONMutableDictionary = [JSONObject mutableCopy];;
    if ([JSONObject isKindOfClass:[NSDictionary class]]) {
        [JSONMutableDictionary removeObjectForKey:AZHALEmbedded];
        [JSONMutableDictionary removeObjectForKey:AZHALLinks];
    }

    return JSONMutableDictionary;
}

+ (NSString *)tryExpandRelation:(NSString *)rel curies:(NSDictionary *)curies {
    NSURL *relURL = [NSURL URLWithString:rel];
    AZHALLink *curie = [curies objectForKey:relURL.scheme];

    if (curie.isTemplated) {
        NSString *relValue = [relURL resourceSpecifier];
        NSError *error = nil;
        CSURITemplate *template = [CSURITemplate URITemplateWithString:curie.href
                                                                 error:&error];
        rel = [template relativeStringWithVariables:@{@"rel" : relValue}
                                              error:&error];
    } else if (curie) {
        rel = curie.href;
    }

    return rel;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"links=%@, embedded=%@, curies=%@, resourceJSON=%@",
            self.links,
            self.embedded,
            self.curies,
            self.resourceJSON];
}

@end

@implementation AZHALLink

+ (AZHALLink *)linkWithRel:(NSString *)rel JSONObject:(id)JSONObject {
    AZHALLink *link = [[AZHALLink alloc] initWithRel:rel JSONObject:JSONObject];
    return link;
}

- (instancetype)initWithRel:(NSString *)rel JSONObject:(id)JSONObject {
    if (self = [super init]) {
        _rel = [rel copy];
        if ([JSONObject isKindOfClass:[NSDictionary class]]) {
            _href = [[JSONObject objectForKey:@"href"] copy];
            _name = [[JSONObject objectForKey:@"name"] copy];
            _title = [[JSONObject objectForKey:@"title"] copy];
            _hreflang = [[JSONObject objectForKey:@"hreflang"] copy];
            _templated = [[JSONObject objectForKey:@"templated"] boolValue];
        }
    }

    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"rel=%@, href=%@, isTemplated=%@, type=%@, deprecation=%@, name=%@, profile=%@, title=%@, hreflang=%@",
            self.rel,
            self.href,
            self.isTemplated ? @"YES" : @"NO",
            self.type,
            self.deprecation,
            self.name,
            self.profile,
            self.title,
            self.hreflang];
}

@end
