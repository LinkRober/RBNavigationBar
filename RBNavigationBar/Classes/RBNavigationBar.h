//
//  RBNavigationBar.h
//  Blendcam
//
//  Created by 夏敏 on 28/09/2017.
//  Copyright © 2017 QuVideo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBNavigationBar : UIView

+ (RBNavigationBar *)customBar;

- (void)setBarTitle:(NSString *)title;
- (void)setBarTitle:(NSString *)title attributes:(NSDictionary *)attrs;
- (void)setBottomLineWithColor:(UIColor *)color;
- (void)setBarBackgroundColor:(UIColor *)color;
- (void)setTitleEdgeInsets:(UIEdgeInsets)edgeInsets;
- (void)setImageEdgeInsets:(UIEdgeInsets)edgeInsets;

- (void)setRightIcon:(NSString *)icon target:(id)target  action:(SEL)rightAction;
- (void)setRightTitle:(NSString *)title attributes:(NSDictionary *)attrs target:(id)target action:(SEL)rightAction;
- (void)setRightTitle:(NSString *)title icon:(NSString *)icon attributes:(NSDictionary *)attrs target:(id)target action:(SEL)rightAction;

- (void)setLeftIcon:(NSString *)icon target:(id)target action:(SEL)leftAction;
- (void)setLeftTitle:(NSString *)title attributes:(NSDictionary *)attrs target:(id)target action:(SEL)leftAction;
- (void)setLeftTitle:(NSString *)title icon:(NSString *)icon attributes:(NSDictionary *)attrs target:(id)target action:(SEL)leftAction;





@end
