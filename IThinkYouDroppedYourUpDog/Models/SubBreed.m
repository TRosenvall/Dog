//
//  SubBreed.m
//  IThinkYouDroppedYourUpDog
//
//  Created by Timothy Rosenvall on 7/3/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import "SubBreed.h"
#import "SubBreedController.h"

@implementation SubBreed

- (instancetype)initWithSubBreed:(NSString *)name images:(NSArray *)images {
    self = [super init];
    if (self) {
        _name = name;
        _images = images;
    }
    return self;
}

@end

@implementation SubBreed (JSONConvertable)

+ (NSArray*)fetchFromDictionary:(NSDictionary *)dictionary {
    NSMutableArray *imagePlaceholder = [NSMutableArray new];
    NSMutableArray *subBreedArray = [NSMutableArray new];
    for (NSString *name in dictionary) {
        NSArray *subBreeds = dictionary[name];
        for (NSString *subBreedName in subBreeds) {
            [SubBreedController fetchSubBreedImagePathsWithBreed:name subBreed:subBreedName completion:^(NSArray *imagePathsArray) {
                for (NSString *imagePath in imagePathsArray) {
                    [SubBreedController fetchSubBreedImagesWithimagePaths:imagePath completion:^(UIImage *image) {
                        [imagePlaceholder addObject:image];
                    }];
                }
                SubBreed *subBreed = [[SubBreed alloc] initWithSubBreed:subBreedName images:imagePlaceholder];
                [subBreedArray addObject:subBreed];
            }];
        }
    }
    return subBreedArray;
}
@end
