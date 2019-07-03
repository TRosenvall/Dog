//
//  SubBreedController.h
//  IThinkYouDroppedYourUpDog
//
//  Created by Timothy Rosenvall on 7/3/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubBreedController : NSObject



+(void)fetchSubBreedImagePathsWithBreed:(NSString *)breed subBreed:(NSString *)subBreed completion:(void (^)(NSArray *))completion;

+(void)fetchSubBreedImagesWithimagePaths:(NSString *)imagePath completion:(void(^) (UIImage*))completion;

@end

