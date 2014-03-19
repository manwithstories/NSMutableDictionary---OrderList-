//  NSMutableDictionary+OrderList.h
//  Created by 刘澈 on 14-3-19.
//  Copyright (c) 2014年 刘澈. All rights reserved.

#import "NSMutableDictionary+OrderList.h"

@implementation NSMutableDictionary (OrderList)

 const char OrderListKey;

//order
-(void)putObject:(id)anObject forKey:(id<NSCopying>)aKey{
    NSMutableArray *orderList = [self getOrderList];
    if(orderList == nil){
        orderList = [[NSMutableArray alloc] init];
        [self setOrderList:orderList];
    }
    [self setObject:anObject forKey:aKey];
    [orderList addObject:aKey];
   
}


-(NSArray *)getOrderAllKeys{
    NSMutableArray *orderList = [self getOrderList];
    if(orderList !=nil && [orderList count]>0){
        return [NSArray arrayWithArray:orderList];
    }else{
        return  nil;
    }
}


-(id)getObjectForKey:(id)aKey{
    return [self objectForKey:aKey];
}

-(void)setOrderList:(NSMutableArray *)orderList {
    objc_setAssociatedObject(self,&OrderListKey,orderList,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableArray *)getOrderList{
    NSMutableArray* orderList =objc_getAssociatedObject(self,&OrderListKey);
    return orderList;
}


-(BOOL)deleteObjectForKey:(id)aKey{
     NSMutableArray *orderList = [self getOrderList];
    if(orderList != nil && [orderList containsObject:aKey]){
        [self removeObjectForKey:aKey];
        [orderList removeObject:aKey];
        return  YES;
    }else{
        return NO;
    }
}

-(BOOL)deleteAllKeys{
    NSMutableArray *orderList = [self getOrderList];
    if(orderList !=nil){
        [self removeAllObjects];
        [orderList removeAllObjects];
        return YES;
    }else{
        return NO;
    }
}

-(id)getObjectForIndex:(NSUInteger)index{
    NSMutableArray *orderList = [self getOrderList];
    if(orderList != nil && [orderList objectAtIndex:index]!= nil){
        return  [self objectForKey:[orderList objectAtIndex:index]];
    }else{
        return nil;
    }
}

@end
