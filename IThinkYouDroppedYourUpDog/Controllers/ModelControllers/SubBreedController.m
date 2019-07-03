//
//  SubBreedController.m
//  IThinkYouDroppedYourUpDog
//
//  Created by Timothy Rosenvall on 7/3/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import "SubBreedController.h"

@implementation SubBreedController




+(void)fetchSubBreedImagePathsWithBreed:(NSString *)breed subBreed:(NSString *)subBreed completion:(void (^)(NSArray *))completion {
    
    NSURL *url = [NSURL URLWithString:@"https://dog.ceo/api/breed"];
    NSURL *finalURL = [[[url URLByAppendingPathComponent:breed]URLByAppendingPathComponent:subBreed]URLByAppendingPathComponent:@"images"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error with url, %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (response) {
            NSLog(@"%@", response);
        }
        
        if (data) {
            NSDictionary *messageDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            NSArray *imagePaths = messageDictionary[@"messages"];
            completion(imagePaths);
            return;
        }
    }]resume];
}

+(void)fetchSubBreedImagesWithimagePaths:(NSString *)imagePath completion:(void(^) (UIImage*))completion {
    NSURL *url = [NSURL URLWithString:imagePath];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error with url, %@", error.localizedDescription);
        }
        
        if (response) {
            NSLog(@"%@", response);
        }
        
        if (data) {
            UIImage *image = [[UIImage alloc] initWithData:data];
            completion(image);
            return;
        }
    }]resume];
}

@end
