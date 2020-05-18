//
//  NSMutableAttributedString+ZM.h
//  Pods-ZMAttributeString_Example
//
//  Created by Zhimi on 2020/5/16.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (ZM)

#pragma mark - attributeString
/** 创建一个AttributeString */
+ (instancetype)zm_initWithStr:(NSString *)str customBlock:(void(^)(NSMutableAttributedString *att))customBlock;

/** 追加AttributeString */
- (void)zm_appendStr:(NSString *)str block:(void(^)(NSMutableAttributedString *attStr, NSString *str))appendBlock;

/** 插入AttributeString */
- (void)zm_insertStr:(NSString *)str atIndex:(NSInteger)loc block:(void(^)(NSMutableAttributedString *attStr,NSString *str))insertBlock;

#pragma mark - UIFont
/** 设置字体 */
- (void)zm_font:(UIFont *)font;

/** 设置range范围的字体 */
- (void)zm_font:(UIFont *)font range:(NSRange)range;

#pragma mark - UIColor
/** 设置颜色 */
- (void)zm_color:(UIColor *)color;

/** 设置range范围的颜色 */
- (void)zm_color:(UIColor *)color range:(NSRange)range;

/** 设置区域背景颜色 */
-(void)zm_bgColor:(UIColor *)color;

/** 设置range范围的背景颜色 */
- (void)zm_bgColor:(UIColor *)color range:(NSRange)range;

#pragma mark - Others
/** baseline偏移 */
- (void)zm_baseLineOffset:(float)offset;

- (void)zm_baseLineOffset:(float)offset range:(NSRange)range;


/** 文本字符间隔 */
- (void)zm_characterSpacing:(NSNumber *)characterSpaceing;

- (void)zm_characterSpacing:(NSNumber *)characterSpaceing range:(NSRange)range;


/**
 添加下划线
 NSUnderlineStyleNone 不设置
 NSUnderlineStyleSingle 下划线 细
 NSUnderlineStyleThick 下划线 粗
 NSUnderlineStyleDouble 下划线 双线
 NSUnderlinePatternSolid 连续实线
 NSUnderlinePatternDot 虚线
 NSUnderlinePatternDash 破折线
 NSUnderlinePatternDashDot 破折线和虚线
 NSUnderlinePatternDashDotDot 破折线和虚线虚线
 NSUnderlineByWord 有字符的地方设置 空格的地方就空的
 */
- (void)zm_underlineStyle:(NSUnderlineStyle)style;

- (void)zm_underlineStyle:(NSUnderlineStyle)style
                             range:(NSRange)range;

/** 下划线的颜色 */
- (void)zm_underlineColor:(UIColor *)color;

- (void)zm_underlineColor:(UIColor *)color
                    range:(NSRange)range;


/** 删除线 线条粗细 */
- (void)zm_strikethrough:(NSUInteger)value;

- (void)zm_strikethrough:(NSUInteger)value
                   range:(NSRange)range;


/** 删除线颜色 */
- (void)zm_strikethroughColor:(UIColor *)color;

- (void)zm_strikethroughColor:(UIColor *)color
                        range:(NSRange)range;


/** 阴影 */
- (void)zm_shadow:(NSShadow *)shadow;

- (void)zm_shadow:(NSShadow *)shadow
            range:(NSRange)range;


/**
 文本的特殊效果 目前只有 NSTextEffectLetterpressStyle 这个一个效果
 */
- (void)zm_effect;

- (void)zm_effectWithRange:(NSRange)range;

/**
 字体倾斜
 @param value 正值右倾斜 负值左倾斜
 */
- (void)zm_Obliqueness:(NSNumber *)value;

- (void)zm_Obliqueness:(NSNumber *)value
                 range:(NSRange)range;

/**
 文本横向拉伸
 @param value 正值横向拉伸 负值横向压缩
 */
- (void)zm_Expansion:(NSNumber *)value;

- (void)zm_Expansion:(NSNumber *)value
               range:(NSRange)range;


/**
 添加链接
 */
- (void)zm_linkURL:(NSURL *)url;

- (void)zm_linkURL:(NSURL *)url
             range:(NSRange)range;


/**
 字体的描边和颜色 负值填充 正值中空
 */
- (void)zm_strokeWidth:(NSNumber *)strokeWidth;

- (void)zm_strokeWidth:(NSNumber *)strokeWidth range:(NSRange)range;

- (void)zm_strokeColor:(UIColor *)strokeColor;

- (void)zm_strokeColor:(UIColor *)strokeColor range:(NSRange)range;


/** 附加图片 */
- (void)zm_attachImage:(UIImage *)image;

- (void)zm_attachImage:(UIImage *)image imageSize:(CGSize)imgSize;

- (void)zm_attachImage:(UIImage *)image imageSize:(CGSize)imgSize atIndex:(NSInteger)index;

- (void)zm_attachImage:(UIImage *)image imageSize:(CGSize)imgSize atIndex:(NSInteger)index imageOffset:(NSNumber *)offset;


/**
 *  段落
 *  param lineSpacing               行间距
 *  param paragraphSpacing          段落间距
 *  param alignment                 文字对齐格式
 *  param firstLineHeadIndent       首行缩进
 *  param headIndent                行首缩进
 *  param tailIndent                行尾缩进
 *  param lineBreakMode             段落文字溢出隐藏方式
 *  param minimumLineHeight         最小行高
 *  param maximumLineHeight         最大行高
 *  param baseWritingDirection      段落书写方向
 *  param lineHeightMultiple        多行行高
 *  param paragraphSpacingBefore    段落前间距
 *  param hyphenationFactor         英文断字连字符
 */
- (void)zm_paragraphBlock:(void(^)(NSMutableParagraphStyle * style))paragraphBlock;

- (void)zm_paragraphBlock:(void(^)(NSMutableParagraphStyle * style))paragraphBlock andRange:(NSRange)range;


/** 附加文字 */
- (void)zm_appendText:(NSString *)text config:(void(^)(NSMutableAttributedString * att))customBlock;

@end



@interface NSAttributedString (ZM)

/**
 计算高度
 @param size 区域大小限制
 @return 大小
 */
- (CGSize)zm_getSizeConstrainedToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
