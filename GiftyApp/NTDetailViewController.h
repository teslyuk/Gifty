//
//  NTDetailViewController.h
//  GiftyApp
//
//  Created by Nikita Teslyuk on 26.04.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTGift.h"

@interface NTDetailViewController : UIViewController

@property (strong, nonatomic) NTGift *gift;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
