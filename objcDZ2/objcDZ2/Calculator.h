//
//  Calculator.h
//  objcDZ2
//
//  Created by Алексей Мальков on 14.10.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calculator : NSObject

@property NSNumber *first;
@property NSNumber *second;
@property NSNumber *state;

-(void)menu;
-(void)doPlusWithFirst:(NSNumber *) first Second:(NSNumber *) second;
-(void)doMinusWithFirst:(NSNumber *) first Second:(NSNumber *) second;
-(void)doMultiplyWithFirst:(NSNumber *) first Second:(NSNumber *) second;
-(void)doDevideWithFirst:(NSNumber *) first Second:(NSNumber *) second;
-(void)getNumbers;

@end

NS_ASSUME_NONNULL_END
