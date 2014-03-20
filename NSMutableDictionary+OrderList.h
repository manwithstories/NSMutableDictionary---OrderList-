//  NSMutableDictionary+OrderList.h
//  Copyright (c) 2014年 刘澈. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  <objc/runtime.h>

@interface NSMutableDictionary (OrderList)


-(void)putObject:(id)anObject forKey:(id<NSCopying>)aKey;

-(NSArray *)getOrderAllKeys;

-(id)getObjectForKey:(id)aKey;

-(BOOL)deleteObjectForKey:(id)aKey;

-(BOOL)deleteAllKeys;

-(id)getObjectForIndex:(NSUInteger)index;

@end
