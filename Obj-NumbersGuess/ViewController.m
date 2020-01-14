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
@property (weak, nonatomic) IBOutlet UISlider *level;
@property (weak, nonatomic) IBOutlet UILabel *stars;
@property (weak, nonatomic) IBOutlet UITextField *guessField;


@end


@implementation ViewController
- (IBAction)guessField:(id)sender {
}
-(int) randGen {
    NSUInteger r = arc4random_uniform(10);
    NSLog (@"%d" , r);
    return r;
}
int point ;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _pointView.text =[NSString stringWithFormat:@"Your Point is %i",point];
    
    [_guessBtn addTarget:self action:@selector(buttonPressed:)
     forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_guessBtn];
    
    
}

- (void)buttonPressed:(UIButton *) guessBtn {
     
    
    int hidden =[self randGen];
    int guess = [_guessField.text integerValue];
    
    if (guess == hidden) {
        NSLog  (@"Thanks");
        _answer.text = @"Yes!!! you have right answer";
        point+1;
       // _pointView.text = _pointView
    }else {
        
        _answer.text = @"No!! Try again";
        point-1;
        
    }
}

@end
