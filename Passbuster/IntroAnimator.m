//
//  IntroAnimator.m
//  Passbuster
//
//  Created by Fincher Justin on 15/10/30.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import "IntroAnimator.h"
#import "FMDBAPI.h"
#import "CocoaSecurity.h"

@interface IntroAnimator ()

@property (nonatomic, strong) UIImageView *LockerInner;
@property (nonatomic, strong) UIImageView *LockerOuter;
@property (nonatomic, strong) UIImageView *LockerBackground;
@property (nonatomic, strong) UIButton *ConfirmPasswordButton;
@property (nonatomic, strong) UILabel *FrameOneLabel;
@property (nonatomic, strong) UILabel *FrameOneSubLabel;
@property (nonatomic, strong) UILabel *FrameTwoSubLabel;
@property (nonatomic, strong) UILabel *FrameThreeLabel;
@property (nonatomic, strong) UITextField *FrameFourTextField;
@property (nonatomic, strong) UIButton *FrameFourButton;




@end

@implementation IntroAnimator
@synthesize LockerInner,LockerOuter,LockerBackground;
@synthesize ConfirmPasswordButton;
@synthesize FrameOneLabel,FrameOneSubLabel;
@synthesize FrameTwoSubLabel;
@synthesize FrameThreeLabel;
@synthesize FrameFourButton,FrameFourTextField;

- (instancetype)init
{
    if ((self = [super init])) {
        self.numberOfPages = 4;
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        self.numberOfPages = 4;
    }
    
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.numberOfPages = 4;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self configureScrollViewAnimations];
    [self configureViews];
    [self configureAnimations];

}

- (void)configureViews
{
    LockerBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Locker_background"]];
    [self.contentView addSubview:LockerBackground];
    
    LockerOuter = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-140)/2, 165.f, 140.0f, 140.0f)];
    LockerOuter.image = [UIImage imageNamed:@"Locker_outer"];
    [self.contentView addSubview:LockerOuter];
    
    LockerInner = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-60)/2, 205.0f, 60.0f, 60.0f)];
    LockerInner.image = [UIImage imageNamed:@"Locker_inner"];
    [self.contentView addSubview:LockerInner];
    
    FrameOneLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 330.0f, 200, 100)];
    FrameOneLabel.text = @"PASSBUSTER™";
    FrameOneLabel.font = [UIFont systemFontOfSize:30.0f];
    FrameOneLabel.textColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0f];
    [self.contentView addSubview:FrameOneLabel];
    
    FrameOneSubLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 380.0f, 200.0f, 80)];
    FrameOneSubLabel.text = @"Scroll to protect your password";
    FrameOneSubLabel.font = [UIFont systemFontOfSize:20.0f];
    FrameOneSubLabel.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0f];
    FrameOneSubLabel.lineBreakMode = NSLineBreakByWordWrapping;
    FrameOneSubLabel.numberOfLines = 0;
    FrameOneSubLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:FrameOneSubLabel];
    
    FrameTwoSubLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 380.0f, 200.0f, 80)];
    FrameTwoSubLabel.text = @"PASSBUSTER is an open source password manage on iOS";
    FrameTwoSubLabel.font = [UIFont systemFontOfSize:14.0f];
    FrameTwoSubLabel.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0f];
    FrameTwoSubLabel.lineBreakMode = NSLineBreakByWordWrapping;
    FrameTwoSubLabel.numberOfLines = 0;
    FrameTwoSubLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:FrameTwoSubLabel];

    FrameThreeLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 330.0f, 200, 100)];
    FrameThreeLabel.text = @"Scroll to set your main password";
    FrameThreeLabel.font = [UIFont systemFontOfSize:20.0f];
    FrameThreeLabel.lineBreakMode = NSLineBreakByWordWrapping;
    FrameThreeLabel.numberOfLines = 0;
    FrameThreeLabel.textColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0f];
    FrameThreeLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:FrameThreeLabel];
    
    
    FrameFourTextField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 330.0f, 200, 100)];
    FrameFourTextField.placeholder = @"Please input main password in this field";
    FrameFourTextField.borderStyle = UITextBorderStyleRoundedRect;
    FrameFourTextField.secureTextEntry = YES;
    [self.contentView addSubview:FrameFourTextField];
    
    FrameFourButton = [[UIButton alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height - 80, self.view.frame.size.width - 20*2, 60)];
    FrameFourButton.backgroundColor = [UIColor whiteColor];
    FrameFourButton.layer.cornerRadius = 4;
    FrameFourButton.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    FrameFourButton.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    FrameFourButton.layer.shadowOpacity = 0.2;//阴影透明度，默认0
    FrameFourButton.layer.shadowRadius = 3;//阴影半径，默认3
    FrameFourButton.layer.masksToBounds = NO;
    [FrameFourButton setTitle:@"DONE" forState:UIControlStateNormal];
    [FrameFourButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [FrameFourButton addTarget:self action:@selector(IntroSetPassword) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:FrameFourButton];
}

