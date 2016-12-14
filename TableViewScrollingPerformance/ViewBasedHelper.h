//
//  ViewBasedHelper.h
//  TableViewScrollingPerformance
//
//

#import <Cocoa/Cocoa.h>

@interface ViewBasedHelper : NSObject <NSTableViewDelegate, NSTableViewDataSource>
- (instancetype)initWithData:(NSArray *)data;
@end
