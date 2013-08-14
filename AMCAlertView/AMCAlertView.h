//
//  CustomAlertView.h
//  Alfonso Miranda
//
//  Created by Alfonso Miranda Castro on 15/07/13.
//  Copyright (c) 2013 Alfonso Miranda Castro. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol AMCAlertViewDelegate <NSObject>

@optional
- (void)clickedButton;

@end

@interface AMCAlertView : UIView {
    
    UIView *_messageView;
    UIView *_messageView2;
    UIView *_parentView;
    
}

@property(nonatomic, assign) id<AMCAlertViewDelegate> delegate;

- (id)initWithTittle:(NSString *)tittleAlert message:(NSString *)message delegate:(id)delegate buttonTitle:(NSString *)buttonTitle;
- (void)show;

@end
