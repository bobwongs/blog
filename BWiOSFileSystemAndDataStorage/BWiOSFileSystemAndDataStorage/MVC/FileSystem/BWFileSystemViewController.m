//
//  BWFileSystemViewController.m
//  BWiOSFileSystemAndDataStorage
//
//  Created by BobWong on 2017/8/3.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWFileSystemViewController.h"

@interface BWFileSystemViewController ()

@end

@implementation BWFileSystemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults
}

- (IBAction)getDataFromBundleAction:(id)sender
{
    NSString *mainBundlePath = [NSBundle mainBundle].bundlePath;
    NSLog(@"mainBundlePath: %@", mainBundlePath);

    // 资源类型为目录下的Groups
    NSString *path0 = [[NSBundle mainBundle] pathForResource:@"temp0" ofType:@"txt"];
    NSLog(@"path0: %@", path0);
    if (path0) {
        NSString *str0 = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath:path0] encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"str0: %@", str0);
    }
    
    // 资源类型为目录下的Folder References
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"temp1" ofType:@"txt"];
    NSLog(@"path1: %@", path1);
    if (!path1) {
        path1 = [[NSBundle mainBundle] pathForResource:@"temp1" ofType:@"txt"inDirectory:@"Resource1"];
        NSLog(@"path1: %@", path1);
        if (path1) {
            NSString *str1 = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath:path1] encoding:NSUTF8StringEncoding error:nil];
            NSLog(@"str1: %@", str1);
        }
    }
    
    
    // 资源类型为Bundle的Groups
    NSBundle *bundle2 = [NSBundle bundleWithPath:[NSBundle.mainBundle pathForResource:@"Resource2" ofType:@"bundle"]];
    NSString *path2 = [bundle2 pathForResource:@"temp2" ofType:@"txt"];
    NSLog(@"path2: %@", path2);
    if (path2) {
        NSString *str2 = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath:path2] encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"str2: %@", str2);
    }
    
    // 资源类型为Bundle的Folder References
    NSBundle *bundle3 = [NSBundle bundleWithPath:[NSBundle.mainBundle pathForResource:@"Resource3" ofType:@"bundle"]];
    NSString *path3 = [bundle3 pathForResource:@"temp3" ofType:@"txt"];
    NSLog(@"path3: %@", path3);
    if (path3) {
        NSString *str3 = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath:path3] encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"str3: %@", str3);
    }
    
    
    // 获取Info.plist中的数据
    NSDictionary *dictInfo = [[NSBundle mainBundle] infoDictionary];
    NSLog(@"Info.plist: %@", dictInfo);
}

@end
