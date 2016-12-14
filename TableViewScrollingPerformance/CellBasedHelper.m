//
//  CellBasedHelper.m
//  TableViewScrollingPerformance
//
//

#import "CellBasedHelper.h"

@interface CellBasedHelper ()
@property (readwrite, strong) NSArray * data;
@end

@implementation CellBasedHelper

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



- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
	NSUInteger colIndex = [tableView.tableColumns indexOfObject:tableColumn];
	return [[_data objectAtIndex:row] objectAtIndex:colIndex];
}

@end
