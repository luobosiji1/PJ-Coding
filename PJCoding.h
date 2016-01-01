#import "NSObject+filing.h"

#define CodingSuperImpl \
- (instancetype)initWithCoder:(NSCoder *)coder\
{\
    self = [super init];\
    if (self) {\
        \
        [self superDecoder:coder];\
        \
    }\
    return self;\
}\
-(void)encodeWithCoder:(NSCoder *)aCoder{\
    \
    [self superEncode:aCoder];\
    \
}

#define CodingImpl \
- (instancetype)initWithCoder:(NSCoder *)coder\
{\
self = [super init];\
if (self) {\
\
[self decoder:coder];\
\
}\
return self;\
}\
-(void)encodeWithCoder:(NSCoder *)aCoder{\
\
[self encode:aCoder];\
\
}