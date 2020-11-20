//
//  CSSafeValue.h
//  ColorShell
//
//  Created by TorrLau on 16/9/16.
//  Copyright © 2016年 Caibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CBSafeValue)

- (NSString *)stringForKey:(NSString *)key;//default = @""
- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)stringValue;

- (NSInteger)integerForKey:(NSString *)key;//default = 0
- (NSInteger)integerForKey:(NSString *)key defaultValue:(NSInteger)integerValue;


- (double)doubleForKey:(NSString *)key;//default = .0
- (double)doubleForKey:(NSString *)key defaultValue:(double)doubleValue;

- (long long)longLongForKey:(NSString *)key;//default = 0
- (long long)longLongForKey:(NSString *)key defaultValue:(double)longlongValue;

- (BOOL)boolForKey:(NSString *)key;//default = NO
- (NSDictionary *)dictionaryForKey:(NSString *)key;//default = @{}
- (NSArray *)arrayForKey:(NSString *)key;//default = @[]



@end


static inline BOOL isSafeString(id strlike) {
    if (strlike && [strlike isKindOfClass:[NSString class]] && [strlike length] > 0) {
        return YES;
    }else{
        return NO;
    }
}

//strong NSNumber
static inline BOOL isSafeNumber(id numlike){
    if (numlike && [numlike isKindOfClass:[NSNumber class]]) {
        return YES;
    }else{
        return NO;
    }
}


//strong NSArray
static inline BOOL isSafeArray(id arraylike) {
    if (arraylike && [arraylike isKindOfClass:[NSArray class]] && [arraylike count] > 0) {
        return YES;
    }else{
        return NO;
    }
}

//strong NSDictionary
static inline BOOL isSafeDictionary(id dictlike) {
    if (dictlike && [dictlike isKindOfClass:[NSDictionary class]] && [[dictlike allKeys] count] > 0 && [[dictlike allValues] count] > 0) {
        NSDictionary *dic = dictlike;
        if (dic.allKeys.count > 0) {
            return YES;
        }
    }
    return NO;
}

static inline NSString* asSafeString(id strlike) {
    if (strlike && [strlike isKindOfClass:[NSString class]] && [strlike length] > 0) {
        return strlike;
    }else{
        return @"";
    }
}

static inline NSNumber* asSafeNumber(id numberlike) {
    if (numberlike && [numberlike isKindOfClass:[NSNumber class]]) {
        return numberlike;
    }else{
        return @(0);
    }
}

static inline NSArray* asSafeArray(id arraylike) {
    if (arraylike && [arraylike isKindOfClass:[NSArray class]]) {
        return arraylike;
    }else{
        return @[];
    }
}

static inline NSDictionary* asSafeDictionary(id dictlike) {
    if (dictlike && [dictlike isKindOfClass:[NSDictionary class]]) {
        return dictlike;
    }else{
        return @{};
    }
}
