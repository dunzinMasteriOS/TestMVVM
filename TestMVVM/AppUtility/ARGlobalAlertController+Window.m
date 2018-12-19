//
//  ARGlobalAlertController+Window.m
//  Asif Raza Codes
//
//  Created by Asif Raza on 30/05/17.
//  Copyright © 2017 Asif Raza. All rights reserved.
//

#import "ARGlobalAlertController+Window.h"
#import <objc/runtime.h>

@interface UIAlertController (Private)

@property (nonatomic, strong) UIWindow *alertWindow;

@end

@implementation UIAlertController (Private)

@dynamic alertWindow;

- (void)setAlertWindow:(UIWindow *)alertWindow {
    objc_setAssociatedObject(self, @selector(alertWindow), alertWindow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIWindow *)alertWindow {
    return objc_getAssociatedObject(self, @selector(alertWindow));
}

@end

@implementation UIAlertController (Window)

- (void)show {
    [self show:YES];
}

- (void)show:(BOOL)animated {
    self.alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.alertWindow.rootViewController = [[UIViewController alloc] init];
    self.alertWindow.windowLevel = UIWindowLevelAlert + 1;
    [self.alertWindow makeKeyAndVisible];
    [self.alertWindow.rootViewController presentViewController:self animated:animated completion:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // precaution to insure window gets destroyed
    self.alertWindow.hidden = YES;
    self.alertWindow = nil;
}

#pragma mark - Shared Instance

+ (instancetype)sharedInstance
{
    static ARGlobalAlertController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (id) init
{
    if(self = [super init]) {}
    return self;
}

#pragma mark - Show Alert

- (instancetype)showAlertWithTitle:(NSString *)title
                           message:(nullable NSString *)message {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:nil destructiveButtonTitle:nil otherTitles:nil preferredStyle:ARGlobalAlertControllerStyleAlert handler:nil];
    [alert show];
    
    return alert;
}

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelButtonTitle {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:nil otherTitles:nil preferredStyle:ARGlobalAlertControllerStyleAlert handler:nil];
    [alert show];
    
    return alert;
}

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                       otherTitles:(nullable NSArray <NSString *>*)actionTitles
                           handler:(nullable HandlerBlock)handlerBlock {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:nil destructiveButtonTitle:nil otherTitles:actionTitles preferredStyle:ARGlobalAlertControllerStyleAlert handler:^(NSString * _Nullable tappedButtonTitle) {
        handlerBlock(tappedButtonTitle);
    }];
    [alert show];
    
    return alert;
}

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                       otherTitles:(nullable NSArray <NSString *>*)actionTitles
                           handler:(nullable HandlerBlock)handlerBlock {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:nil otherTitles:actionTitles preferredStyle:ARGlobalAlertControllerStyleAlert handler:^(NSString * _Nullable tappedButtonTitle) {
        handlerBlock(tappedButtonTitle);
    }];
    [alert show];
    
    return alert;
}

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                       otherTitles:(nullable NSArray <NSString *>*)actionTitles
                    preferredStyle:(ARGlobalAlertControllerStyle)preferredStyle
                           handler:(nullable HandlerBlock)handlerBlock {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:nil otherTitles:actionTitles preferredStyle:preferredStyle handler:^(NSString * _Nullable tappedButtonTitle) {
        handlerBlock(tappedButtonTitle);
    }];
    [alert show];
    
    return alert;
}

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                  autoHideDuration:(NSInteger)autoHideDuration {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:nil destructiveButtonTitle:nil otherTitles:nil preferredStyle:ARGlobalAlertControllerStyleAlert handler:nil];
    [alert show];
    
    [self hideAlert:alert afterDuration:autoHideDuration];
    
    return alert;
}
    
- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                  autoHideDuration:(NSInteger)autoHideDuration {
    
    UIAlertController *alert = [self alertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:nil otherTitles:nil preferredStyle:ARGlobalAlertControllerStyleAlert handler:nil];
    [alert show];
    
    [self hideAlert:alert afterDuration:autoHideDuration];
    
    return alert;
}

#pragma mark - Hide Alert

- (void) hideAlert:(ARGlobalAlertController *)alert {
    [self hideAlert:alert afterDuration:0];
}

- (void) hideAlert:(ARGlobalAlertController *)alert afterDuration:(NSInteger)duration {
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [alert dismissViewControllerAnimated:YES completion:nil];
    });
}

#pragma mark - Alert Initialization

- (instancetype)alertWithTitle:(nullable NSString *)title
                       message:(nullable NSString *)message
             cancelButtonTitle:(nullable NSString *)cancelButtonTitle
        destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
                   otherTitles:(nullable NSArray <NSString *>*)actionTitles
                preferredStyle:(ARGlobalAlertControllerStyle)preferredStyle
                       handler:(nullable HandlerBlock)handlerBlock {
    
    ARGlobalAlertController *alert = [ARGlobalAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyle)preferredStyle];
    
    if(actionTitles.count > 0)
        for (NSString *actionTitle in actionTitles)
            if(actionTitle)
                [alert addAction:[ARGlobalAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(ARGlobalAlertAction * _Nonnull action) {
                    if (handlerBlock) handlerBlock(actionTitle);
                }]];
    
    if(destructiveButtonTitle)
        [alert addAction:[UIAlertAction actionWithTitle:destructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (handlerBlock) handlerBlock(destructiveButtonTitle);
        }]];
    
    if(cancelButtonTitle)
        [alert addAction:[UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
            if (handlerBlock) handlerBlock(cancelButtonTitle);
        }]];
    
    return alert;
}

@end