- (void)configureAnimations
{
    [self configureLockerInner];
    [self configureLockerOuter];
    [self configureLockerBackground];
    [self configureFrameOneLabel];
    [self configureFrameOneSubLabel];
    [self configureFrameTwoSubLabel];
    [self configureFrameThreeLabel];
    [self configureFrameFourTextField];
    [self configureFrameFourButton];
}


- (void)configureLockerInner
{
    [self keepView:self.LockerInner
           onPages:@[ @(0),@(1),@(2),@(3) ]
           atTimes:@[ @(0),@(1),@(2),@(3) ]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.LockerInner
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0f
                                                                  constant:205.0f]];
    
    IFTTTRotationAnimation *LockerInnerRotationAnimation = [IFTTTRotationAnimation animationWithView:self.LockerInner];
    [LockerInnerRotationAnimation addKeyframeForTime:1.0f rotation:0.0f];
    [LockerInnerRotationAnimation addKeyframeForTime:2.0f rotation:90.0f];
    [self.animator addAnimation:LockerInnerRotationAnimation];
    
    IFTTTAlphaAnimation *LockerInnerAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.LockerInner];
    [LockerInnerAlphaAnimation addKeyframeForTime:0.0f alpha:0.0f];
    [LockerInnerAlphaAnimation addKeyframeForTime:1.0f alpha:1.0f];
    [self.animator addAnimation:LockerInnerAlphaAnimation];
    
    IFTTTTranslationAnimation *LockerInnerTranslationAnimation = [IFTTTTranslationAnimation animationWithView:self.LockerInner];
    [LockerInnerTranslationAnimation addKeyframeForTime:2 translation:CGPointMake(0, 0)];
    [LockerInnerTranslationAnimation addKeyframeForTime:3 translation:CGPointMake(100, 0)];
    [self.animator addAnimation:LockerInnerTranslationAnimation];
}
- (void)configureLockerOuter
{
    [self keepView:self.LockerOuter
           onPages:@[ @(0),@(1),@(2),@(3) ]
           atTimes:@[ @(0),@(1),@(2),@(3) ]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.LockerOuter
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0f
                                                                  constant:165.0f]];
    
    IFTTTAlphaAnimation *LockerOuterAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.LockerOuter];
    [LockerOuterAlphaAnimation addKeyframeForTime:0.0f alpha:0.0f];
    [LockerOuterAlphaAnimation addKeyframeForTime:1.0f alpha:1.0f];
    [self.animator addAnimation:LockerOuterAlphaAnimation];
    
    IFTTTTranslationAnimation *LockerOuterTranslationAnimation = [IFTTTTranslationAnimation animationWithView:self.LockerOuter];
    [LockerOuterTranslationAnimation addKeyframeForTime:2 translation:CGPointMake(0, 0)];
    [LockerOuterTranslationAnimation addKeyframeForTime:3 translation:CGPointMake(0, -100)];
    [self.animator addAnimation:LockerOuterTranslationAnimation];

}
- (void)configureLockerBackground
{
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.LockerBackground
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0f
                                                                  constant:0.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.LockerBackground
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1.0f
                                                                  constant:0.0f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.LockerBackground
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1.0f
                                                                  constant:0.0f]];

    [self keepView:self.LockerBackground
           onPages:@[ @(1),@(2),@(3),@(4) ]
           atTimes:@[ @(1),@(2),@(3),@(4) ]];
    
}

- (void)configureFrameOneLabel
{
 
    [self keepView:self.FrameOneLabel
           onPages:@[ @(0),@(1)]
           atTimes:@[ @(0),@(1) ]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.FrameOneLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0f
                                                                  constant:330.0f]];
    
}

- (void)configureFrameOneSubLabel
{
    
    [self keepView:self.FrameOneSubLabel
           onPages:@[ @(0)]
           atTimes:@[ @(0)]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.FrameOneSubLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0f
                                                                  constant:380.0f]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.FrameOneSubLabel
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.0f
                                                                  constant:200.0f]];
    
}

- (void)configureFrameTwoSubLabel
{
    
    [self keepView:self.FrameTwoSubLabel
           onPages:@[ @(1)]
           atTimes:@[ @(1)]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.FrameTwoSubLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0f
                                                                  constant:380.0f]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.FrameTwoSubLabel
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.0f
                                                                  constant:200.0f]];
    
}

