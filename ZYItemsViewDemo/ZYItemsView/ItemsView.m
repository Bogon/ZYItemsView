//
//  ItemsView.m
//  UIComponentPrivatePods
//
//  Created by 张奇 on 16/7/14.
//  Copyright © 2016年 zhangqi. All rights reserved.
//

#import "ItemsView.h"

@interface ItemsView (){
    
    NSArray *_itemTitlesArray;
    ClickItemCallBackBlock _callBack;
}

@end

@implementation ItemsView

//请将宽度为屏幕宽度
-(id)initWithFrame:(CGRect)frame itemsTitleArray:(NSArray *)itemsArray callBackComplement:(ClickItemCallBackBlock)callBack{
    
    if (self = [super initWithFrame:frame]) {
    }
    _itemTitlesArray = itemsArray;
    _callBack = callBack;
    [self drawSubView];
    return self;
}

//对页面进行布局
-(void)drawSubView{
    //在屏幕中，每行会有四个item
    CGFloat itemWith = self.frame.size.width/3.0;
    CGFloat itemHeight = itemWith;
    CGFloat imgViewWidthHeight = 40.f;
    [_itemTitlesArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"index = %ld",idx);
        UIView *itemView = [[UIView alloc] initWithFrame:CGRectMake((idx%3)*itemWith, itemHeight*((idx)/3), itemWith, itemHeight)];
        itemView.tag = idx;
        itemView.layer.masksToBounds = YES;
        [itemView.layer setBorderWidth:0.5f];
        [itemView.layer setBorderColor:[UIColor lightTextColor].CGColor];
        [self addSubview:itemView];
        itemView.backgroundColor = [UIColor whiteColor];
        
        //图片
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(itemWith/2.0 - 20.f, 20, imgViewWidthHeight, imgViewWidthHeight)];
        [imgView setImage:[UIImage imageNamed:obj]];
        [itemView addSubview:imgView];
        
        //标题
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20+imgViewWidthHeight+20, itemWith, 20)];
        titleLabel.textColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:15.f];
        titleLabel.text = obj;
        [itemView addSubview:titleLabel];
        
        //添加事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reponseClickAction:)];
        tap.view.tag = idx;
        [itemView addGestureRecognizer:tap];
    }];
    
}

-(void)reponseClickAction:(UITapGestureRecognizer *)tap{
    
    int index = (int)tap.view.tag;
    _callBack(index);
}


@end
