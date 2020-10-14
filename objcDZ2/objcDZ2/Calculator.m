//
//  Calculator.m
//  objcDZ2
//
//  Created by Алексей Мальков on 14.10.2020.
//  Copyright © 2020 Alexey Malkov. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(void)menu {
    Calculator *calc = self;
    int menu_item = 0;
    
    printf("\nВыберете, что вы хотите сделать в введенными числами.");
    printf("\n___\n");
    printf(" 1: Сложение\n");
    printf(" 2: Вычитание\n");
    printf(" 3: Умножение\n");
    printf(" 4: Деление\n");
    printf("___\n");
    
    scanf("%int",&menu_item);
    calc.operations = [NSNumber numberWithInteger:menu_item];
    
    if (menu_item != -1 && menu_item != 1 && menu_item != 2 && menu_item != 3 && menu_item != 4) {
        printf("Введите 1, 2, 3, 4");
        [self menu];
    }
}

-(void) getNumbers {
    Calculator *calc = self;
    
    int first_entered = 0;
    int second_entered = 0;
    
    printf("\nВведите два числа.\n");
    printf("Первое: ");
    scanf("%i", &first_entered);
    
    calc.first = [NSNumber numberWithInt:first_entered];
    
    if (first_entered > -1) {
        printf("Второе: ");
        scanf("%i", &second_entered);
    
        calc.second = [NSNumber numberWithInt:second_entered];
        
        if (first_entered > -1 && second_entered > -1){
            [self menu];
            [self doCalculateWithOperation:calc.operations];
        }
    }
}

-(void) doCalculateWithOperation:(NSNumber *) operation {
    Calculator *calc = self;
    
    switch ([operation intValue]) {
        case 1: {
            [self doPlusWithFirst:calc.first Second:calc.second];
            break;
        }
        case 2: {
            [self doMinusWithFirst:calc.first Second:calc.second];
            break;
        }
        case 3: {
            [self doMultiplyWithFirst:calc.first Second:calc.second];
            break;
        }
        case 4: {
            [self doDevideWithFirst:calc.first Second:calc.second];
            break;
        }
        case -1: {
            printf("Выход\n");
            break;
        }
        default:
            printf("Введите 1, 2, 3, 4");
            break;
    }

    if ([operation intValue] > -1) {
        [self getNumbers];
    }
}

-(void)doPlusWithFirst:(NSNumber *) first Second:(NSNumber *) second {
    printf("Сумма двух чисел равна: %i\n", ([first intValue] + [second intValue]));
}

-(void)doMinusWithFirst:(NSNumber *) first Second:(NSNumber *) second {
    printf("Вычитание двух чисел равно: %i\n", ([first intValue] - [second intValue]));
}

-(void)doMultiplyWithFirst:(NSNumber *) first Second:(NSNumber *) second {
    printf("Умножение двух чичел равно: %i\n", ([first intValue] * [second intValue]));
}

-(void)doDevideWithFirst:(NSNumber *) first Second:(NSNumber *) second {
    printf("Деление двух чисел равно: %i\n", ([first intValue] / [second intValue]));
}

@end
