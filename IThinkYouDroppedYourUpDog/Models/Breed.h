//
//  Breed.h
//  IThinkYouDroppedYourUpDog
//
//  Created by Timothy Rosenvall on 7/3/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Breed : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSArray* subBreeds;
@property (nonatomic, copy) NSArray* images;

-(instancetype)initWithBreedName:(NSString*)name
                        subBreed:(NSArray*)subBreeds
                          images:(NSArray*)images;

@end

@interface Breed (JSONConvertable)

-(NSArray*)fetchFromDictionary:(NSDictionary *)dictionary;

@end
