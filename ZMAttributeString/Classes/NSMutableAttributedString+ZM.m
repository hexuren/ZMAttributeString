//
//  NSMutableAttributedString+ZM.m
//  Pods-ZMAttributeString_Example
//
//  Created by Zhimi on 2020/5/16.
//

#import "NSMutableAttributedString+ZM.h"

@implementation NSMutableAttributedString (ZM)

+ (instancetype)zm_initWithStr:(NSString *)str customBlock:(void(^)(NSMutableAttributedString *att))customBlock {
    if(!str){
        str = @"";
    }
    NSMutableAttributedString * att = [[NSMutableAttributedString alloc] initWithString:str];
    if(customBlock){
        customBlock(att);
    }
    return att;
}

- (void)zm_appendStr:(NSString *)str block:(void(^)(NSMutableAttributedString *attStr, NSString *str))appendBlock {
    if(!str){
        str = @"";
    }
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithString:str];
    if(appendBlock){
        appendBlock(attStr,str);
    }
    [self appendAttributedString:attStr];
}

- (void)zm_insertStr:(NSString *)str atIndex:(NSInteger)loc block:(void(^)(NSMutableAttributedString *attStr,NSString *str))insertBlock {
    if(!str){
        str = @"";
    }
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithString:str];
    if(insertBlock){
        insertBlock(attStr,str);
    }
    [self insertAttributedString:attStr atIndex:loc];
}

- (void)zm_font:(UIFont *)font {
    NSRange range = NSMakeRange(0, [self length]);
    [self addAttribute:NSFontAttributeName value:font range:range];
}

- (void)zm_font:(UIFont *)font range:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    [self addAttribute:NSFontAttributeName value:font range:range];
}

- (void)zm_color:(UIColor *)color {
    NSRange range = NSMakeRange(0, [self length]);
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
}

- (void)zm_color:(UIColor *)color range:(NSRange)range {
    if(NSMaxRange(range) > [self length]) {
        return;
    }
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
}

-(void)zm_bgColor:(UIColor *)color {
    [self zm_bgColor:color range:NSMakeRange(0, [self length])];
}

- (void)zm_bgColor:(UIColor *)color range:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    if(color){
        [self addAttribute:NSBackgroundColorAttributeName value:color range:range];
    }
    else{
        [self removeAttribute:NSBackgroundColorAttributeName range:range];
    }
}

- (void)zm_baseLineOffset:(float)offset {
    NSRange range = NSMakeRange(0, [self length]);
    [self zm_baseLineOffset:offset range:range];
}

- (void)zm_baseLineOffset:(float)offset range:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    [self addAttribute:NSBaselineOffsetAttributeName value:@(offset) range:range];
}

- (void)zm_characterSpacing:(NSNumber *)characterSpaceing {
    NSRange range = NSMakeRange(0, [self length]);
    [self zm_characterSpacing:characterSpaceing range:range];
}

- (void)zm_characterSpacing:(NSNumber *)characterSpaceing range:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    [self addAttribute:NSKernAttributeName value:characterSpaceing range:range];
}

- (void)zm_underlineStyle:(NSUnderlineStyle)style {
    NSRange range = NSMakeRange(0, [self length]);
    [self zm_underlineStyle:style range:range];
}

- (void)zm_underlineStyle:(NSUnderlineStyle)style
                    range:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    [self addAttribute:NSUnderlineStyleAttributeName value:@(style) range:range];
}

- (void)zm_underlineColor:(UIColor *)color {
    NSRange range = NSMakeRange(0, [self length]);
    [self zm_underlineColor:color range:range];
}

- (void)zm_underlineColor:(UIColor *)color
                    range:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    [self addAttribute:NSUnderlineColorAttributeName value:color range:range];
}

- (void)zm_strikethrough:(NSUInteger)value {
    [self zm_strikethrough:value range:NSMakeRange(0, [self length])];
}

- (void)zm_strikethrough:(NSUInteger)value
                   range:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    [self addAttribute:NSStrikethroughStyleAttributeName value:@(value) range:range];
    [self addAttribute:NSBaselineOffsetAttributeName value:@(0) range:range];
}

- (void)zm_strikethroughColor:(UIColor *)color {
    [self zm_strikethroughColor:color range:NSMakeRange(0, [self length])];
}

- (void)zm_strikethroughColor:(UIColor *)color
                        range:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    [self addAttribute:NSStrikethroughColorAttributeName value:color range:range];
}

- (void)zm_shadow:(NSShadow *)shadow {
    [self zm_shadow:shadow range:NSMakeRange(0, [self length])];
}

- (void)zm_shadow:(NSShadow *)shadow
            range:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    [self addAttribute:NSShadowAttributeName value:shadow range:range];
}

- (void)zm_effect {
    [self zm_effectWithRange:NSMakeRange(0, [self length])];
}

- (void)zm_effectWithRange:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    [self addAttribute:NSTextEffectAttributeName value:NSTextEffectLetterpressStyle range:range];
}

