//
//  RootViewController.m
//  AnimationDemo
//
//  Created by 周泉 on 12-9-12.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联ios开发培训中心. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"iOS动画";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    viewAnimationArray = [[NSArray arrayWithObjects:@"淡入、淡出", @"位置变换", @"缩放变换", @"旋转动画", @"代理动画", @"过渡动画", @"block 动画", nil] retain];
    
    transitionArray = [[NSArray arrayWithObjects:@"trainsition 1", @"trainsition 2", @"trainsition 3", @"trainsition 4", nil] retain];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return [viewAnimationArray count];
    }
    return [transitionArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [viewAnimationArray objectAtIndex:indexPath.row];
    }else {
        cell.textLabel.text = [transitionArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"UIView Animation";
    }else {
        return @"Core Animation";
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:nil bundle:nil];
    detailViewController.section = indexPath.section;
    detailViewController.row = indexPath.row;
    detailViewController.title = (indexPath.section == 0) ? [viewAnimationArray objectAtIndex:indexPath.row]: [transitionArray objectAtIndex:indexPath.row];
    
    CATransition *transition = [CATransition animation];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromRight;
    transition.duration = 0.6;
    [self.navigationController.view.layer addAnimation:transition forKey:@"NavgationAnimation"];
    [self.navigationController pushViewController:detailViewController animated:NO];
    [detailViewController release];

}

@end
