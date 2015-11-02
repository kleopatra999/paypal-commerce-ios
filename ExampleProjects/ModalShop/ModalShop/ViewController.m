//
//  ViewController.m
//  ModalShop
//
//  Created by Robert Haining on 7/27/15.
//  Copyright (c) 2015 Modest. All rights reserved.
//

#import "ViewController.h"
#import <RSSParser.h>
#import <UIImageView+AFNetworking.h>
#import "WebViewController.h"
#import <ModestStoreSDK/ModestStoreSDK.h>
#import "TableViewCell.h"
#import <SafariServices/SafariServices.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, strong) NSArray *feedItems;
@end

@implementation ViewController

-(NSString *)newsCellReuseID{ return @"news_cell"; }
-(NSString *)adCellReuseID{ return @"ad_cell"; }

-(void)loadView{
    [super loadView];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:self.newsCellReuseID];
    [self.tableView registerClass:[MDSTProductCardTableViewCell class] forCellReuseIdentifier:self.adCellReuseID];
    [self.view addSubview:self.tableView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Shop" style:UIBarButtonItemStylePlain target:self action:@selector(displayShop)];
    
    self.title = @"Braintree Blog";
    
    [self loadRSSFeed];
}

-(void)displayShop{
    //a simple way of presenting the shop modally
    [ModestStoreSDK presentModalStore];
}

-(void)loadRSSFeed{
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator startAnimating];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.braintreepayments.com/blog/rss/"]];
    [RSSParser parseRSSFeedForRequest:req success:^(NSArray *feedItems) {
        
        NSMutableArray *items = [feedItems mutableCopy];
        for(NSUInteger idx=4; idx < items.count; idx += 5){
            [items insertObject:[NSNull null] atIndex:idx];
        }
        self.feedItems = [NSArray arrayWithArray:items];
        [self.tableView reloadData];
        self.navigationItem.rightBarButtonItem = nil;
        
    } failure:^(NSError *error) {
        
        [[[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Okay", nil] show];
        
        
        self.navigationItem.rightBarButtonItem = nil;
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.feedItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id item = self.feedItems[indexPath.row];
    if([item isKindOfClass:[RSSItem class]]){
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.newsCellReuseID];

        RSSItem *rssItem = item;
        cell.textLabel.text = rssItem.title;
        
        NSString *imageURLString = [[rssItem imagesFromContent] firstObject];
        if(imageURLString){
            [cell setImageURL:[NSURL URLWithString:imageURLString]];
        }
        
        return cell;
    }else if([item isKindOfClass:[NSNull class]]){
        
        //here we're showing a basic product cell within this content.
        //  put in a search term here that makes sense for your store
        MDSTProductCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.adCellReuseID];
        NSArray *terms = @[@"tote", @"shirt", @"poster"];
        NSUInteger randomIdx = arc4random() % terms.count;
        NSString *term = terms[randomIdx];
        [cell loadProductWithSearchTerm:term completion:nil];

        return cell;
    }else{
        return nil;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    id item = self.feedItems[indexPath.row];
    if([item isKindOfClass:[RSSItem class]]){
        RSSItem *rssItem = item;
        if(NSClassFromString(@"SFSafariViewController")){
            SFSafariViewController *vc = [[SFSafariViewController alloc] initWithURL:rssItem.link entersReaderIfAvailable:YES];
            [self presentViewController:vc animated:YES completion:nil];
        }else{
            WebViewController *webViewController = [[WebViewController alloc] initWithURL:rssItem.link title:rssItem.title];
            [self.navigationController pushViewController:webViewController animated:YES];
        }
    }else if([item isKindOfClass:[NSNull class]]){
        //nothing
    }
}


@end
