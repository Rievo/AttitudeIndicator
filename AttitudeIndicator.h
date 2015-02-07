//
//  AttitudeIndicator.m
//  Created by Rievo
//

#import <UIKit/UIKit.h>

@interface AttitudeIndicator : UIView{
    
    /*!
     @brief New height of the horizon
     */
    float newHeight;
}



/*!
 @brief Pitch
 */
@property int currentPitch;

/*!
 @brief Roll
 */
@property int currentRoll;



/*!
 * @discussion This method re-display the view, with "currentPitch" and "curentRoll"
 * @return void
 */
-(void) updateHorizon;


@end
