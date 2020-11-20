//
//  CBSafeValue.m
//  ColorShell
//
//  Created by TorrLau on 16/9/16.
//  Copyright © 2016年 Caibei. All rights reserved.
//

#import "CBSafeValue.h"

@implementation NSDictionary (CBSafeValue)

#pragma mark --------------------------------
#pragma mark string

- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)stringValue {
    NSString *value;
    if (isSafeString(key)) {
        value = [self objectForKey:key];
    }
    if (isSafeString(value)) {
        return value;
    }
    
    return stringValue;
}

- (NSString *)stringForKey:(NSString *)key {
    return [self stringForKey:key defaultValue:@""];
}

#pragma mark --------------------------------
#pragma mark integer

- (NSInteger)integerForKey:(NSString *)key {
    return [self integerForKey:key defaultValue:0];
}


- (NSInteger)integerForKey:(NSString *)key defaultValue:(NSInteger)integerValue {
    id value;
    if (isSafeString(key)) {
        value = [self objectForKey:key];
    }
    if (isSafeNumber(value)) {
        return [asSafeNumber(value) integerValue];
    }else if (isSafeString(value)) {
        return [asSafeString(value) integerValue];
    }
    
    return integerValue;
}

#pragma mark --------------------------------
#pragma mark double

- (double)doubleForKey:(NSString *)key {
    return [self doubleForKey:key defaultValue:.0];
}

- (double)doubleForKey:(NSString *)key defaultValue:(double)doubleValue {
    id value;
    if (isSafeString(key)) {
        value = [self objectForKey:key];
    }
    if (isSafeNumber(value)) {
        return [asSafeNumber(value) doubleValue];
    }else if (isSafeString(value)) {
        return [asSafeString(value) doubleValue];
    }
    
    return doubleValue;
}

#pragma mark --------------------------------
#pragma mark long long

- (long long)longLongForKey:(NSString *)key {
    return [self longLongForKey:key defaultValue:0];
}

- (long long)longLongForKey:(NSString *)key defaultValue:(double)longlongValue {
    id value;
    if (isSafeString(key)) {
        value = [self objectForKey:key];
    }
    if (isSafeNumber(value)) {
        return [asSafeNumber(value) longLongValue];
    }else if (isSafeString(value)) {
        return [asSafeString(value) longLongValue];
    }
    
    return longlongValue;
}


#pragma mark --------------------------------
#pragma mark bool

- (BOOL)boolForKey:(NSString *)key {
    id value;
    if (isSafeString(key)) {
        value = [self objectForKey:key];
    }
    if (isSafeNumber(value)) {
        return [asSafeNumber(value) boolValue];
    }else if (isSafeString(value)) {
        return [asSafeString(value) boolValue];
    }
    
    return NO;
}

#pragma mark --------------------------------
#pragma mark dict

- (NSDictionary *)dictionaryForKey:(NSString *)key {
    id value;
    if (isSafeString(key)) {
        value = [self objectForKey:key];
    }
    
    return asSafeDictionary(value);
}

#pragma mark --------------------------------
#pragma mark array

- (NSArray *)arrayForKey:(NSString *)key {
    id value;
    if (isSafeString(key)) {
        value = [self objectForKey:key];
    }
    
    return asSafeArray(value);
}


@end
