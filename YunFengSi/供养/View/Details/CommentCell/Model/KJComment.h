//
//  KJComment.h
//  KJDevelopExample
//
//  Created by CoderMikeHe on 17/2/8.
//  Copyright © 2017年 杨科军. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KJUser.h"


@interface KJComment : NSObject

/** 视频的id */
@property (nonatomic , copy)NSString *mediabase_id;

/** 评论、回复id */
@property (nonatomic , copy)NSString * commentId;

/** 创建时间 */
@property (nonatomic , copy)NSString *creatTime;

/** 回复用户模型 */
@property (nonatomic , strong)KJUser *toUser;

/** 来源用户模型 */
@property (nonatomic , strong)KJUser *fromUser;

/** 话题内容 */
@property (nonatomic, copy)NSString *text;

/** 获取富文本 */
- (NSAttributedString *)attributedText;

@end
