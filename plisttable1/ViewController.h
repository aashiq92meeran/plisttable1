//
//  ViewController.h
//  plisttable1
//
//  Created by BSA univ 2 on 03/06/14.
//  Copyright (c) 2014 BSA univ 2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)NSDictionary *names;
@property(strong,nonatomic)NSArray *keys;

@end
