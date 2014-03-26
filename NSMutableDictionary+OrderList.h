//  NSMutableDictionary+OrderList.h
//  Copyright (c) 2014年 刘澈. All rights reserved.

#import <Foundation/Foundation.h>
#import  <objc/runtime.h>

@interface NSMutableDictionary (OrderList)

/* 调用这个方法动态绑定属性，实现KEY的有序性 */
-(void)putObject:(id)anObject forKey:(id<NSCopying>)aKey;

/* 按照插入Key的顺序得到 key的有序列表 */
-(NSArray *)getOrderAllKeys;

/* 通过KEY 获得Value对象 */
-(id)getObjectForKey:(id)aKey;

/* 通过Key删除一个对象，同时也删除动态属性中维护的KEY */
-(BOOL)deleteObjectForKey:(id)aKey;

/* 删除字典中全部的对象，同时也删除动态属性全部的对象 */
-(BOOL)deleteAllKeys;

/*按照插入Key的顺序获得一个对象，没有则返回nil */
-(id)getObjectForIndex:(NSUInteger)index;

@end
