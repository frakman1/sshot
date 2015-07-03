#line 1 "Tweak.xm"


@interface SpringBoard : UIApplication
@end

extern "C" UIImage* _UICreateScreenUIImage();
extern "C" UIImage* _imageScaledToSize();



#include <logos/logos.h>
#include <substrate.h>
@class SpringBoard; 
static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(SpringBoard*, SEL, id); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(SpringBoard*, SEL, id); static void _logos_method$_ungrouped$SpringBoard$myTick$(SpringBoard*, SEL, NSTimer *); 

#line 11 "Tweak.xm"



static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(SpringBoard* self, SEL _cmd, id application) {
	
	NSLog(@"-[<SpringBoard: %p> applicationDidFinishLaunching:%@]", self, application);
	NSLog(@"**********************************************************************************");
	NSLog(@"****************************************** SUCCESS *******************************");
	NSLog(@"**********************************************************************************");
	
	_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$(self, _cmd, application);
	
	[NSTimer scheduledTimerWithTimeInterval: 1 target: self selector:@selector(myTick:) userInfo: nil repeats:YES];
	

}




static void _logos_method$_ungrouped$SpringBoard$myTick$(SpringBoard* self, SEL _cmd, NSTimer * timer) {
	NSLog(@"-[<SpringBoard: %p> myTick:%@]", self, timer);
	NSLog(@"**********************************************************************************");
	NSLog(@"****************************************** TICK **********************************");
	NSLog(@"**********************************************************************************");

	
 	UIImage *screenshot = _UICreateScreenUIImage();	
   
   
    
	
    
    
    
	
	
	UIImage* newIcon= [screenshot resizedImage:CGSizeMake(30,30) interpolationQuality:kCGInterpolationMedium ];
	
	
	
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *filePath = [NSString stringWithFormat:@"%@/sshot_tick.png", documentsDirectory];
    NSData* theImageData = UIImagePNGRepresentation(screenshot); 
    [theImageData writeToFile:filePath atomically:YES];
	
	
	NSString *filePath2 = [NSString stringWithFormat:@"%@/sshot_tick_icon.png", documentsDirectory];
    NSData* theImageData2 = UIImagePNGRepresentation(newIcon); 
    [theImageData2 writeToFile:filePath2 atomically:YES];
	
	
	NSLog(@"finished writing tick images to :%@",filePath);
	
	
	
    
    
	
	
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSTimer *), strlen(@encode(NSTimer *))); i += strlen(@encode(NSTimer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(myTick:), (IMP)&_logos_method$_ungrouped$SpringBoard$myTick$, _typeEncoding); }} }
#line 76 "Tweak.xm"
