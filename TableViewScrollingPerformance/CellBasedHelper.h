//
//  CellBasedHelper.h
//  TableViewScrollingPerformance
//
//

#import <Cocoa/Cocoa.h>

@interface CellBasedHelper : NSObject <NSTableViewDelegate, NSTableViewDataSource>
- (instancetype)initWithData:(NSArray *)data;
@end
