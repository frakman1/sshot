//#import <SpringBoard/SpringBoard.h>\
//#import <LIFXKit/LIFXKit.h>

@interface SpringBoard : UIApplication
@end

extern "C" UIImage* _UICreateScreenUIImage();
extern "C" UIImage* _imageScaledToSize();



%hook SpringBoard


-(void)applicationDidFinishLaunching:(id)application {
	
	%log;
	NSLog(@"**********************************************************************************");
	NSLog(@"****************************************** SUCCESS *******************************");
	NSLog(@"**********************************************************************************");
	
	%orig;
	
	[NSTimer scheduledTimerWithTimeInterval: 1 target: self selector:@selector(myTick:) userInfo: nil repeats:YES];
	

}


%new
-(void)myTick:(NSTimer *)timer
{
	%log;
	NSLog(@"**********************************************************************************");
	NSLog(@"****************************************** TICK **********************************");
	NSLog(@"**********************************************************************************");

	
 	UIImage *screenshot = _UICreateScreenUIImage();	
   
   // begin scale 
	CGSize newSize = CGSizeMake(30, 30);
	UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
	[screenshot drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
	UIImage *newIcon = UIGraphicsGetImageFromCurrentImageContext();    
	UIGraphicsEndImageContext();
	
	
	
	
	// end scale
	
	//save initial screenshot
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *filePath = [NSString stringWithFormat:@"%@/sshot_tick.png", documentsDirectory];
	NSData* theImageData = UIImagePNGRepresentation(screenshot); 
	[theImageData writeToFile:filePath atomically:YES];
	
	//save icon version
	NSString *filePath2 = [NSString stringWithFormat:@"%@/sshot_tick_icon.png", documentsDirectory];
	NSData* theImageData2 = UIImagePNGRepresentation(newIcon); 
	[theImageData2 writeToFile:filePath2 atomically:YES];
	
	
	NSLog(@"finished writing tick images to :%@",filePath);
	
	
	
	//LFXNetworkContext *localNetworkContext = [[LFXClient sharedClient] localNetworkContext];
	//[localNetworkContext.allLightsCollection setPowerState:LFXPowerStateOff];
	
	
}

%end