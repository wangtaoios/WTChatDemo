//
//  WTUtils.m
//  WTChatDemo
//
//  Created by wangtao on 2017/9/15.
//  Copyright © 2017年 xkxz. All rights reserved.
//

#import "WTUtils.h"
#import "WTChat.h"

@implementation WTUtils


+ (NSArray *)dataArray
{
    WTChat *model1 = [[WTChat alloc] init];
    model1.realName = @"西开金服官方";
    model1.headImg = @"/image/20170811/20170811145149_250.jpg";
    model1.comment = @"您好";
    model1.isShow = @"1";
    model1.addTime = @"2017-06-01";
    
    WTChat *model2 = [[WTChat alloc] init];
    model2.realName = @"大帅哥";
    model2.headImg = @"/image/20170629/20170629182527_826.png";
    model2.comment = @"您好，您好";
    model2.isShow = @"1";
    model2.addTime = @"2017-06-02";
    
    WTChat *model3 = [[WTChat alloc] init];
    model3.realName = @"西开金服官方";
    model3.headImg = @"/image/20170811/20170811145149_250.jpg";
    model3.comment = @"2017年6月30日 晓知早报：1、茂县发布公告称，为表达对茂县“6·24”叠溪镇新磨村特大山体滑坡灾害遇难人员的深切哀悼，30日上午10时整举行默哀仪式，悼念遇难人员，告慰遇难者亲属。届时，请各族干部群众肃立默哀1分钟；汽车停止行驶，鸣笛1分钟；防空警报鸣响。(中国日报)";
    model3.isShow = @"0";
    model3.addTime = @"2017-06-01";
    
    WTChat *model4 = [[WTChat alloc] init];
    model4.realName = @"大帅哥";
    model4.headImg = @"/image/20170629/20170629182527_826.png";
    model4.comment = @"中国人民解放军是中华人民共和国主要的国家武装力量，由陆军、海军、空军、火箭军、战略支援部队五大军种组成。解放军由中国共产党建立，自成立起坚持“党指挥枪”原则，由中央军事委员会所领导，中央军委主席统率全军。";
    model4.isShow = @"0";
    model4.addTime = @"2017-06-02";
    
    WTChat *model5 = [[WTChat alloc] init];
    model5.realName = @"大帅哥";
    model5.headImg = @"/image/20170629/20170629182527_826.png";
    model5.comment = @"中国人民解放军战略支援部队是中国人民解放军于2015年12月31日成立的军种。根据官方说法，战略支援部队是“将战略性、基础性、支撑性都很强的各类保障力量进行功能整合后组建而成的”。与仿制苏联战略火箭军的解放军火箭军不同，此军种属于新创部门，与1990年左右成立的美国战略司令部的职责比较类似，但概念更为新颖、更符合21世纪的期望，而外界根据其臂章则猜测战略支援部队可能包括电子对抗、网络攻防、卫星管理等资讯方面的力量，以及担负一部分的后勤补给调度的职能。";
    model5.isShow = @"0";
    model5.addTime = @"2017-06-02";
    
    WTChat *model6 = [[WTChat alloc] init];
    model6.realName = @"大帅哥";
    model6.headImg = @"/image/20170629/20170629182527_826.png";
    model6.comment = @"中国人民解放军陆军，简称解放军陆军、中国陆军，是中华人民共和国的陆上武装力量，是中国人民解放军的第一军种，是中国人民解放军的主体军事力量。";
    model6.isShow = @"0";
    model6.addTime = @"2017-06-02";
    
    WTChat *model7 = [[WTChat alloc] init];
    model7.realName = @"大帅哥";
    model7.headImg = @"/image/20170629/20170629182527_826.png";
    model7.comment = @"中国人民解放军海军，是中华人民共和国的海上武装力量，是中国人民解放军的五大军兵种之一。从其前身华东军区海军成立之时起，解放军海军就在中华人民共和国历史上发挥了重要作用，在第二次国共内战、西沙海战等历次战争中发挥了关键作用。";
    model7.isShow = @"0";
    model7.addTime = @"2017-06-02";
    
    WTChat *model8 = [[WTChat alloc] init];
    model8.realName = @"大帅哥";
    model8.headImg = @"/image/20170629/20170629182527_826.png";
    model8.comment = @"中国人民解放军空军，简称中国空军、人民空军、解放军空军，是中华人民共和国的空中武装力量，是中国人民解放军的五大军兵种之一。";
    model8.isShow = @"0";
    model8.addTime = @"2017-06-02";
    
    WTChat *model9 = [[WTChat alloc] init];
    model9.realName = @"大帅哥";
    model9.headImg = @"/image/20170629/20170629182527_826.png";
    model9.comment = @"中国人民解放军火箭军，简称解放军火箭军、中国火箭军，是中国人民解放军的五大军兵种之一。由中央军事委员会直接领导指挥、以地对地战略导弹为主要装备、担负核反击战略作战任务。";
    model9.isShow = @"0";
    model9.addTime = @"2017-06-02";
    
    WTChat *model10 = [[WTChat alloc] init];
    model10.realName = @"西开金服官方";
    model10.headImg = @"/image/20170811/20170811145149_250.jpg";
    model10.comment = @"辽宁号航空母舰（舷号：16）是一艘隶属于中国人民解放军海军的航空母舰，是中华人民共和国第一代及第一艘航空母舰，亦是首艘和唯一一艘001型航空母舰。该舰舰名源自其建造地辽宁省。";
    model10.isShow = @"1";
    model10.addTime = @"2017-06-03";
    
    
    return @[model1, model2, model3, model4, model5, model6, model7, model8, model9, model10];
}

@end
