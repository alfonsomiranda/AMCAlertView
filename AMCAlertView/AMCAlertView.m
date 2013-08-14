//
//  CustomAlertView.m
//  Alfonso Miranda
//
//  Created by Alfonso Miranda Castro on 15/07/13.
//  Copyright (c) 2013 Alfonso Miranda Castro. All rights reserved.
//

#import "AMCAlertView.h"
#import <QuartzCore/QuartzCore.h>


@implementation AMCAlertView

#define kAnimationDuration  0.2555
//#define kAnimationDuration  0.4

- (id)initWithTittle:(NSString *)tittleAlert message:(NSString *)message delegate:(id)delegate buttonTitle:(NSString *)buttonTitle {
    
    self = [super init];
    if (self) {
        
        self.delegate = delegate;
        [self setFrame:[UIScreen mainScreen].bounds];
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
        
        _messageView = [[UIView alloc] init];
        
        UILabel *tittleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 280, 50)];
        [tittleLabel setBackgroundColor:[UIColor clearColor]];
        [tittleLabel setTextColor:[UIColor colorWithRed:74.0/255.0 green:89.0/255.0 blue:103.0/255.0 alpha:0.9]];
        [tittleLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        [tittleLabel setTextAlignment:NSTextAlignmentCenter];
        [tittleLabel setText:tittleAlert];
        [_messageView addSubview:tittleLabel];
        
        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.numberOfLines = 0;
        [messageLabel setBackgroundColor:[UIColor clearColor]];
        [messageLabel setTextColor:[UIColor colorWithRed:74.0/255.0 green:89.0/255.0 blue:103.0/255.0 alpha:0.9]];
        [messageLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        [messageLabel setTextAlignment:NSTextAlignmentCenter];
        [messageLabel setText:message];
        messageLabel.frame = CGRectMake(10, 40, 260, 20 + [messageLabel sizeThatFits:CGSizeMake(260, 1000)].height);
        [_messageView addSubview:messageLabel];
        _messageView.frame = CGRectMake(20,
                                        ([UIScreen mainScreen].bounds.size.height - (115 + [messageLabel sizeThatFits:CGSizeMake(260, 1000)].height)) / 2,
                                        280,
                                        115 + [messageLabel sizeThatFits:CGSizeMake(260, 1000)].height);
        [_messageView setBackgroundColor:[UIColor whiteColor]];
        CAShapeLayer * maskFirstLayer = [CAShapeLayer layer];
        maskFirstLayer.path = [UIBezierPath bezierPathWithRoundedRect: _messageView.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight  cornerRadii: (CGSize){5.0, 5.0}].CGPath;
        _messageView.layer.mask = maskFirstLayer;
        
        UIButton *messageButton = [[UIButton alloc] initWithFrame:CGRectMake(10, messageLabel.frame.origin.y + messageLabel.frame.size.height, 260, 44)];
        [messageButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:18]];
        [messageButton setTitle:buttonTitle forState:UIControlStateNormal];
        [messageButton setTitle:buttonTitle forState:UIControlStateHighlighted];
        [messageButton setBackgroundColor:[UIColor redColor]];
        [messageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [messageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [messageButton addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
        [_messageView addSubview:messageButton];
        
        [self addSubview:_messageView];
        
//        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeView)];
//        [self addGestureRecognizer:singleTap];
        
    }
    return self;
}

- (void)show {
    
    //_messageView.frame = CGRectMake(_messageView.frame.origin.x, _messageView.frame.origin.y, 0, 0);
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    
    CALayer *viewLayer = _messageView.layer;
    CAKeyframeAnimation* popInAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    
    popInAnimation.duration = kAnimationDuration;
    popInAnimation.values = [NSArray arrayWithObjects:
                             [NSNumber numberWithFloat:0.6],
                             [NSNumber numberWithFloat:1.1],
                             [NSNumber numberWithFloat:.9],
                             [NSNumber numberWithFloat:1],
                             nil];
    popInAnimation.keyTimes = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0],
                               [NSNumber numberWithFloat:0.6],
                               [NSNumber numberWithFloat:0.8],
                               [NSNumber numberWithFloat:1.0],
                               nil];
    
    [viewLayer addAnimation:popInAnimation forKey:@"transform.scale"];
    
}

- (void)closeView {
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
        
}

- (void)clickedButton:(id)sender {
    
    [self.delegate clickedButton];
    [self closeView];
    
}

- (void)infoAction {
    
    [UIView transitionFromView:_messageView toView:_messageView2 duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
        
    }];
    
}

@end
