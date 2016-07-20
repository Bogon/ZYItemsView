//
//  ItemsView.h
//  UIComponentPrivatePods
//
//  Created by 张奇 on 16/7/14.
//  Copyright © 2016年 zhangqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemsView : UIView

typedef void (^ClickItemCallBackBlock)(int index);

-(id)initWithFrame:(CGRect)frame itemsTitleArray:(NSArray *)itemsArray callBackComplement:(ClickItemCallBackBlock)callBack;

@end
