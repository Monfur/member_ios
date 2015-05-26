//
//  UIWebView+Extra.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-17.
//

#import "UIWebView+Extra.h"
#import <objc/runtime.h>

static const void *kHeaderView = &kHeaderView;
static const void *kFooterView = &kFooterView;

@implementation UIWebView (Extra)

+ (UIWebView *)plainWebView{
  UIWebView *webView = [[UIWebView alloc] init];
  for (UIView* subView in [webView subviews])
  {
    if ([subView isKindOfClass:[UIScrollView class]]) {
      for (UIView* shadowView in [subView subviews])
      {
        if ([shadowView isKindOfClass:[UIImageView class]]) {
          [shadowView setHidden:YES];
        }
      }
    }
  }
  return webView;
}

- (UIView *)headerView{
  return objc_getAssociatedObject(self, kHeaderView);
}

- (void) setHeaderView:(UIView *)headerView{
  if(!headerView) return;
  UIEdgeInsets insets = self.scrollView.contentInset;
  insets.top = CGRectGetHeight(headerView.frame);
  self.scrollView.contentInset = insets;
  [headerView setFrameOriginY:-insets.top];
  [self yg_addObserver:self forKeyPath:@"scrollView.contentSize" options:NSKeyValueObservingOptionNew context:nil];
  [self.scrollView addSubview:headerView];
  
  objc_setAssociatedObject(self, kHeaderView, headerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)footerView{
  return objc_getAssociatedObject(self, kFooterView);
}

- (void) setFooterView:(UIView *)footerView{
  if (!footerView) return;
  UIEdgeInsets insets = self.scrollView.contentInset;
  insets.bottom = CGRectGetHeight(footerView.frame);
  self.scrollView.contentInset = insets;
  [footerView setFrameOriginY:self.scrollView.contentSize.height];

  [self yg_addObserver:self forKeyPath:@"scrollView.contentSize" options:NSKeyValueObservingOptionNew context:nil];
  [self.scrollView addSubview:footerView];
  objc_setAssociatedObject(self, kFooterView, footerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
  if ([keyPath isEqualToString:@"scrollView.contentSize"]) {
    [self.footerView setFrameOriginY:self.scrollView.contentSize.height];
    [self.headerView setFrameOriginY:-self.scrollView.contentInset.top];
  }
}

@end
