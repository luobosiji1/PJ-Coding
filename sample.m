
@interface Person : NSObject<NSCoding>

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSNumber *age;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)CGFloat weight;
@end


#import "Person.h"
#import "Coding.h"
@implementation Person

-(NSArray *)ignoredName{
//The return value is not saved properties
    return @[@"_name",@"_age"];
}

//use CodingImpl Have to import Coding
CodingImpl
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Person *p =[Person new];
    
    p.name = @"haha";
    p.age = @18;
    p.height = 170;
    p.weight = 170;
    
    [NSKeyedArchiver archiveRootObject:p toFile:@"/Users/.../Desktop/Person.plist"];
    
    
    p =  [NSKeyedUnarchiver unarchiveObjectWithFile:@"Users/.../Desktop/Person.plist"];
    
    NSLog(@"%@,%@,%f,%f",p.name,p.age,p.height,p.weight);

    //The output
    //(null),(null),170.000000,170.000000
}

@end