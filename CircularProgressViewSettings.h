//
//  CircularProgressViewSettings.h
//
//
//  Created by Nik Kov on 13.09.16.
//  Copyright © 2016 Nik Kov. All rights reserved.
//

@interface CircularProgressViewSettings : NSObject

@property(nonatomic, strong) UIColor *trackTintColor;
@property(nonatomic, strong) UIColor *progressTintColor;
@property(nonatomic, strong) UIColor *innerTintColor;
@property(nonatomic) NSInteger roundedCorners;
@property(nonatomic) CGFloat thicknessRatio;
@property(nonatomic) NSInteger clockwiseProgress;
@property(nonatomic) CGFloat progress;
@property(nonatomic) CGFloat indeterminateDuration;
@property(nonatomic) NSInteger indeterminate;

@end
