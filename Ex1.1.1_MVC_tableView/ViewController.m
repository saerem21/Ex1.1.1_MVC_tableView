//
//  ViewController.m
//  Ex1.1.1_MVC_tableView
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "TableData.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputName;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (IBAction)addItem:(id)sender {
    TableData *Tdata = [TableData returnInstance];
    NSString *Name = self.inputName.text;
    [Tdata addOneData:Name];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([Tdata rowCount]-1) inSection:0];
    NSArray *newRow = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:newRow withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.inputName setText:@""];
    [self.inputName resignFirstResponder];

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [[TableData returnInstance] removeOneData:indexPath.row];
    
    NSArray *rowForDel = [NSArray arrayWithObject:indexPath];
    [self.tableView deleteRowsAtIndexPaths:rowForDel withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[TableData returnInstance] rowCount];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CELL_ID"];
    
    TableData *data = [TableData returnInstance];
    cell.textLabel.text = [data showOneData:indexPath.row];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
