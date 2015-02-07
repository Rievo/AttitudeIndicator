//
//  AttitudeIndicator.m
//  Created by Rievo
//

#import "AttitudeIndicator.h"

#define BORDER_WIDTH 0.000000001
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)


@implementation AttitudeIndicator
@synthesize currentPitch, currentRoll;





- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        [self setBackgroundColor:[UIColor clearColor]];

        newHeight = 100;
        currentPitch = 0;
        currentRoll = 0;
    }
    return self;
}




- (void)drawRect:(CGRect)rect
{
    UIBezierPath * path ;
    
    float radius = self.frame.size.width/2;
    
    if(newHeight < 0)
        newHeight = 0.1;
    
    if(newHeight >= self.frame.size.height)
        newHeight = self.frame.size.height -0.1;

    double temp = (newHeight - radius) / radius; 
    
    if(temp > 1)
        temp = 1;
    
    if(temp < -1)
        temp = -1;
    
    double angle = asin(temp); /* radians */
    
    

    

    /* Upper semicircle*/
    
    /* + angle - angle*/
    
    path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width /2, self.frame.size.height /2) 
                                          radius:self.frame.size.height /2
                                      startAngle: M_PI - angle -DEGREES_TO_RADIANS(currentRoll) 
                                        endAngle:angle - DEGREES_TO_RADIANS(currentRoll) 
                                       clockwise:YES];
    [[UIColor blackColor]setStroke];
    [[UIColor blueColor] setFill];

    path.lineWidth = 0.5;
    
    [path fill];
    [path stroke];
    
    /* Lower semicircle*/
    
    UIBezierPath * pathBr ;
    
    /* +angle - angle*/
    pathBr = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width /2, self.frame.size.height /2) 
                                          radius:self.frame.size.height /2
                                      startAngle: M_PI - angle -DEGREES_TO_RADIANS(currentRoll) 
                                        endAngle:+angle - DEGREES_TO_RADIANS(currentRoll) 
                                       clockwise:NO];
    [[UIColor blackColor]setStroke];
    [[UIColor brownColor] setFill];
    
    pathBr.lineWidth = 0.5;
    
    [pathBr fill];
    [pathBr stroke];
    
    

    
    /* Central Axis*/
    UIBezierPath * axis = [[UIBezierPath alloc] init];
    [axis moveToPoint:CGPointMake(0, self.frame.size.height /2)];
    [axis addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height/2)];
    [axis moveToPoint:CGPointMake(self.frame.size.width /2, 0)];
    [axis addLineToPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height)];
    [[UIColor blackColor] setStroke];
    //[axis setLineWidth:3.0];
    //CGFloat dashes[] = {20, 20};
    //[path setLineDash:dashes count:2 phase:0];
    [axis stroke];
    
    
}


-(void) updateHorizon{
    /* Pitch */
    newHeight = 0.0;
    
    if(currentPitch >= 0 && currentPitch <= 90){
        newHeight = (currentPitch * self.bounds.size.height) /90 + (self.bounds.size.height /2 );
    }else if(currentPitch >= 270 && currentPitch <= 360){
        newHeight = ((currentPitch - 270) * self.bounds.size.height/90) - self.bounds.size.height/2;
    }else if(currentPitch >= 91 && currentPitch <180){
        newHeight = self.bounds.size.height;
    }else if(currentPitch >= 180 && currentPitch <270){
        newHeight = 0;
    }
        
    [self display];
    
}


@end
