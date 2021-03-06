//
//  WMKeyView.m
//  SelfDefineKeyboard
//
//  Created by wamaker on 15/9/27.
//  Copyright (c) 2015年 wamaker. All rights reserved.
//

#import "WMKeyButton.h"

#import "UIColor+extension.h"
#import "UIImage+extension.h"

@interface WMKeyButton ()

@property (copy, nonatomic) buttonClickBlock block;

@end

@implementation WMKeyButton

+ (instancetype)keyButtonWithFrame:(CGRect)frame {
    return [[self alloc] initKeyButtonWithFrame:frame];
}

- (instancetype)initKeyButtonWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:WMKeyButtonFont];
        [self setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"#dfdfdf"]] forState:UIControlStateHighlighted];
        [self addTarget:self action:@selector(keyClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setButtonClickBlock:(buttonClickBlock)block {
    self.block = block;
}

- (void)keyClicked:(WMKeyButton *)button {
    NSString *text = @"";
    if (self.type == WMKeyButtonTypeOther) {
        text = button.titleLabel.text;
    }
    self.block(self.type, text);
}

@end
