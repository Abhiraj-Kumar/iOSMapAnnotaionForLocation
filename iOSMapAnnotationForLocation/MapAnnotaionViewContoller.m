//
//  MapAnnotaionViewContoller.m
//  iOSMapAnnotationForLocation
//
//  Created by Abhiraj on 16/05/15.
//  Copyright (c) 2015 Self. All rights reserved.
//

#import "MapAnnotaionViewContoller.h"

#define xdivision 4
#define ydivison 4


@interface MapAnnotaionViewContoller (){
    
    __weak IBOutlet MKMapView *mkMapView;
    MKPointAnnotation *annotion, *redannotion,*greenannotion,*blueannotaion,*purrpleannotaion;
    CGPoint bottomRight;
    CLLocationCoordinate2D x,y[100],temp[100];
    NSMutableArray *coordinates;
    UISwipeGestureRecognizer *swipeGesture;
}
-(void)do;
-(int)generateRandomnumber:(int)limit;
@end

@implementation MapAnnotaionViewContoller

- (void)viewDidLoad {
    [super viewDidLoad];
    mkMapView.delegate=self;
    bottomRight = CGPointMake(130,130);
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]
                                         init];
   panGesture.delegate=self;
    [mkMapView addGestureRecognizer: panGesture];
////    swipeGesture =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
////    //swipeGesture.numberOfTouchesRequired=1;
////   [swipeGesture setDirection:(UISwipeGestureRecognizerDirectionDown)];
////    //swipeGesture.delegate=self;
////    [mkMapView addGestureRecognizer:swipeGesture];
//    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc]
//                                   initWithTarget:self action:@selector(handleGesture:)];
//    tgr.numberOfTapsRequired = 1 ;
//   // tgr.delegate=self;
//    //tgr.numberOfTouchesRequired = 1;
//    [mkMapView addGestureRecognizer:tgr];
//[mkMapView convert]
    // Do any additional setup after loading the view from its nib.
}


- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded)
        
        return;
    
    
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer  shouldRecognizeSimultaneouslyWithGestureRecognizer :(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}


