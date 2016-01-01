//
//  NSObject+filing.m
//  运行时-归档解档
//
//  Created by 庞军豪 on 15/12/29.
//  Copyright © 2015年 庞军豪. All rights reserved.
//

#import "NSObject+filing.h"
#import <objc/runtime.h>



@implementation NSObject (filing)


-(NSArray *)ignoredName{
//The return value is not saved properties
    return nil;
}

- (instancetype)superDecoder:(NSCoder *)coder
{

    Class c = [self class];
    
    while (c && c != [NSObject class]) {
        
    
        unsigned int outCount = 0;
        
        Ivar *ivars = class_copyIvarList(c, &outCount);
        
        for (int i=0; i<outCount; i++) {
            
             NSString *key = @(ivar_getName(ivars[i]));
            
            if ([self respondsToSelector:@selector(ignoredName)]) {
            
                if ([[self ignoredName] containsObject:key]) continue;
            }
            
            id value = [coder decodeObjectForKey:key];
            
            [self setValue:value forKey:key];

        }

        free(ivars);
        
        c = [c superclass];
}
    return self;
}


//归档
-(void)superEncode:(NSCoder *)aCoder{
    
    Class c = [self class];
    
    while (c && c != [NSObject class]) {
    
    unsigned int outCount = 0;
    
    Ivar *ivars = class_copyIvarList(c, &outCount);
    
    for (int i=0; i<outCount; i++) {
        
        NSString *key = @(ivar_getName(ivars[i]));
        
        id value = [self valueForKey:key];
        
        [aCoder encodeObject:value forKey:key];
    }
    
    free(ivars);
        
        c = [c superclass];
    }
    
}

- (instancetype)decoder:(NSCoder *)coder
{
        unsigned int outCount = 0;
        
        Ivar *ivars = class_copyIvarList([self class], &outCount);
        
        for (int i=0; i<outCount; i++) {
            
            NSString *key = @(ivar_getName(ivars[i]));
            
            if ([self respondsToSelector:@selector(ignoredName)]) {
                
                
                if ([[self ignoredName] containsObject:key]) continue;
            }
            
            id value = [coder decodeObjectForKey:key];
            
            [self setValue:value forKey:key];
            
        }
        
        free(ivars);

    return self;
}

-(void)encode:(NSCoder *)aCoder{
        
        unsigned int outCount = 0;
        
        Ivar *ivars = class_copyIvarList([self class], &outCount);
        
        for (int i=0; i<outCount; i++) {
            
            NSString *key = @(ivar_getName(ivars[i]));
            
            id value = [self valueForKey:key];
            
            [aCoder encodeObject:value forKey:key];
            
        }
        
        free(ivars);
}
@end
