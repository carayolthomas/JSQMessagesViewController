//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "JSQMessagesToolbarButtonFactory.h"

#import "UIColor+JSQMessages.h"
#import "UIImage+JSQMessages.h"
#import "NSBundle+JSQMessages.h"


@implementation JSQMessagesToolbarButtonFactory

+ (UIButton *)defaultAccessoryButtonItemWithImage:(UIImage *)pImage
{
    UIImage *accessoryImage = pImage;
    UIImage *normalImage = [accessoryImage jsq_imageMaskedWithColor:[UIColor colorWithRed:193/255.0f green:46/255.0f blue:64/255.0f alpha:1.0f]];
    UIImage *highlightedImage = [accessoryImage jsq_imageMaskedWithColor:[UIColor colorWithRed:193/255.0f green:46/255.0f blue:64/255.0f alpha:1.0f]];

    UIButton *accessoryButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, accessoryImage.size.width, 32.0f)];
    [accessoryButton setImage:normalImage forState:UIControlStateNormal];
    [accessoryButton setImage:highlightedImage forState:UIControlStateHighlighted];

    accessoryButton.contentMode = UIViewContentModeScaleAspectFit;
    accessoryButton.backgroundColor = [UIColor clearColor];
    accessoryButton.tintColor = [UIColor colorWithRed:193/255.0f green:46/255.0f blue:64/255.0f alpha:1.0f];

    return accessoryButton;
}

+ (UIButton *)defaultSendButtonItem
{
    NSString *sendTitle = [NSBundle jsq_localizedStringForKey:@"send"];

    UIButton *sendButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [sendButton setTitle:sendTitle forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor colorWithRed:193/255.0f green:46/255.0f blue:64/255.0f alpha:1.0f];
    [sendButton setTitleColor:[UIColor colorWithRed:193/255.0f green:46/255.0f blue:64/255.0f alpha:1.0f] forState:UIControlStateHighlighted];
    [sendButton setTitleColor:[UIColor colorWithRed:187/255.0f green:188/255.0f blue:188/255.0f alpha:1.0f] forState:UIControlStateDisabled];

    sendButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16.f];
    sendButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    sendButton.titleLabel.minimumScaleFactor = 0.85f;
    sendButton.contentMode = UIViewContentModeCenter;
    sendButton.backgroundColor = [UIColor clearColor];
    sendButton.tintColor = [UIColor colorWithRed:193/255.0f green:46/255.0f blue:64/255.0f alpha:1.0f];

    CGFloat maxHeight = 32.0f;

    CGRect sendTitleRect = [sendTitle boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, maxHeight)
                                                   options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                attributes:@{ NSFontAttributeName : sendButton.titleLabel.font }
                                                   context:nil];

    sendButton.frame = CGRectMake(0.0f,
                                  0.0f,
                                  CGRectGetWidth(CGRectIntegral(sendTitleRect)),
                                  maxHeight);

    return sendButton;
}

@end
