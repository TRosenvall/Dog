//
//  SubBreed.h
//  IThinkYouDroppedYourUpDog
//
//  Created by Timothy Rosenvall on 7/3/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubBreed : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSArray *images;

-(instancetype)initWithSubBreed:(NSString*)name
                      images:(NSArray*)images;

@end

@interface SubBreed (JSONConvertable)

+(NSArray*)fetchFromDictionary:(NSDictionary*)dictionary;

@end
