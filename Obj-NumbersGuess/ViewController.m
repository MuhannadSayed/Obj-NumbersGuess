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

@property (weak, nonatomic) IBOutlet UILabel *stars;
@property (weak, nonatomic) IBOutlet UITextField *guessField;
@property (nonatomic) int point ;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (nonatomic) int level;
@property (weak, nonatomic) IBOutlet UILabel *levelShow;

- (IBAction)modifyLevel:(id)sender;

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




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [_guessBtn addTarget:self action:@selector(buttonPressed:)
     forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_guessBtn];
 
}

- (void)buttonPressed:(UIButton *) guessBtn {
     
    _guessField.text=(@"");
    int hidden =[self randGen];
    int guess = [_guessField.text integerValue];
    
    if (guess == hidden) {
        NSLog  (@"Thanks");
        _answer.text = @"Yes!!! you have right answer";
        self.point++;
     _pointView.text =[NSString stringWithFormat:@"Your Point is %i",self.point];
       // _pointView.text = _pointView
    }else {
        
        _answer.text = @"No!! Try again";
        self.point--;
       _pointView.text =[NSString stringWithFormat:@"Your Point is %i",self.point];
        
    }
}

- (IBAction)modifyLevel:(id)sender {
    
    _levelShow.text = [NSString stringWithFormat: @"Your choosen level is : %i" , self.level];
    
    
    
    
}
@end
