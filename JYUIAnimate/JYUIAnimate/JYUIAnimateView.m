//
//  JYUIAnimateView.m
//  JYUIAnimate
//
//  Created by yuzhelun on 2016/11/22.
//  Copyright © 2016年 Julie Yu. All rights reserved.
//

#import "JYUIAnimateView.h"

#define RADIUS_DISTANCE (self.frame.size.width/2.0/2.0)
#define kCircleCountDown 10

@interface JYUIAnimateView ()

@property(strong, nonatomic)NSTimer *timer;
@property(assign, nonatomic)NSInteger count;
@property(assign, nonatomic)NSInteger circleCountDown;

@end

@implementation JYUIAnimateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.count = 0;
    self.circleCountDown = kCircleCountDown;
    
    self.backgroundColor = [UIColor blackColor];
}

- (void)startAnimation
{
    [self addTimer:nil];
}

- (void)stopAnimation
{
    [self removeTimer:nil];
}

- (void)addTimer:(NSSet *)objects
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(reDraw:) userInfo:nil repeats:YES];
    }
}

- (void)removeTimer:(NSSet *)objects
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)reDraw:(NSTimer *)timer
{
    self.count++;
    self.count = self.count % (int)RADIUS_DISTANCE;
    [self setNeedsDisplayInRect:self.frame];
    
    if (self.count == 1) {
        self.circleCountDown--;
        if (self.circleCountDown == 0) {
            [self stopAnimation];
            self.circleCountDown = kCircleCountDown;
            self.count = 0;
        }
    }
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawCircle:context];
}

- (void)drawCircle:(CGContextRef)context
{
    if (self.timer) {
        CGPoint center = self.center;
        float radius0 = RADIUS_DISTANCE * 1 + self.count;
        float radius1 = RADIUS_DISTANCE * 2 + self.count;
        
        CGContextSetRGBStrokeColor(context, 255, 100, 100, 0.4 + 0.3 * (RADIUS_DISTANCE-self.count)/RADIUS_DISTANCE);
        CGContextSetLineWidth(context, 2.0 + 1 * self.count/RADIUS_DISTANCE);
        CGContextAddEllipseInRect(context, CGRectMake(center.x - radius0, center.y - radius0, 2 * radius0, 2 * radius0));
        CGContextStrokePath(context);
        
        CGContextSetRGBStrokeColor(context, 255, 100, 100, 0.1 + 0.3 * (RADIUS_DISTANCE-self.count)/RADIUS_DISTANCE);
        CGContextSetLineWidth(context, 3.0 + 1 * self.count/RADIUS_DISTANCE);
        CGContextAddEllipseInRect(context, CGRectMake(center.x - radius1, center.y - radius1, 2 * radius1, 2 * radius1));
        CGContextStrokePath(context);
    }
}

@end
