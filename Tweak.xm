//#import <SpringBoard/SpringBoard.h>

@interface SpringBoard : UIApplication
@end

extern "C" UIImage* _UICreateScreenUIImage();



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
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *filePath = [NSString stringWithFormat:@"%@/sshot_tick.png", documentsDirectory];
    NSData* theImageData = UIImagePNGRepresentation(screenshot ); 
    [theImageData writeToFile:filePath atomically:YES];
	
	NSLog(@"finished writing tick image to :%@",filePath);
	
	
	
    //LFXNetworkContext *localNetworkContext = [[LFXClient sharedClient] localNetworkContext];
    //[localNetworkContext.allLightsCollection setPowerState:LFXPowerStateOff];
	
	
}

%end