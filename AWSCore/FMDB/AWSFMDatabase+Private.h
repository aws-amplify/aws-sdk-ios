//
//  FMDatabase+Private.h
//  deleteme2
//
//  Created by Robert Ryan on 8/2/15.
//  Copyright (c) 2015 Robert Ryan. All rights reserved.
//

#ifndef deleteme2_FMDatabase_Private_h
#define deleteme2_FMDatabase_Private_h

#import <sqlite3.h>

@class AWSFMDatabase;
@class AWSFMStatement;

@interface AWSFMDatabase (Private)

/** SQLite sqlite3
 
 @see [`sqlite3`](http://www.sqlite.org/c3ref/sqlite3.html)
 */

@property (nonatomic, assign, readonly) sqlite3 *db;

@end

@interface AWSFMStatement (Private)

/** SQLite sqlite3_stmt
 
 @see [`sqlite3_stmt`](http://www.sqlite.org/c3ref/stmt.html)
 */

@property (nonatomic, assign) sqlite3_stmt *statement;

@end

#endif
