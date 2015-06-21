//
//  ViewController.m
//  Calculadora de anos
//
//  Created by Fabio Gelbcke on 10/31/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *y1;
@property (strong, nonatomic) IBOutlet UITextField *m1;
@property (strong, nonatomic) IBOutlet UITextField *y2;
@property (strong, nonatomic) IBOutlet UITextField *m2;
@property (strong, nonatomic) IBOutlet UITextField *factor;

@end

@implementation ViewController

-(void)handleSingleTap
{
    [self.y1 resignFirstResponder];
    [self.y2 resignFirstResponder];
    [self.m1 resignFirstResponder];
    [self.m2 resignFirstResponder];
    [self.factor resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap)];
    [self.view addGestureRecognizer:singleTap];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)plus {
    int year;
    int month;
    
    month = ([self.m2.text intValue] + [self.m1.text intValue])%12;
    year = ([self.y1.text intValue] + [self.y2.text intValue]);
    if ([self.m2.text intValue] + [self.m1.text intValue] >= 12)
        year++;
    self.y1.text = [NSString stringWithFormat:@"%d",year];
    self.m1.text = [NSString stringWithFormat:@"%d",month];
    self.y2.text=@"";
    self.m2.text=@"";
    
}
- (IBAction)minus {
    int year;
    int month;
    
    year = ([self.y1.text intValue] - [self.y2.text intValue]);
    if ([self.m2.text intValue] > [self.m1.text intValue])
        year--;
    month = ([self.m1.text intValue] - [self.m2.text intValue])%12;
    if (month<0){
        month = month +12;
    }
    self.y1.text = [NSString stringWithFormat:@"%d",year];
    self.m1.text = [NSString stringWithFormat:@"%d",month];
    self.y2.text=@"";
    self.m2.text=@"";
}

- (IBAction)divided {
    double totalmonths;
    int month;
    int year;
    totalmonths = ([self.y1.text intValue] * 12) + [self.m1.text intValue];
    totalmonths = totalmonths/[self.factor.text doubleValue];
    month = (int)totalmonths%12;
    year = (int)(totalmonths/12);
    self.y1.text = [NSString stringWithFormat:@"%d",year];
    self.m1.text = [NSString stringWithFormat:@"%d",month];
    self.factor.text=@"";
    
}


- (IBAction)multiplied {
    double totalmonths;
    int month;
    int year;
    totalmonths = ([self.y1.text intValue] * 12) + [self.m1.text intValue];
    totalmonths = totalmonths*[self.factor.text doubleValue];
    month = (int)totalmonths%12;
    year = (int)(totalmonths/12);
    self.y1.text = [NSString stringWithFormat:@"%d",year];
    self.m1.text = [NSString stringWithFormat:@"%d",month];
    self.factor.text = @"";
}


@end
