//
// cocos2d Hello World example
// http://www.cocos2d-iphone.org
//

// IMPORTANT:
//  This example ONLY shows the basic steps to render a label on the screen.
//  Some advanced options regarding the initialization were removed to simplify the sample.
//  Once you understand this example, read "HelloActions" sample.

// Needed for UIWindow, NSAutoReleasePool, and other objects
#import <UIKit/UIKit.h>

// Import the interfaces
#import "HelloWorld.h"

// HelloWorld implementation
@implementation HelloWorld

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		// create and initialize a Label
		CCLabel* label = [CCLabel labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end

//
// Application Delegate implementation.
// Probably all your games will have a similar Application Delegate.
// For the moment it's not that important if you don't understand the following code.
//
@implementation AppController

// window is a property. @synthesize will create the accesors methods
@synthesize window;

// Application entry point
- (void) applicationDidFinishLaunching:(UIApplication*)application
{
	// CC_DIRECTOR_INIT()
	//
	// 1. Initializes an EAGLView with 0-bit depth format, and RGB565 render buffer
	// 2. EAGLView multiple touches: disabled
	// 3. Parents EAGLView to the main window
	// 4. Creates Display Link Director
	// 4a. If it fails, it will use an NSTimer director
	// 5. It will try to run at 60 FPS
	// 6. Display FPS: NO
	// 7. Device orientation: Portrait
	// 8. Connects the director to the EAGLView
	//
	CC_DIRECTOR_INIT();
	
	// Obtain the shared director in order to...
	CCDirector *director = [CCDirector sharedDirector];
	
	// Sets landscape mode
	[director setDeviceOrientation:kCCDeviceOrientationLandscapeLeft];
	
	// Turn on display FPS
	[director setDisplayFPS:YES];
	
	// Set multiple touches on
	EAGLView *glView = [director openGLView];
	[glView setMultipleTouchEnabled:YES];	
	
	// Create and initialize parent and empty Scene
	CCScene *scene = [CCScene node];

	// Create and initialize our HelloWorld Layer
	CCLayer *layer = [HelloWorld node];
	// add our HelloWorld Layer as a child of the main scene
	[scene addChild:layer];

	// Run!
	[director runWithScene: scene];
}

- (void) dealloc
{
	[window release];
	[super dealloc];
}

@end


//
// main entry point. Like any c or c++ program, the "main" is the entry point
//
int main(int argc, char *argv[]) {
	// it is safe to leave these lines as they are.
	NSAutoreleasePool *pool = [NSAutoreleasePool new];
	UIApplicationMain(argc, argv, nil, @"AppController");
	[pool release];
	return 0;
}

