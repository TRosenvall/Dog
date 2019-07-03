//
//  Breed.m
//  IThinkYouDroppedYourUpDog
//
//  Created by Timothy Rosenvall on 7/3/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import "Breed.h"
#import "SubBreed.h"
#import "BreedController.h"

@implementation Breed

-(instancetype)initWithBreedName:(NSString*)name
                        subBreed:(NSArray*)subBreeds
                          images:(NSArray*)images {
    self = [super init];
    if (self) {
        _name = name;
        _subBreeds = subBreeds;
        _images = images;
    }
    return self;
}

@end

@implementation Breed (JSONConvertable)

-(NSArray*)fetchFromDictionary:(NSDictionary *)dictionary {
    NSMutableArray *imagePlaceholder;
    NSMutableArray *breedsPlaceholder;
    for (NSString *name in dictionary) {
        NSDictionary *breed = dictionary[name];
        NSArray *subBreeds = [SubBreed fetchFromDictionary:breed];
        [BreedController fetchBreedImagePathsWithBreed:name completion:^(NSArray *imagePathsArray) {
            for (NSString *imagePath in imagePathsArray) {
                [BreedController fetchBreedImagesWithimagePaths:imagePath completion:^(UIImage *image) {
                    [imagePlaceholder addObject:image];
                }];
            }
        }];
        [breedsPlaceholder addObject:[self initWithBreedName:name subBreed:subBreeds images:imagePlaceholder]];
    }
    return breedsPlaceholder;
}

@end
