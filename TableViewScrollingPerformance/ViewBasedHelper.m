//
//  ViewBasedHelper.m
//  TableViewScrollingPerformance
//
//

#import "ViewBasedHelper.h"

@interface ViewBasedHelper () 
@property (readwrite, strong) NSArray * data;
@end

@implementation ViewBasedHelper

- (instancetype)initWithData:(NSArray *)data
{
	if (!(self = [super init])) {
		return nil;
	}
	
	self.data = data;
	
	return self;
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
	return _data.count;
}


- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
	NSTableCellView * cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:nil];
	NSUInteger colIndex = [tableView.tableColumns indexOfObject:tableColumn];
	cell.textField.stringValue = [[_data objectAtIndex:row] objectAtIndex:colIndex];
	return cell;
}



@end
