//
//  AppDelegate.m
//  TableViewScrollingPerformance
//
//

#import "AppDelegate.h"
#import "ViewBasedHelper.h"
#import "CellBasedHelper.h"

@interface AppDelegate () 
@end

@implementation AppDelegate
{
	IBOutlet NSTableView * tvCellBased;
	IBOutlet NSTableView * tvViewBased;
	
	NSArray * _data;
	ViewBasedHelper * _viewBasedHelper;
	CellBasedHelper * _cellBasedHelper;
}


- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
	[tvCellBased.tableColumns enumerateObjectsUsingBlock:^(NSTableColumn * _Nonnull tc, NSUInteger idx, BOOL * _Nonnull stop) {
		tc.headerCell.stringValue = [NSString stringWithFormat:@"Column %lu", idx + 1];
		tc.width = 200;
	}];
	
	[tvViewBased.tableColumns enumerateObjectsUsingBlock:^(NSTableColumn * _Nonnull tc, NSUInteger idx, BOOL * _Nonnull stop) {
		tc.headerCell.stringValue = [NSString stringWithFormat:@"Column %lu", idx + 1];
		tc.width = 200;
	}];
	
	
	
	NSArray * rows = [self generatedData];
	_viewBasedHelper = [[ViewBasedHelper alloc] initWithData:rows];
	_cellBasedHelper = [[CellBasedHelper alloc] initWithData:rows];
	
	tvCellBased.delegate = _cellBasedHelper;
	tvCellBased.dataSource = _cellBasedHelper;
	
	tvViewBased.delegate = _viewBasedHelper;
	tvViewBased.dataSource = _viewBasedHelper;
	
	
	// Try it both ways 
	tvCellBased.window.contentView.wantsLayer = NO;
	tvViewBased.window.contentView.wantsLayer = NO;
	
	
	
	[tvCellBased reloadData];
	[tvViewBased reloadData];
}



- (NSArray *)generatedData
{
	NSMutableArray * rows = [NSMutableArray array];
	NSUInteger numCols = tvCellBased.tableColumns.count;
	
	for (NSUInteger ri = 0; ri < 10000; ri++) {
		NSMutableArray * row = [NSMutableArray array];
		
		for (NSUInteger ci = 0; ci < numCols; ci++) {
			[row addObject:[NSString stringWithFormat:@"Cell data for {R: %lu, C: %lu}", ri, ci]];
		}
		
		[rows addObject:row];
	}
	
	return rows;
}

@end
