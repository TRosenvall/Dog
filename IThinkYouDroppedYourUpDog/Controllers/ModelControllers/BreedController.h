//
//  BreedController.h
//  IThinkYouDroppedYourUpDog
//
//  Created by Timothy Rosenvall on 7/3/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BreedController : NSObject

+(void)fetchBreedImagePathsWithBreed:(NSString *)breed completion:(void (^)(NSArray *))completion;

+(void)fetchBreedImagesWithimagePaths:(NSString *)imagePath completion:(void(^) (UIImage*))completion;

@end

NS_ASSUME_NONNULL_END
