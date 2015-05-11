# DetectBGDarkOrLight
Objective C Sample Code that check the UIImage's area light or dark (like check grey spot on DSLR).

To use code. Just drag "ImageLightMeter.h" and "ImageLightMeter.m" into your Xcode project.

Example Code...

```
// .h file 
@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imgBackground;
@property (strong, nonatomic) IBOutlet UILabel *lblTop;

@end
```
```
// .m file
#import "ImageLightMeter.h"

- (void)viewDidLoad {
    
    [super viewDidLoad];

	ImageLightMeter * meter = [[ImageLightMeter alloc] initWithImage:self.imgBackground.image];
    
	if ([meter imageIsLightForImage:self.imgBackground.image
    	                  fromPoint:CGPointMake(_lblTop.frame.origin.x, _lblTop.frame.origin.y)
        	                toPoint:CGPointMake(_lblTop.frame.origin.x + _lblTop.frame.size.width,
            	                                _lblTop.frame.origin.y + _lblTop.frame.size.height)])
	{
    	_lblTop.textColor = [UIColor blackColor];
	} else
	    _lblTop.textColor = [UIColor whiteColor];
}
```

Try to change background images to see the label's textcolor changed. And also changes the Threshold variables to judge the background should be dark or light.

##References

How to get RGB values from UIColor?
http://stackoverflow.com/questions/437113/how-to-get-rgb-values-from-uicolor

How can I convert to grayscale?
http://iphonedevsdk.com/forum/iphone-sdk-development/97172-uicolor-how-can-i-convert-to-grayscale.html

UIColor+Grayscale
https://gist.github.com/cwagdev/6138534#

get pixel RGB of UIcolor data from a UIImage or CGImage on CGPoint
https://sites.google.com/site/gangeshwardev/ios-library/get-pixel-rgb-or-uicolor-data-from-a-uiimage-or-cgimage-on-cgpoint

How i count red color pixel from the UIImage using objective-C in iphone?
http://stackoverflow.com/questions/2342327/how-i-count-red-color-pixel-from-the-uiimage-using-objective-c-in-iphone
