//
//  main.m
//  objcDZ2
//
//  Created by Алексей Мальков on 14.10.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

BOOL isEnglishAlphabet(char ch){
    NSString *pattern = @"([a-z])";
    NSRegularExpressionOptions regexpOptions = NSRegularExpressionCaseInsensitive;
    NSError* error = NULL;
    
    NSRegularExpression* regexp = [NSRegularExpression regularExpressionWithPattern: pattern options: regexpOptions error: &error];
    
    if (error){
        return NO;
    } else {
        NSString *testChar = [NSString stringWithUTF8String:&ch];
        NSInteger match = [regexp numberOfMatchesInString:testChar options:0 range:NSMakeRange(0, [testChar length])];
        
        if (match > 0){
            return YES;
        } else {
            return NO;
        }
    }
    
    return YES;
}

void menu() {
    int operations = -1;
    char ch;
    
    printf("\nВыберите функцию:\n");
    printf(" 1. Английский.\n");
    printf(" 2. Калькулятор.\n");
    printf(" 3. Принт.\n");

    printf("Функция: ");
    scanf(" %i", &operations);
    
    if (operations == 1) {
        BOOL test = NO;
        
        printf("Введите букву из английского алфавита: ");
        scanf(" %c", &ch);
        
        test = isEnglishAlphabet(ch);

        if (test == YES) {
            printf("\nБуква входит в английский алфовит\n");
        } else {
            printf("\nБуква НЕ входит в английский алфовит.\n");
        }
        
        menu();
        
    } else if (operations == 3) {
        
        int number = 0;
                
        printf("Введите число: ");
        scanf(" %i", &number);
        
        NSMutableArray *array = [NSMutableArray arrayWithObject:[NSNumber numberWithInt:number]];
        
        do {
            printf("Введите число или -1 для принта: ");
            scanf(" %i", &number);
            
            NSInteger count = [array count];
            [array insertObject:[NSNumber numberWithInt:number] atIndex:count];
        } while (number != -1);
        
        printf("Принт: ");
        
        for (NSNumber *number in array) {
            if ([number intValue] != -1){
                printf("%i", [number intValue]);
                printf(",");
            }
        }
        
        printf("\n");
        menu();
        
    } else {
        Calculator *calc = [Calculator new];
        [calc getNumbers];
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        menu();
    }
    return 0;
}
