# SDWebImage-CircularProgressView
###by Nik Kov

 
Good day everybody!)  

This is a category to SDWebImage that offer you to add ProgressView in three ways:
- Circular (using [DACircularProgress](https://github.com/danielamitay/DACircularProgress))
- Linear
- Custom  

Images are downloaded using SDWebImage (3.7.0 and up)

## SCREENSHOTS

## Installation
[Cocoapods](http://cocoapods.org):
```
pod 'SDWebImage-CircularProgressView'
```
## Code examples
There are two parameters and unique prefix to easier finding. 
- `progressViewType` - LinearPV or CircularPV. Choose the type of Progress View.
- `progressView` - If you init your own UIProgressView than put it there. It should be a class or subclass of UIProgressView.
```
- (void)nkv_setImageWithURL:(NSURL *)url usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView;
- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView;
- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView;
- (void)nkv_setImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView;
- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView;
- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView;
- (void)nkv_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock usingProgressViewType:(ProgressViewType)progressViewType orCustomProgressView:(UIProgressView *)progressView;
```
#### cancelCurrentImageLoad
If you're using the `sd_cancelCurrentImageLoad method`, you'll also have to call removeProgressView.
```
- (void)prepareForReuse {
    [super prepareForReuse];
    [self.imageView sd_cancelCurrentImageLoad];
    [self.imageView removeProgressView];
}
```

#### Customize UIProgressView by DataSource methods
1. `#import "UIImageView+CircularProgressView.h"`
2. `@interface NKVTableCell () <ProgressViewDataSource>`
3. `[self.bodyImageV nkvSetProgressViewDataSource:self];`
4. `[self.bodyImageV nkv_setImageWithURL:url usingProgressViewType:CircularPV orCustomProgressView:nil];`
5. In self (DataSource's class) implement method:
```
- (CircularProgressViewSettings *)setupCircularProgressViewSettings
{
    CircularProgressViewSettings *circularSettings = [CircularProgressViewSettings new];
    circularSettings.progressTintColor = [UIColor redColor];
    circularSettings.thicknessRatio = 0.2;
    return circularSettings;
}
```
####Customize all UIProgressViews in app
```
[DACircularProgressView appearance].trackTintColor = [UIColor lightGrayColor];
[DACircularProgressView appearance].progressTintColor = [UIColor blackColor];
[UIProgressView appearance].trackTintColor = [UIColor lightGrayColor];
[UIProgressView appearance].progressTintColor = [UIColor blackColor];
```
##You should know
- It uses SDWebImage and DACircularProgress.
- CirclePV type implements transparent view by default. Use appearance in AppDelegate or somewhere else to customize it.
- Custom progress bar is a priority for other types. Otherwords if you choose `LinearPV` and then add `orCustomProgressView:(UIProgressView*)yourCustomProgressView` than it would be your custom ProgressView.

### References

Inspired by projects:
- https://github.com/kevinrenskers/SDWebImage-ProgressView
- https://github.com/danielamitay/DACircularProgress

#### TODO:
- [ ] Add http://shields.io/
- [ ] Add UIedgeInsets like property
- [ ] Think about default settings for CircleV