- (void)zm_Obliqueness:(NSNumber *)value {
    [self zm_Obliqueness:value range:NSMakeRange(0, [self length])];
}

- (void)zm_Obliqueness:(NSNumber *)value
                 range:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    [self addAttribute:NSObliquenessAttributeName value:value range:range];
}

- (void)zm_Expansion:(NSNumber *)value {
    [self zm_Expansion:value range:NSMakeRange(0, [self length])];
}

- (void)zm_Expansion:(NSNumber *)value
               range:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    [self addAttribute:NSExpansionAttributeName value:value range:range];
}

- (void)zm_linkURL:(NSURL *)url {
    [self zm_linkURL:url range:NSMakeRange(0, [self length])];
}

- (void)zm_linkURL:(NSURL *)url
             range:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    [self addAttribute:NSLinkAttributeName value:url range:range];
}

- (void)zm_strokeWidth:(NSNumber *)strokeWidth {
    [self zm_strokeWidth:strokeWidth range:NSMakeRange(0, [self length])];
}

- (void)zm_strokeWidth:(NSNumber *)strokeWidth range:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    [self addAttribute:NSStrokeWidthAttributeName value:strokeWidth range:range];
}

- (void)zm_strokeColor:(UIColor *)strokeColor {
    [self zm_strokeColor:strokeColor range:NSMakeRange(0, [self length])];
}

- (void)zm_strokeColor:(UIColor *)strokeColor range:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    if(strokeColor){
        [self addAttribute:NSStrokeColorAttributeName value:strokeColor range:range];
    }
    else{
        [self removeAttribute:NSStrokeColorAttributeName range:range];
    }
}

- (void)zm_attachImage:(UIImage *)image {
    [self zm_attachImage:image imageSize:CGSizeMake(image.size.width, image.size.height)];
}

- (void)zm_attachImage:(UIImage *)image imageSize:(CGSize)imgSize {
    NSTextAttachment * attach = [[NSTextAttachment alloc] init];
    attach.image = image;
    attach.bounds = CGRectMake(0, 0, imgSize.width, imgSize.height);
    NSMutableAttributedString * imageStr = [[NSMutableAttributedString alloc] initWithAttributedString:[NSAttributedString attributedStringWithAttachment:attach]];
    
    [imageStr zm_baseLineOffset:-imgSize.height*0.18];
    
    [self appendAttributedString:imageStr];
}

- (void)zm_attachImage:(UIImage *)image imageSize:(CGSize)imgSize atIndex:(NSInteger)index {
    [self zm_attachImage:image imageSize:imgSize atIndex:index imageOffset:@(0)];
}

- (void)zm_attachImage:(UIImage *)image imageSize:(CGSize)imgSize atIndex:(NSInteger)index imageOffset:(NSNumber *)offset {
    if(index > self.string.length){
        return;
    }
    CGFloat offY = 0;
    NSTextAttachment * attach = [[NSTextAttachment alloc] init];
    attach.image = image;
    if(CGSizeEqualToSize(imgSize, CGSizeZero)){
        attach.bounds = CGRectMake(0, offY, image.size.width, image.size.height);
    }
    else{
        attach.bounds = CGRectMake(0, offY, imgSize.width, imgSize.height);
    }
    NSMutableAttributedString * imageStr = [[NSMutableAttributedString alloc] initWithAttributedString:[NSAttributedString attributedStringWithAttachment:attach]];
    if(offset){
        [imageStr zm_baseLineOffset:[offset floatValue]];
    }else{
        [imageStr zm_baseLineOffset:-imgSize.height*0.15];
    }
    [self insertAttributedString:imageStr atIndex:index];
}

- (void)zm_paragraphBlock:(void(^)(NSMutableParagraphStyle * style))paragraphBlock {
    NSRange range = NSMakeRange(0, self.string.length);
    [self zm_paragraphBlock:paragraphBlock andRange:range];
}

- (void)zm_paragraphBlock:(void(^)(NSMutableParagraphStyle * style))paragraphBlock andRange:(NSRange)range {
    if(NSMaxRange(range) > [self length]){
        return;
    }
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    if(paragraphBlock){
        paragraphBlock(paragraphStyle);
    }
    [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
}

- (void)zm_appendText:(NSString *)text config:(void(^)(NSMutableAttributedString * att))customBlock {
    NSMutableAttributedString * attText = [NSMutableAttributedString zm_initWithStr:text customBlock:customBlock];
    [self appendAttributedString:attText];
}

@end


@implementation NSAttributedString (ZM)

- (CGSize)zm_getSizeConstrainedToSize:(CGSize)size {
    UILabel *tempLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, size.width, 0)];
    tempLabel.attributedText = self;
    tempLabel.numberOfLines = 0;
    [tempLabel sizeToFit];
    
    CGSize fitSize = tempLabel.frame.size;
    fitSize = CGSizeMake(ceil(fitSize.width), ceil(fitSize.height));
    return fitSize;
}

@end
