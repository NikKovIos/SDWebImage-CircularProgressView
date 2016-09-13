//
//  LinearProgressViewSettings.h
//
//
//  Created by Nik Kov on 13.09.16.
//  Copyright © 2016 Nik Kov. All rights reserved.
//

@interface LinearProgressViewSettings : NSObject

@property (nonatomic) float progress;
@property (nonatomic, strong) UIColor* progressTintColor;
@property (nonatomic, strong) UIColor* trackTintColor;
@property (nonatomic, strong) UIImage* progressImage;
@property (nonatomic, strong) UIImage* trackImage;

@end
