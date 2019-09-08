

#import "Cell.h"
#import "CellView.h"


@implementation Cell

@synthesize cellView;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		
		// Create a time zone view and add it as a subview of self's contentView.
		CGRect tzvFrame = CGRectMake(0.0, 0.0, self.contentView.bounds.size.width, 60);//self.contentView.bounds.size.height);
		cellView = [[CellView alloc] initWithFrame:tzvFrame];
		cellView.autoresizingMask = UIViewAutoresizingFlexibleWidth;// | UIViewAutoresizingFlexibleHeight;
		[self.contentView addSubview:cellView];
	}
	return self;
}

- (void) setData:(NSDictionary *)data type:(NSString *)type {
	[cellView setData:data type:type];
	
	[self setSelectionStyle:[data objectForKey:@"usermessage"]?
		UITableViewCellSelectionStyleNone:
	    UITableViewCellSelectionStyleBlue];
}

- (void) setNeedsDisplay {
	[super setNeedsDisplay];
	[cellView setNeedsDisplay];
}


@end