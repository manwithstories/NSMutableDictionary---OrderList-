//  NSMutableDictionary+OrderList.h
//  Copyright (c) 2014年 刘澈. All rights reserved.

#import "NSMutableDictionary+OrderList.h"

@implementation NSMutableDictionary (OrderList)

const char* OrderListKey = "ORDER_LIST_PROPERTY_KEY";

//order
-(void)putObject:(id)anObject forKey:(id<NSCopying>)aKey{
    NSMutableArray *orderList = [self getOrderList];
    if(orderList == nil){
        orderList = [[NSMutableArray alloc] init];
        [self setOrderList:orderList];
    }
    [self setObject:anObject forKey:aKey];
    if(![orderList containsObject:aKey]){
         [orderList addObject:aKey];
    }
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

-(id)getObjectAtIndex:(NSUInteger)index{
    NSMutableArray *orderList = [self getOrderList];
    if(orderList != nil && [orderList objectAtIndex:index]!= nil){
        return  [self objectForKey:[orderList objectAtIndex:index]];
    }else{
        return nil;
    }
}


-(NSArray *)getOrderAllKeysByAsc{
    NSMutableArray *orderList = [self getOrderList];
    if(orderList != nil){
        NSArray *resultArray = [orderList sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            if ([obj1 floatValue] > [obj2 floatValue]) {
                return NSOrderedDescending;
            }
            if ([obj1 floatValue] < [obj2 floatValue]) {
                return NSOrderedAscending;
            }
            return NSOrderedSame;
        }];
        return resultArray;
    }else{
        return nil;
    }
}


-(NSArray *)getOrderAllKeysByDesc{
    NSMutableArray *orderList = [self getOrderList];
    if(orderList != nil){
        NSArray *resultArray = [orderList sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            if ([obj1 floatValue] < [obj2 floatValue]) {
                return NSOrderedDescending;
            }
            if ([obj1 floatValue] > [obj2 floatValue]) {
                return NSOrderedAscending;
            }
            return NSOrderedSame;
        }];
        return resultArray;
    }else{
        return nil;
    }
}

-(NSArray *)getrReverseOrderAllKeys{
     NSMutableArray *orderList = [self getOrderList];
    if(orderList != nil && [orderList count] > 1){
        return [[orderList reverseObjectEnumerator] allObjects];
    }else{
        return orderList;
    }
}

-(void)setOrderList:(NSMutableArray *)orderList {
    objc_setAssociatedObject(self,&OrderListKey,orderList,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableArray *)getOrderList{
    return objc_getAssociatedObject(self,&OrderListKey);
}

@end
