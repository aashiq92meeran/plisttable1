//
//  ViewController.m
//  plisttable1
//
//  Created by BSA univ 2 on 03/06/14.
//  Copyright (c) 2014 BSA univ 2. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"Property List" ofType:@"plist"];
    NSDictionary *dict=[[NSDictionary alloc]initWithContentsOfFile:path];
    self.names=dict;
    NSArray *array=[[_names allKeys]sortedArrayUsingSelector:@selector(compare:)];
    self.keys=array;
    
//    NSLog(@" WHAYT%@",_keys);
    
//      NSLog(@" WHAYT%@",_names);
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *key = [_keys objectAtIndex:section];
    
    return key;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_keys count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [_keys objectAtIndex:section];
    
    NSArray *name = [_names valueForKey:key];
    
    return [name count];
    
   }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    NSString *key = [_keys objectAtIndex:indexPath.section];
    NSDictionary *name = [_names valueForKey:key];
    NSArray *array2=[name valueForKey:@"Members"];
    static NSString *cellid =@"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
       if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    cell.textLabel.text = [array2 objectAtIndex:indexPath.row];
       return cell;
}


@end
