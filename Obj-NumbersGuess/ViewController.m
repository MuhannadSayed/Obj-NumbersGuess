//
//  ViewController.m
//  Obj-NumbersGuess
//
//  Created by Muhannad Sayed Abdullah on 2020-01-14.
//  Copyright © 2020 Muhannad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *answer;

@property (weak, nonatomic) IBOutlet UIButton *guessBtn;
@property (weak, nonatomic) IBOutlet UILabel *pointView;
@property (weak, nonatomic) IBOutlet UITextField *guessField;
@property (nonatomic) int point ;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (nonatomic) int level;
@property (nonatomic) int tempColor;
@property (weak, nonatomic) IBOutlet UILabel *levelShow;
- (IBAction)modifyLevel:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
- (IBAction)colorSeg:(id)sender;




@end


@implementation ViewController
- (IBAction)guessField:(id)sender {
}
-(int) randGen {
    self.level = _stepper.value;
    NSUInteger r = arc4random_uniform(self.level);
    NSLog (@"%d" , r);
    return r;
}


-(void)appearance {
NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
 NSInteger check =
 [settings integerForKey:@"colorCheck"];
    NSLog (@"%li" , (long)check);
 
     [self darkMode:check];
 
     
     
     
}

 

- (void)viewDidLoad {
    [super viewDidLoad];
   //[self appearance];
    
    
    
     
    [_guessBtn addTarget:self action:@selector(buttonPressed:)
     forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_guessBtn];
    
    
 
}

- (void)buttonPressed:(UIButton *) guessBtn {
     
    _levelShow.text = [NSString stringWithFormat: @"Your choosen level is : %f" , _stepper.value];
    _guessField.text=(@"");
    int hidden =[self randGen];
    int guess = [_guessField.text integerValue];
    
    if (guess == hidden) {
        NSLog  (@"Thanks");
        _answer.text = @"Yes!!! you have right answer";
        self.point++;
     _pointView.text =[NSString stringWithFormat:@"Your Point is %i",self.point];
     
    }else {
        
        _answer.text = @"No!! Try again";
        self.point--;
       _pointView.text =[NSString stringWithFormat:@"Your Point is %i",self.point];
        
    }
}

- (IBAction)modifyLevel:(id)sender {   
}



  


    


- (IBAction)colorSeg:(id)sender {
    
    if(self.segment.selectedSegmentIndex == 0){
        _tempColor = 0;
        [self darkMode:_tempColor];
        
    }else{
        _tempColor = 1;
        [self darkMode:_tempColor];
        
        
    }
}
-(void)darkMode: (int)color{
    if (color == 0){
        self.view.backgroundColor=[UIColor whiteColor];
        [[UIView appearance] setBackgroundColor:[UIColor whiteColor]];
        NSUserDefaults *settings = [NSUserDefaults standardUserDefaults]; [settings setInteger:0 forKey:@"colorCheck"];
        [settings synchronize];
        
    }else if (color == 1){
        self.view.backgroundColor = [UIColor darkGrayColor];
        [[UIView appearance] setBackgroundColor:[UIColor darkGrayColor]];
        NSUserDefaults *settings = [NSUserDefaults standardUserDefaults]; [settings setInteger:1 forKey:@"colorCheck"];
        [settings synchronize];
    }
    
    
}
@end
