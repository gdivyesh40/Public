//
//  ViewController.h
//  MAPUSINGMAPKIT
//
//  Created by Divyesh on 25/09/15.
//  Copyright (c) 2015 Divyesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>
@property(nonatomic, retain) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapview;

- (IBAction)btnaction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *lati;
@property (weak, nonatomic) IBOutlet UITextField *longtitude;

@end

