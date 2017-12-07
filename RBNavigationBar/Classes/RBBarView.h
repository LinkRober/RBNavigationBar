//
//  RBBarView.h
//  Blendcam
//
//  Created by 夏敏 on 28/09/2017.
//  Copyright © 2017 QuVideo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBBarView : UIView

- (CGSize)barViewSize;
- (void)setTitleEdgeInsets:(UIEdgeInsets)edgeInsets;
- (void)setImageEdgeInsets:(UIEdgeInsets)edgeInsets;
- (instancetype)initWithIcon:(NSString *)icon target:(id)target  action:(SEL)action;
- (instancetype)initWithTitle:(NSString *)title attributes:(NSDictionary *)attrs target:(id)target action:(SEL)action;
- (instancetype)initWithTitle:(NSString *)title attributes:(NSDictionary *)attrs icon:(NSString *)icon target:(id)target action:(SEL)action;

@end
