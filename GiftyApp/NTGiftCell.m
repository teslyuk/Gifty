//
//  NTGiftCell.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 04.04.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTGiftCell.h"
#import "NTGift.h"

@implementation NTGiftCell

- (void)setGift:(NTGift *)gift {
    
    _captionLabel.text = _gift.caption;
    _imageView.image = _gift.image;
    
}

@end
