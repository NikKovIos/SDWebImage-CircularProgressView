# SDWebImage-CircularProgressView
###by Nik Kov

 
Good day everybody!)
This is a category to SDWebImage that offer you to implement ProgressView in three ways:
- Circular
- Linear
- Custom

## • SCREENSHOTS

## • Installation

## • Code examples

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
