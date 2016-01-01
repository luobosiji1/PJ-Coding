//
//  NSObject+filing.h
//  -归档解档
//
//  Created by PJ on 15/12/29.
//  Copyright © 2015年 PJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (filing)

-(NSArray *)ignoredName;
- (instancetype)decoder:(NSCoder *)coder;
-(void)encode:(NSCoder *)aCoder;

- (instancetype)superDecoder:(NSCoder *)coder;
-(void)superEncode:(NSCoder *)aCoder;

@end
