//
//  RBNavigationBar.m
//  Blendcam
//
//  Created by 夏敏 on 28/09/2017.
//  Copyright © 2017 QuVideo. All rights reserved.
//

#import "RBNavigationBar.h"
#import "RBBarView.h"
#import "RBNavigationDefines.h"

@interface RBNavigationBar()

@property (nonatomic,strong) UILabel  *titleLabel;
@property (nonatomic,strong) UIView  *bottomLine;

@property (nonatomic,strong) RBBarView  *leftBarView;
@property (nonatomic,strong) RBBarView  *rightBarView;

@end


@implementation RBNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self addSubview:self.titleLabel];
    }
    return self;
}

+ (RBNavigationBar *)customBar {
    return [[RBNavigationBar alloc] initWithFrame:CGRectMake(0, 0, RBScreenWidth, RBNavigationBarHeight)];
}


#pragma mark - Public Method

- (void)setBarTitle:(NSString *)title {
    [self setBarTitle:title attributes:[self defaultAttributes]];
}

- (void)setBarTitle:(NSString *)title attributes:(NSDictionary *)attrs {
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:title attributes:attrs];
    [self.titleLabel setAttributedText:attrString];
    [self.titleLabel sizeToFit];
    CGSize titleSize = self.titleLabel.frame.size;
    self.titleLabel.frame = CGRectMake((RBScreenWidth-titleSize.width)/2, RBStatuBarHeight + (RBNavigationHeight - titleSize.height)/2, titleSize.width, titleSize.height);
    [self setNeedsLayout];
}

- (void)setBarBackgroundColor:(UIColor *)color {
    [self setBackgroundColor:color];
}

- (void)setBottomLineWithColor:(UIColor *)color {
    self.bottomLine.backgroundColor = color;
    [self addSubview:self.bottomLine];
}

#pragma mark - Adjust title and image

- (void)setTitleEdgeInsets:(UIEdgeInsets)edgeInsets {
    [self.leftBarView setTitleEdgeInsets:edgeInsets];
    [self.rightBarView setTitleEdgeInsets:edgeInsets];
}

- (void)setImageEdgeInsets:(UIEdgeInsets)edgeInsets {
    [self.leftBarView setImageEdgeInsets:edgeInsets];
    [self.rightBarView setImageEdgeInsets:edgeInsets];
}

#pragma mark - Left setting

- (void)setLeftIcon:(NSString *)icon target:(id)target action:(SEL)leftAction {
    self.leftBarView = [[RBBarView alloc] initWithIcon:icon target:target action:leftAction];
    [self leftBarLayout];
}

- (void)setLeftTitle:(NSString *)title attributes:(NSDictionary *)attrs target:(id)target action:(SEL)leftAction{
    self.leftBarView = [[RBBarView alloc] initWithTitle:title attributes:attrs target:target action:leftAction];
    [self leftBarLayout];
}

- (void)setLeftTitle:(NSString *)title icon:(NSString *)icon attributes:(NSDictionary *)attrs target:(id)target action:(SEL)leftAction {
    self.leftBarView = [[RBBarView alloc] initWithTitle:title attributes:attrs icon:icon target:target action:leftAction];
    [self leftBarLayout];
}

- (void)leftBarLayout {
    CGSize barViewSize = [self.leftBarView barViewSize];
    self.leftBarView.frame = CGRectMake(15, RBStatuBarHeight + (RBNavigationHeight - barViewSize.height)/2, barViewSize.width, barViewSize.height);
    [self addSubview:self.leftBarView];
    [self setNeedsLayout];
}

#pragma mark - Right setting

- (void)setRightIcon:(NSString *)icon target:(id)target action:(SEL)rightAction {
    self.rightBarView = [[RBBarView alloc] initWithIcon:icon target:target action:rightAction];
    [self rightBarLayout];
}

- (void)setRightTitle:(NSString *)title attributes:(NSDictionary *)attrs target:(id)target action:(SEL)rightAction{
    self.rightBarView = [[RBBarView alloc] initWithTitle:title attributes:attrs target:target action:rightAction];
    [self rightBarLayout];
}

- (void)setRightTitle:(NSString *)title icon:(NSString *)icon attributes:(NSDictionary *)attrs target:(id)target action:(SEL)rightAction {
    self.rightBarView = [[RBBarView alloc] initWithTitle:title attributes:attrs icon:icon target:target action:rightAction];
    [self rightBarLayout];
}

- (void)rightBarLayout {
    CGSize barViewSize = [self.rightBarView barViewSize];
    self.rightBarView.frame = CGRectMake(RBScreenWidth - 15 - barViewSize.width, RBStatuBarHeight + (RBNavigationHeight - barViewSize.height)/2, barViewSize.width, barViewSize.height);
    [self addSubview:self.rightBarView];
    [self setNeedsLayout];
}

#pragma mark - Private Method

- (NSDictionary *)defaultAttributes {
    return @{
             NSFontAttributeName:[UIFont systemFontOfSize:16],
             NSForegroundColorAttributeName:[UIColor whiteColor]
             };
}

#pragma mark - Accessor

- (UILabel *)titleLabel {
    if(nil == _titleLabel){
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

- (UIView *)bottomLine {
    if(nil == _bottomLine){
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, RBNavigationBarHeight - 0.5, RBScreenWidth, 0.5)];
    }
    return _bottomLine;
}

@end
