//
//  MapAnnotaionViewContoller.h
//  iOSMapAnnotationForLocation
//
//  Created by Abhiraj on 16/05/15.
//  Copyright (c) 2015 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>


@interface MapAnnotaionViewContoller : UIViewController<MKMapViewDelegate,UIGestureRecognizerDelegate>
- (IBAction)buttonclicked:(id)sender;
- (IBAction)arrange:(UIButton *)sender;
- (IBAction)show:(UIButton *)sender;

@end
