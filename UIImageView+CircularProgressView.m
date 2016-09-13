//
//  UIImageView+CircularProgressView.m
// 
//
//  Created by Nik Kov on 13.09.16.
//  Copyright © 2016 Nik Kov. All rights reserved.
//

#import "UIImageView+CircularProgressView.h"

#define TAG_PROGRESS_VIEW 777333777

@implementation UIImageView (CircularProgressView)

id <ProgressViewDataSource> dataSource;

#pragma mark - Custom ProgressView
- (void)addCustomProgressView:(UIProgressView *)customProgressView
{
    UIProgressView *existingProgressView = (UIProgressView *)[self viewWithTag:TAG_PROGRESS_VIEW];
    
    if ( ! existingProgressView)
    {
        [self setupFrameAndAttributesForProgressView:customProgressView];
        [self addSubview:customProgressView];
    }
}

#pragma mark - Linear ProgressView
- (void)addLinearProgressView
{
    UIProgressView *existingProgressView = (UIProgressView *)[self viewWithTag:TAG_PROGRESS_VIEW];
    
    if ( ! existingProgressView)
    {
        UIProgressView *linearProgressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        [self setupFrameAndAttributesForProgressView:linearProgressView];

        if ( dataSource )
        {
            if ( [dataSource respondsToSelector:@selector(setupLinearProgressViewSettings)] )
            {
                LinearProgressViewSettings *settings = [dataSource setupLinearProgressViewSettings];
                if ( ! settings )
                    NSLog(@"Please, be sure, you are returning something in <setupLinearProgressViewSettings> method in your Data Source.");
                else
                {
                    linearProgressView.progress = settings.progress;
                    linearProgressView.progressTintColor = settings.progressTintColor;
                    linearProgressView.trackTintColor = settings.trackTintColor;
                    linearProgressView.progressImage = settings.progressImage;
                    linearProgressView.trackImage = settings.trackImage;
                }
            }
            else
                NSLog(@"Please, implement <setupLinearProgressViewSettings> method in your Data Source.");
        }
    
        [self addSubview:linearProgressView];
    }
}

#pragma mark - Circular ProgressView

- (void)addCircularProgressView
{
    DACircularProgressView *existingProgressView = (DACircularProgressView *)[self viewWithTag:TAG_PROGRESS_VIEW];
    
    if ( ! existingProgressView)
    {
        DACircularProgressView *circularProgressView = [[DACircularProgressView alloc] init];
        [self setupFrameAndAttributesForProgressView:circularProgressView];

        if ( dataSource )
        {
            if ( ! [dataSource respondsToSelector:@selector(setupCircularProgressViewSettings)] )
                NSLog(@"Please, implement <setupCircularProgressViewSettings> method in your Data Source.");
            else
            {
                CircularProgressViewSettings *settings = [dataSource setupCircularProgressViewSettings];
                if ( ! settings )
                    NSLog(@"Please, be sure, you are returning something in <setupCircularProgressViewSettings> method in your Data Source.");
                else
                {
                    circularProgressView.trackTintColor = settings.trackTintColor;
                    circularProgressView.progressTintColor = settings.progressTintColor;
                    circularProgressView.innerTintColor = settings.innerTintColor;
                    circularProgressView.roundedCorners = settings.roundedCorners;
                    circularProgressView.thicknessRatio = settings.thicknessRatio;
                    circularProgressView.clockwiseProgress = settings.clockwiseProgress;
                    circularProgressView.progress = settings.progress;
                    circularProgressView.indeterminateDuration = settings.indeterminateDuration;
                    circularProgressView.indeterminate = settings.indeterminate;
                }
            }
        }
    
        [self addSubview:circularProgressView];
    }
}

#pragma mark - Update and delete ProgressView

- (void)updateProgress:(CGFloat)progress
{
    UIProgressView *progressView = (UIProgressView *)[self viewWithTag:TAG_PROGRESS_VIEW];
    if (progressView)
        progressView.progress = progress;
}

- (void)removeProgressView
{
    UIView *progressView = [self viewWithTag:TAG_PROGRESS_VIEW];
    if (progressView)
        [progressView removeFromSuperview];
}

#pragma mark - Image setting methods

- (void)nkv_setImageWithURL:(NSURL *)url usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView
{
    [self nkv_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:nil usingProgressViewType:progressViewType orCustomProgressView:progressView];
}

- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView
{
    [self nkv_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:nil usingProgressViewType:progressViewType orCustomProgressView:progressView];
}

- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView
{
    [self nkv_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:nil usingProgressViewType:progressViewType orCustomProgressView:progressView];
}

- (void)nkv_setImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView
{
    [self nkv_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:completedBlock usingProgressViewType:progressViewType orCustomProgressView:progressView];
}

- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView
{
    [self nkv_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:completedBlock usingProgressViewType:progressViewType orCustomProgressView:progressView];
}

- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView
{
    [self nkv_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:completedBlock usingProgressViewType:progressViewType orCustomProgressView:progressView];
}

- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView
{
    if (progressView)
        [self addCustomProgressView:progressView];
    else
        switch (progressViewType)
    {
        case CircularPV:
        {
            [self addCircularProgressView];
            break;
        }
        case LinearPV:
        default:
        {
            [self addLinearProgressView];
            break;
        }
    }

    __weak typeof(self) weakSelf = self;
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        CGFloat progress = ((CGFloat)receivedSize / (CGFloat)expectedSize);
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf updateProgress:progress];
        });
        
        if (progressBlock)
            progressBlock(receivedSize, expectedSize);
    }
     
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       [weakSelf removeProgressView];
                       if (completedBlock)
                           completedBlock(image, error, cacheType, imageURL);
                   }];
}

#pragma mark - Accessors and Others

- (void)setupFrameAndAttributesForProgressView:(UIView*)view;
{
    view.tag = TAG_PROGRESS_VIEW;
    view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    
    float width = view.frame.size.width;
    float height = view.frame.size.height;
    float x = (self.frame.size.width / 2.0) - width / 2;
    float y = (self.frame.size.height / 2.0) - height / 2;
    view.frame = CGRectMake(x, y, width, height);
}

- (void)nkvSetProgressViewDataSource:(id<ProgressViewDataSource>)nkvDataSource
{
    dataSource = nkvDataSource;
}

@end

