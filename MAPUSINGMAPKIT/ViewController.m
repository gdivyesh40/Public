//
//  ViewController.m
//  MAPUSINGMAPKIT
//
//  Created by Divyesh on 25/09/15.
//  Copyright (c) 2015 Divyesh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    #define METERS_PER_MILE 1609.344
    
}
@end

@implementation ViewController
@synthesize mapview;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    mapview.delegate = self;
 
    mapview.showsUserLocation = YES;
    [mapview setMapType:MKMapTypeStandard];
    [mapview setZoomEnabled:YES];
    [mapview setScrollEnabled:YES];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    //NSLog(@"%@", [self deviceLocation]);
    [self locationdetect];
    

}
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapview setRegion:[self.mapview regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapview addAnnotation:point];
    
}
-(void)locationdetect
{
    
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    //NSLog(@"%@", [self deviceLocation]);
    
    
    
    //View Area
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = [self.lati.text floatValue];//self.locationManager.location.coordinate.latitude;
    region.center.longitude = [self.longtitude.text floatValue];//self.locationManager.location.coordinate.longitude;
    region.span.longitudeDelta = 0.005f;
    region.span.longitudeDelta = 0.005f;
    [mapview setRegion:region animated:YES];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate =region.center;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapview addAnnotation:point];
}
- (IBAction)btnaction:(id)sender {
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    region.span.longitudeDelta = 0.0f;
    region.span.longitudeDelta = 0.0f;
    [mapview setRegion:region animated:YES];

    [self locationdetect];
}
@end