- (void)configureFrameThreeLabel
{
    
    [self keepView:self.FrameThreeLabel
           onPages:@[ @(2),@(3)]
           atTimes:@[ @(2),@(3)]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.FrameThreeLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0f
                                                                  constant:330.0f]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.FrameThreeLabel
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.0f
                                                                  constant:200.0f]];
    
    IFTTTTranslationAnimation *FrameThreeLabelTranslationAnimation = [IFTTTTranslationAnimation animationWithView:self.FrameThreeLabel];
    [FrameThreeLabelTranslationAnimation addKeyframeForTime:2 translation:CGPointMake(0, 0)];
    [FrameThreeLabelTranslationAnimation addKeyframeForTime:3 translation:CGPointMake(0, -100)];
    [self.animator addAnimation:FrameThreeLabelTranslationAnimation];


}

- (void)configureFrameFourTextField
{
    
    [self keepView:self.FrameFourTextField
           onPages:@[ @(2),@(3)]
           atTimes:@[ @(2),@(3)]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.FrameFourTextField
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-140.0f]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.FrameFourTextField
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.0f
                                                                  constant:280.0f]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.FrameFourTextField
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:0.0f
                                                                  constant:56.0f]];
    
    IFTTTAlphaAnimation *FrameFourTextFieldAlphaAnimation = [IFTTTAlphaAnimation animationWithView:FrameFourTextField];
    [FrameFourTextFieldAlphaAnimation addKeyframeForTime:2.0f alpha:0.0f];
    [FrameFourTextFieldAlphaAnimation addKeyframeForTime:3.0f alpha:1.0f];
    [self.animator addAnimation:FrameFourTextFieldAlphaAnimation];
    

}

- (void)configureFrameFourButton
{
    
    [self keepView:self.FrameFourButton
           onPages:@[ @(2),@(3)]
           atTimes:@[ @(2),@(3)]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.FrameFourButton
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0f
                                                                  constant:-20.0f]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.FrameFourButton
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:0.0f
                                                                  constant:60.0f]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.FrameFourButton
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.0f
                                                                  constant:280.0f]];
    
    
    IFTTTAlphaAnimation *FrameFrameFourButtonAlphaAnimation = [IFTTTAlphaAnimation animationWithView:FrameFourButton];
    [FrameFrameFourButtonAlphaAnimation addKeyframeForTime:2.0f alpha:0.0f];
    [FrameFrameFourButtonAlphaAnimation addKeyframeForTime:3.0f alpha:1.0f];
    [self.animator addAnimation:FrameFrameFourButtonAlphaAnimation];
}

- (void)IntroSetPassword
{
    NSString *MainPassword = self.FrameFourTextField.text;
    NSString *MainPassword_Trimmed = [MainPassword stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    CocoaSecurityResult *MainPassword_md5 = [CocoaSecurity md5:MainPassword_Trimmed];
    NSLog(@"MainPsssword MD5 = %@",MainPassword_md5.hex);
    if ([[[FMDBAPI alloc] init]ChangeAccountSessionWithMainPassword:MainPassword_md5.hex])
    {
        NSLog(@"IntroAnimator : IntroSetPassword Complete.");
    }
    if ([[[FMDBAPI alloc] init]ChangeAppSettingsWithIsFirstOpen:[NSNumber numberWithInt:0]])
    {
        NSLog(@"IntroAnimator : IntroSetIsFirstOpen Complete.");
    }
    [self dismissViewControllerAnimated:YES completion:^(void){}];
}


- (void)configureScrollViewAnimations
{
    // change the scrollView's background color for each page
    /*
     IFTTTColorAnimation *backgroundColorAnimation = [IFTTTColorAnimation animationWithView:self.scrollView];
     [backgroundColorAnimation addKeyframeForTime:0 color:[[UIColor colorWithRed:38.0/255.0 green:172.0/255.0 blue:255.0/255.0 alpha:1.0f] colorWithAlphaComponent:1.0f]];
     [backgroundColorAnimation addKeyframeForTime:1 color:[[UIColor colorWithRed:38.0/255.0 green:172.0/255.0 blue:255.0/255.0 alpha:1.0f] colorWithAlphaComponent:1.0f]];
     [backgroundColorAnimation addKeyframeForTime:2 color:[[UIColor colorWithRed:38.0/255.0 green:172.0/255.0 blue:255.0/255.0 alpha:1.0f] colorWithAlphaComponent:1.0f]];
     [self.animator addAnimation:backgroundColorAnimation];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
