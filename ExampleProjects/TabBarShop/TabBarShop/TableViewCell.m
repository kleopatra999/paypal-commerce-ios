//
//  TableViewCell.m
//  TabBarShop
//
//  Created by Robert Haining on 10/26/15.
//  Copyright © 2015 Modest. All rights reserved.
//

#import "TableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface TableViewCell()
@property (nonatomic, readonly) UIImageView *thumbnailView;
@end

@implementation TableViewCell

+(UIFont *)cellFont{
    return [UIFont systemFontOfSize:15];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.textLabel.font = [TableViewCell cellFont];
        self.textLabel.numberOfLines = 3;
        
        _thumbnailView = [UIImageView new];
        self.thumbnailView.contentMode = UIViewContentModeScaleAspectFill;
        self.thumbnailView.clipsToBounds = YES;
        [self.contentView addSubview:self.thumbnailView];

        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    self.thumbnailView.image = nil;
}

-(void)setImageURL:(NSURL *)imageURL{
    if(imageURL){
        __weak TableViewCell *weakCell = self;
        [self.thumbnailView setImageWithURLRequest:[NSURLRequest requestWithURL:imageURL]
                              placeholderImage:nil
                                       success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nonnull response, UIImage * _Nonnull image) {
                                           if(weakCell){
                                               __strong TableViewCell *cell = weakCell;
                                               cell.thumbnailView.image = image;
                                               [cell setNeedsLayout];
                                           }
                                       } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nonnull response, NSError * _Nonnull error) {
                                           if(weakCell){
                                               __strong TableViewCell *cell = weakCell;
                                               cell.thumbnailView.image = nil;
                                           }
                                       }
         ];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect frame = self.thumbnailView.frame;
    frame.origin = CGPointZero;
    frame.size.height = CGRectGetHeight(self.contentView.bounds);
    frame.size.width = CGRectGetHeight(frame);
    self.thumbnailView.frame = frame;
    
    frame = self.textLabel.frame;
    frame.origin.x = CGRectGetMaxX(self.thumbnailView.frame) + 10;
    frame.origin.y = 15;
    frame.size.width = CGRectGetWidth(self.contentView.frame) - CGRectGetMinX(frame) - CGRectGetMinX(self.thumbnailView.frame);
    frame.size.height = [self.textLabel sizeThatFits:CGSizeMake(CGRectGetWidth(frame), 0)].height;
    self.textLabel.frame = frame;
}


@end
