//
//  AlivcVideoPlayTextFieldTableViewCell.h
//  AlivcLongVideo
//
//  Created by ToT on 2019/12/25.
//

#import <UIKit/UIKit.h>

typedef void(^textFieldChangedCallBack)(NSString *leaderText,NSString *changedText);
typedef void(^SengmentChangedCallBack)(NSString *leaderText,NSInteger idx);
typedef void(^scanCallBack)(void);

@interface AlivcVideoPlayTextFieldTableViewCell : UITableViewCell

@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UITextField *inputTextField;
@property (nonatomic,strong)NSString *leaderText;
@property (nonatomic,assign)BOOL showScanButton;
@property (nonatomic,strong) UISegmentedControl *segment;
@property (nonatomic,assign)BOOL showSegment;

@property (nonatomic,strong)textFieldChangedCallBack callBack;
@property (nonatomic,strong)SengmentChangedCallBack sengmentChangedCallBack;
@property (nonatomic,strong)scanCallBack toScanCallBack;

@end


