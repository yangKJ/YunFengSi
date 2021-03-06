//
//  KJComment.m
//  KJDevelopExample
//
//  Created by CoderMikeHe on 17/2/8.
//  Copyright © 2017年 杨科军. All rights reserved.
//

#import "KJComment.h"

@implementation KJComment


- (instancetype)init{
    self = [super init];
    if (self){
        _mediabase_id = @"89757";
    }
    return self;
}


- (NSAttributedString *)attributedText{
    if (!KJObjectIsNil(self.toUser)&& self.toUser.nickname.length>0){
        // 有回复
        NSString *textString = [NSString stringWithFormat:@"%@回复%@: %@", self.fromUser.nickname, self.toUser.nickname, self.text];;
        NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:textString];
        mutableAttributedString.font = SystemFontSize(12);
        mutableAttributedString.color = [UIColor blackColor];
        mutableAttributedString.lineSpacing = KJCommentContentLineSpacing;
        NSRange fromUserRange = NSMakeRange(0, self.fromUser.nickname.length);
        YYTextHighlight *fromUserHighlight = [YYTextHighlight highlightWithBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]];
        fromUserHighlight.userInfo = @{@"KJCommentUserKey":self.fromUser};
        [mutableAttributedString setTextHighlight:fromUserHighlight range:fromUserRange];
        // 设置昵称颜色
        [mutableAttributedString setColor:MainColor range:NSMakeRange(0, self.fromUser.nickname.length)];
        NSRange toUserRange = [textString rangeOfString:[NSString stringWithFormat:@"%@:",self.toUser.nickname]];
        // 文本高亮模型
        YYTextHighlight *toUserHighlight = [YYTextHighlight highlightWithBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]];
        // 这里痛过属性的userInfo保存User模型，后期通过获取模型然后获取User模型
        toUserHighlight.userInfo = @{@"KJCommentUserKey":self.toUser};
        // 点击用户的昵称的事件传递
//        toUserHighlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect)
//        {
//            // 这里通过通知把用户的模型传递出去
//        };
        // 被回复者名字
        [mutableAttributedString setTextHighlight:toUserHighlight range:toUserRange];
        [mutableAttributedString setColor:MainColor range:toUserRange];
        return mutableAttributedString;
    }else{
        // 没有回复
        NSString *textString = [NSString stringWithFormat:@"%@: %@", self.fromUser.nickname, self.text];
        NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:textString];
        mutableAttributedString.font = SystemFontSize(12);
        mutableAttributedString.color = [UIColor blackColor];
        mutableAttributedString.lineSpacing = KJCommentContentLineSpacing;
        NSRange fromUserRange = NSMakeRange(0, self.fromUser.nickname.length+1);
        // 设置昵称颜色
        [mutableAttributedString setColor:MainColor range:fromUserRange];
        YYTextHighlight *fromUserHighlight = [YYTextHighlight highlightWithBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]];
        fromUserHighlight.userInfo = @{@"KJCommentUserKey":self.fromUser};
        [mutableAttributedString setTextHighlight:fromUserHighlight range:fromUserRange];
        return mutableAttributedString;
    }
    
    return nil;
}

@end