-(void)viewDidAppear:(BOOL)animated{
    //x=nil;
    
   // bottomRight = CGPointMake(mkMapView.frame.size.width/2, mkMapView.frame.size.height/2);
    

    
     //annotion= [[MKPointAnnotation alloc]init];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered{
   // [self do];
}
-(void)do{
    [mkMapView removeAnnotations:mkMapView.annotations];
    bottomRight = CGPointMake(mkMapView.frame.size.width/2, mkMapView.frame.size.height/2);
    for (int i=0;i<100; i++)
    {
    bottomRight =  CGPointMake([self generateRandomnumber:mkMapView.frame.size.width]
                               ,[self generateRandomnumber:mkMapView.frame.size.height]);
    x=[mkMapView convertPoint:bottomRight toCoordinateFromView:mkMapView];
    y[i]=x;
   
    annotion= [[MKPointAnnotation alloc]init];
    
    
    
    
    
    
    
    //CGPoint topLeft= CGPointMake(0, 0);
    //if (x) {x=[mkMapView convertPoint:bottomRight toCoordinateFromView:mkMapView]};
    annotion.coordinate= y[i];
    annotion.title = @"Where am I?";
    annotion.subtitle = @"I'm here!!!";
        // =MKPinAnnotationColorGreen;
    //annotion.pincolor=
    [mkMapView addAnnotation:annotion];
    }
}
-(void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error{
    //[self do];
}


-(void)swipe:(UIGestureRecognizer *)gestureRecognizer{
    [self annotionupdate];
    
}


- (void)mapView:(MKMapView *)theMapView regionDidChangeAnimated: (BOOL)animated
{
    
//    NSLog (@"%@",mkMapView.gestureRecognizers);
//    for (UIPanGestureRecognizer *p in mkMapView.gestureRecognizers)
//    {
//        if (p.state==UIGestureRecognizerStateEnded)
//        {NSLog(@"Abhi %@",p);
//            return;
//        }
//    }
    
    [self annotionupdate];
   //[mkMapView removeAnnotations:mkMapView.annotations];
    

}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation: (id<MKAnnotation>)annotation2 {
    
    static NSString *identifier = @"PinAnnotation";
    MKPinAnnotationView *pinAnnotation= (MKPinAnnotationView *) [mkMapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (pinAnnotation==nil){
        pinAnnotation = [[ MKPinAnnotationView alloc]init];}

    // map1 should be visible in method context
    if ([annotation2.subtitle isEqual:@"5+"])
    {
              pinAnnotation.pinColor = MKPinAnnotationColorPurple;// or any you want
      
        pinAnnotation.canShowCallout=YES;
        return pinAnnotation;
    }
    if ([annotation2.subtitle isEqual:@"10+"])

    {
        pinAnnotation.pinColor = MKPinAnnotationColorGreen;// or any you want
        
        pinAnnotation.canShowCallout=YES;
        return pinAnnotation;
    }
    else  if ([annotation2 isEqual:greenannotion])
    {
        pinAnnotation.pinColor = MKPinAnnotationColorGreen;// or any you want
        
        pinAnnotation.canShowCallout=YES;
        return pinAnnotation;
    }
    


    
            
    
        
    return nil;
}
- (IBAction)buttonclicked:(id)sender {
    [self do];
}

- (IBAction)arrange:(UIButton *)sender {
    [self annotionupdate];
//    [mkMapView removeAnnotations:mkMapView.annotations];
//    float xgap =mkMapView.frame.size.width/xdivision;
//    float ygap =mkMapView.frame.size.height/ydivison;
//    for (int i=0;i<xdivision;i++)
//    {
//        for (int j=0;j<ydivison;j++)
//        {
//           [self divide:xgap width:ygap startx:i*xgap starty:j*ygap];
//        }
//    }
    //[self divide:mkMapView.frame.size.width/2 width:mkMapView.frame.size.height/2 startx:0 starty:0];
    
}

-(void) annotionupdate{
    [mkMapView removeAnnotations:mkMapView.annotations];
    float xgap =mkMapView.frame.size.width/xdivision;
    float ygap =mkMapView.frame.size.height/ydivison;
    CGPoint ex = [mkMapView convertCoordinate:y[0] toPointToView:mkMapView];
    float xextra=fmod(ex.x,mkMapView.frame.size.width/xdivision);
    float yextra=fmod(ex.y,mkMapView.frame.size.height/ydivison);
    for (int i=0;i<xdivision;i++)
    {
        for (int j=0;j<ydivison;j++)
        {
            [self divide:xgap width:ygap startx:i*xgap+xextra starty:j*ygap+yextra];
            [self divide:xgap width:ygap startx:-i*xgap+xextra starty:j*ygap+yextra];
            [self divide:xgap width:ygap startx:-i*xgap+xextra starty:-j*ygap+yextra];
            [self divide:xgap width:ygap startx:i*xgap+xextra starty:-j*ygap+yextra];
        }
    }
   
    

}
- (IBAction)show:(UIButton *)sender {
    for (int i=0;i<100; i++)
    {
        
        annotion= [[MKPointAnnotation alloc]init];
        
        
        
        
        
        
        
        //CGPoint topLeft= CGPointMake(0, 0);
        //if (x) {x=[mkMapView convertPoint:bottomRight toCoordinateFromView:mkMapView]};
        annotion.coordinate= y[i];
        annotion.title = @"Where am I?";
        annotion.subtitle = @"I'm here!!!";
        // =MKPinAnnotationColorGreen;
        //annotion.pincolor=
        [mkMapView addAnnotation:annotion];
    }
    }

-(void) divide:(float)length width:(float)breadth startx:(float)cordinatex starty:(float)cordinatey{
    CGRect rect= CGRectMake(cordinatex, cordinatey, length, breadth);
    int count=0;
    for (int i=0;i<100;i++){
        CGPoint xx =[mkMapView convertCoordinate:y[i] toPointToView:mkMapView];
        if (CGRectContainsPoint(rect,xx))
            {
                temp[count]=y[i];
                count++;
                x=y[i];
                
            }
        
    }
    x.latitude=0;
    x.longitude=0;
    for (int i=0;i<count;i++)
    {
        x.latitude+=temp[i].latitude;
        x.longitude+=temp[i].longitude;
    }
    x.latitude/=count;
    x.longitude/=count;
    if (count>10){
        redannotion= [[MKPointAnnotation alloc]init];
        redannotion.title = [NSString stringWithFormat:@"%d",count];
       // bottomRight = CGPointMake(cordinatex+length/2, cordinatey+breadth/2);
        bottomRight = [mkMapView convertCoordinate:x toPointToView:mkMapView];
        redannotion.coordinate=[mkMapView convertPoint:bottomRight toCoordinateFromView:mkMapView];
        
        
        
        redannotion.subtitle = @"10+";
        // =MKPinAnnotationColorGreen;
        //annotion.pincolor=
        [mkMapView addAnnotation:redannotion];
    }
   else  if (count>1){
        redannotion= [[MKPointAnnotation alloc]init];
        redannotion.title = [NSString stringWithFormat:@"%d",count];
        //bottomRight = CGPointMake(cordinatex+length/2, cordinatey+breadth/2);
       bottomRight = [mkMapView convertCoordinate:x toPointToView:mkMapView];
        redannotion.coordinate=[mkMapView convertPoint:bottomRight toCoordinateFromView:mkMapView];
        
        
        
        redannotion.subtitle = @"5+";
        // =MKPinAnnotationColorGreen;
        //annotion.pincolor=
        [mkMapView addAnnotation:redannotion];
    }
   else if (count==1){
       redannotion= [[MKPointAnnotation alloc]init];
       redannotion.title = [NSString stringWithFormat:@"%d",count];
       bottomRight = CGPointMake(cordinatex+length/2, cordinatey+breadth/2);
       bottomRight = [mkMapView convertCoordinate:x toPointToView:mkMapView];
       redannotion.coordinate=[mkMapView convertPoint:bottomRight toCoordinateFromView:mkMapView];
       
       
       
       redannotion.subtitle = @"1+";
       // =MKPinAnnotationColorGreen;
       //annotion.pincolor=
       [mkMapView addAnnotation:redannotion];
   }


    
}

-(int)generateRandomnumber:(int)limit{
    return arc4random()%limit;
}



@end
