# SDWebImage-CircularProgressView
###by Nik Kov

 
Good day everybody!)
This is a category to SDWebImage that offer you to implement ProgressView in three ways:
- Circular (using [DACircularProgress](https://github.com/danielamitay/DACircularProgress))
- Linear
- Custom

## • SCREENSHOTS

## • Installation
[Cocoapods](http://cocoapods.org):
```ruby
pod 'SDWebImage-CircularProgressView'
```
## • Code examples
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
If you're using the sd_cancelCurrentImageLoad method, you'll also have to call removeProgressView.
```
- (void)prepareForReuse {
    [super prepareForReuse];
    [self.imageView sd_cancelCurrentImageLoad];
    [self.imageView removeProgressView];
}
```
###You should know
- It uses SDWebImage and DACircularProgress.
- Custom progress bar is a priority for other types. Otherwords if you choose `LinearPV` and then add `orCustomProgressView:(UIProgressView*)yourCustomProgressView` than it would be your custom ProgressView.

### References

Inspired by projects:
- https://github.com/kevinrenskers/SDWebImage-ProgressView
- https://github.com/danielamitay/DACircularProgress

#### TODO:
