//
//  UIImageView+CircularProgressView.h
//  
//
//  Created by Nik Kov on 13.09.16.
//  Copyright © 2016 Nik Kov. All rights reserved.
//

#import "CircularProgressViewSettings.h"
#import "LinearProgressViewSettings.h"
#import <DACircularProgress/DACircularProgressView.h>
#import <SDWebImage/UIImageView+WebCache.h>


typedef enum : NSUInteger {
    LinearPV = 1,
    CircularPV,
} ProgressViewType;

typedef SDImageLoaderProgressBlock SDWebImageDownloaderProgressBlock;

@protocol ProgressViewDataSource <NSObject>

@optional
- (LinearProgressViewSettings *)setupLinearProgressViewSettings;
- (CircularProgressViewSettings *)setupCircularProgressViewSettings;

@end


@interface UIImageView (CircularProgressView)

#pragma mark - Progress view settings
/** Delegate to customize your ProgressView if you had choosen one from ProgressViewType.
 * @param Delegate that responds to <ProgressViewDataSource> protocol
 */
- (void)nkvSetProgressViewDataSource:(id <ProgressViewDataSource>)nkvDataSource;

#pragma mark - Image setting methods
- (void)nkv_setImageWithURL:(NSURL *)url usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView;
- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView;
- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView;
- (void)nkv_setImageWithURL:(NSURL *)url completed:(SDExternalCompletionBlock)completedBlock usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView;
- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDExternalCompletionBlock)completedBlock usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView;
- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDExternalCompletionBlock)completedBlock usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView;
- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDExternalCompletionBlock)completedBlock usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView;

- (void)removeProgressView;


@end

