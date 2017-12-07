//
//  RBBarView.m
//  Blendcam
//
//  Created by 夏敏 on 28/09/2017.
//  Copyright © 2017 QuVideo. All rights reserved.
//

#import "RBBarView.h"

@interface RBBarView()

@property (nonatomic,strong) NSMutableArray<UIButton *>  *buttons;
@property (nonatomic,strong) NSString  *title;
@property (nonatomic,strong) NSString  *icon;
@property (nonatomic,strong) NSDictionary  *attrs;
@property (nonatomic,assign) SEL  action;
@property (nonatomic,weak) id  target;

@end

@implementation RBBarView

- (instancetype)initWithIcon:(NSString *)icon
                      target:(id)target
                      action:(SEL)action {
    if(self = [super initWithFrame:CGRectZero]){
        _icon = icon;
        _action = action;
        _target = target;
        [self setUpIcon];
    }
    return self;
}


- (instancetype)initWithTitle:(NSString *)title
                   attributes:(NSDictionary *)attrs
                       target:(id)target
                       action:(SEL)action {
    if(self = [super initWithFrame:CGRectZero]){
        _title = title;
        _attrs = attrs;
        _action = action;
        _target =  target;
        [self setUpTitle];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                   attributes:(NSDictionary *)attrs
                         icon:(NSString *)icon
                       target:(id)target
                       action:(SEL)action {
    if(self = [super initWithFrame:CGRectZero]){
        _title = title;
        _attrs = attrs;
        _icon = icon;
        _action = action;
        _target = target;
        [self setUpRichContent];
    }
    return self;
}

#pragma mark - Public Method

- (CGSize)barViewSize{
    return [self.buttons firstObject].frame.size;
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)edgeInsets{
    self.buttons.firstObject.titleEdgeInsets = edgeInsets;

}
- (void)setImageEdgeInsets:(UIEdgeInsets)edgeInsets{
    self.buttons.firstObject.imageEdgeInsets = edgeInsets;
}

#pragma mark - Private Method

- (void)setUpIcon {
    UIButton *firstButton = [self.buttons firstObject];
    [firstButton setImage:[UIImage imageNamed:_icon] forState:UIControlStateNormal];
    [firstButton addTarget:_target action:_action forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:firstButton];
    [firstButton sizeToFit];
}

- (void)setUpTitle {
    UIButton *firstButton = [self.buttons firstObject];
    [firstButton setTitle:_title forState:UIControlStateNormal];
    firstButton.titleLabel.font = _attrs[NSFontAttributeName];
    firstButton.titleLabel.textColor = _attrs[NSForegroundColorAttributeName];
    [firstButton addTarget:_target action:_action forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:firstButton];
    [firstButton sizeToFit];
}

- (void)setUpRichContent {
    UIButton *firstButton = [self.buttons firstObject];
    [firstButton setTitle:_title forState:UIControlStateNormal];
    [firstButton setImage:[UIImage imageNamed:_icon] forState:UIControlStateNormal];
    firstButton.titleLabel.font = _attrs[NSFontAttributeName];
    firstButton.titleLabel.textColor = _attrs[NSForegroundColorAttributeName];
    [firstButton addTarget:_target action:_action forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:firstButton];
    [firstButton sizeToFit];
}

#pragma mark - Accessor

- (NSMutableArray<UIButton *> *)buttons {
    if(nil == _buttons){
        _buttons = [[NSMutableArray alloc] initWithObjects:[UIButton buttonWithType:UIButtonTypeCustom], nil];
    }
    return _buttons;
}

@end
