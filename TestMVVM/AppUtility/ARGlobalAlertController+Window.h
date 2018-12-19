//
//  ARGlobalAlertController+Window.h
//  Asif Raza Codes
//
//  Created by Asif Raza on 30/05/17.
//  Copyright © 2017 Asif Raza. All rights reserved.
//

@import UIKit;

typedef UIAlertController ARGlobalAlertController;
typedef UIAlertAction ARGlobalAlertAction;

NS_ASSUME_NONNULL_BEGIN

typedef void(^HandlerBlock)(NSString * _Nullable tappedButtonTitle);

typedef NS_ENUM(NSInteger, ARGlobalAlertActionStyle) {
    ARGlobalAlertActionStyleDefault = 0,
    ARGlobalAlertActionStyleCancel,
    ARGlobalAlertActionStyleDestructive
};

typedef NS_ENUM(NSInteger, ARGlobalAlertControllerStyle) {
    ARGlobalAlertControllerStyleActionSheet = 0,
    ARGlobalAlertControllerStyleAlert
};

@interface UIAlertController (Window)

- (void)show;
- (void)show:(BOOL)animated;

#pragma mark - Shared Instance

+ (instancetype)sharedInstance;

#pragma mark - Show Alert

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message;

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelButtonTitle;

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                       otherTitles:(nullable NSArray <NSString *>*)actionTitles
                           handler:(nullable HandlerBlock)handlerBlock;

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                       otherTitles:(nullable NSArray <NSString *>*)actionTitles
                           handler:(nullable HandlerBlock)handlerBlock;

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                       otherTitles:(nullable NSArray <NSString *>*)actionTitles
                    preferredStyle:(ARGlobalAlertControllerStyle)preferredStyle
                           handler:(nullable HandlerBlock)handlerBlock;

- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                  autoHideDuration:(NSInteger)autoHideDuration;
    
- (instancetype)showAlertWithTitle:(nullable NSString *)title
                           message:(nullable NSString *)message
                 cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                  autoHideDuration:(NSInteger)autoHideDuration;

#pragma mark - Hide Alert

- (void) hideAlert:(ARGlobalAlertController *)alert;
- (void) hideAlert:(ARGlobalAlertController *)alert afterDuration:(NSInteger)duration;


@end

NS_ASSUME_NONNULL_END
