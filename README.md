# PJ-Coding


Rapid archiving Solution file

 * Must be inherited NSObject class or subclass
 
 * Observe the ` < NSCoding > ` agreement
 
 * Will file into the project
 
 		 `NSObject+filing.h`
		 `NSObject+filing.m`
		 `PJCoding.h`
 
 * Import the header file `# import" Coding.h`
 
 * If you want to archive the classes and properties of the parent In the class implementation ` CodingSuperImpl `
 
 * If want to archive this class Then call ` CodingImpl `
 
 * If you want to ignore a property not to be archived A method is called Return is not archiving properties
 
 		`-(NSArray *)ignoredName;`
 		
 		
 		
  ------
  
 

 * 必须是继承NSObject或子类的类
 
 * 遵守 `<NSCoding>`协议
 
 * 将文件拖入项目中
 
		 `NSObject+filing.h`
		 `NSObject+filing.m`
		 `PJCoding.h`
 
 * 导入头文件 
  	`#import "Coding.h"`
  	
 * 如果想归档本类和父类的属性 在该类实现中 `CodingSuperImpl`
 
 * 如果只想归档本类 那么 调用 `CodingImpl`
 
 * 如果想忽略某个属性不进行归档 调用方法 返回的是不进行归档的属性
 
  		`-(NSArray *)ignoredName;`


