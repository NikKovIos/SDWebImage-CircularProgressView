//
//  CircularProgressViewSettings.h
//
//
//  Created by Nik Kov on 13.09.16.
//  Copyright © 2016 Nik Kov. All rights reserved.
//

@interface CircularProgressViewSettings : NSObject

/// Color of background of a track
@property (nonatomic, strong) UIColor *trackTintColor;
/// Color of circle, that filling track
@property (nonatomic, strong) UIColor *progressTintColor;
/// Color of circle inside the progress view
@property (nonatomic, strong) UIColor *innerTintColor;
/// Rounded corner of progress. On/Off. Between 0 and 1.
@property (nonatomic) NSInteger roundedCorners;
/// Thickness of progress
@property (nonatomic) CGFloat thicknessRatio;
/// Сounterclockwise or clockwise filling. On/Off. Between 0 and 1.
@property (nonatomic) NSInteger clockwiseProgress;
/// Progress state
@property (nonatomic) CGFloat progress;

/// If you don't know the size of data. Speed.
@property (nonatomic) CGFloat indeterminateDuration;
/// If you don't know the size of data. On/Off. Between 0 and 1.
@property (nonatomic) NSInteger indeterminate;

@end
