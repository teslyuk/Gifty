//
//  NTMainViewController.m
//  GiftyApp
//
//  Created by Nikita Teslyuk on 30.03.17.
//  Copyright © 2017 Nikita Teslyuk. All rights reserved.
//

#import "NTMainViewController.h"
#import "RKDropdownAlert.h"

@interface NTMainViewController () <RKDropdownAlertDelegate>

@property (nonatomic, strong) CZPickerView *sexPicker;
@property (nonatomic, strong) CZPickerView *agePicker;
@property (nonatomic, strong) CZPickerView *occasionPicker;

@end

@implementation NTMainViewController

#pragma mark - CZPickerViewDataSource

- (NSInteger)numberOfRowsInPickerView:(CZPickerView *)pickerView {
    
    if ([pickerView isEqual:self.sexPicker]) {
        return 2;
    } else if ([pickerView isEqual:self.agePicker]) {
        return 100;
    } else if ([pickerView isEqual:self.occasionPicker]) {
        return 4;
    }
    
    return 0;
}

- (NSAttributedString *)czpickerView:(CZPickerView *)pickerView
               attributedTitleForRow:(NSInteger)row {
    
    NSAttributedString *title = nil;
    
    if ([pickerView isEqual:self.sexPicker]) {
        
        switch (row) {
            case 0:
                title = [[NSAttributedString alloc] initWithString:@"Мужчина" attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir Next" size:18.f] }];
                return title;
                break;
            case 1:
                title = [[NSAttributedString alloc] initWithString:@"Женщина" attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir Next" size:18.f] }];
                return title;
                break;
                
            default:
                break;
        }
        
    } else if ([pickerView isEqual:self.agePicker]) {
        
        title = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld", row + 1] attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir Next" size:18.f] }];
        
        return title;
    
    } else if ([pickerView isEqual:self.occasionPicker]) {
        
        switch (row) {
            case 0:
                title = [[NSAttributedString alloc] initWithString:@"День рождения" attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir Next" size:18.f] }];
                return title;
                break;
            case 1:
                title = [[NSAttributedString alloc] initWithString:@"Новый Год" attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir Next" size:18.f] }];
                return title;
                break;
            case 2:
                title = [[NSAttributedString alloc] initWithString:@"День святого Валентина" attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir Next" size:18.f] }];
                return title;
                break;
            case 3:
                
                if ([self.sexField.text isEqualToString:@"Мужчина"]) {
                    title = [[NSAttributedString alloc] initWithString:@"День защитника Отечества" attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir Next" size:18.f] }];
                    return title;
                } else {
                    title = [[NSAttributedString alloc] initWithString:@"Международный женский день"attributes:@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir Next" size:18.f] }];
                    return title;
                    return title;
                }
                
                break;
            default:
                break;
        }
        
    }
    
    return title;
}

#pragma mark - CZPickerViewDelegate 

- (void)czpickerView:(CZPickerView *)pickerView didConfirmWithItemAtRow:(NSInteger)row {
    
    if ([pickerView isEqual:self.sexPicker]) {
        self.sexField.text = [self czpickerView:pickerView titleForRow:row];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
}

#pragma mark - RKDropdownAlertDelegate

- (BOOL)dropdownAlertWasTapped:(RKDropdownAlert *)alert {
    
    return YES;
    
}

- (BOOL)dropdownAlertWasDismissed {
    
    return YES;
    
}

#pragma mark - Navigation
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showSex"]) {
        
        NTSexViewController *controller = segue.destinationViewController;
        UIPopoverPresentationController *popController = [controller popoverPresentationController];
        popController.permittedArrowDirections = UIPopoverArrowDirectionDown;
        popController.sourceRect = CGRectMake(CGRectGetMidX(self.sexField.bounds), CGRectGetMidY(self.sexField.bounds), 0, 0);
        controller.delegate = self;
        controller.popoverPresentationController.delegate = self;
        controller.preferredContentSize = CGSizeMake(200.f, 88.f);
        
    } else if ([segue.identifier isEqualToString:@"showAge"]) {
        
        NTAgeViewController *controller = segue.destinationViewController;
        UIPopoverPresentationController *popController = [controller popoverPresentationController];
        popController.permittedArrowDirections = UIPopoverArrowDirectionDown;
        popController.sourceRect = CGRectMake(CGRectGetMidX(self.ageField.bounds), CGRectGetMidY(self.ageField.bounds), 0, 0);
        controller.delegate = self;
        controller.popoverPresentationController.delegate = self;
        controller.preferredContentSize = CGSizeMake(375.f, 216.f);
        
    } else if ([segue.identifier isEqualToString:@"showOccasion"]) {
        
        NTOccasionViewController *controller = segue.destinationViewController;
        UIPopoverPresentationController *popController = [controller popoverPresentationController];
        popController.permittedArrowDirections = UIPopoverArrowDirectionDown;
        popController.sourceRect = CGRectMake(CGRectGetMidX(self.occasionField.bounds), CGRectGetMidY(self.occasionField.bounds), 0, 0);
        controller.delegate = self;
        controller.popoverPresentationController.delegate = self;
        controller.preferredContentSize = CGSizeMake(375.f, 216.f);
        
    } else if ([segue.identifier isEqualToString:@"showGifts"]) {
        
        //pass to VC something
        
    }
}*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if (([self.sexField.text isEqualToString:@""] || [self.ageField.text isEqualToString:@""] || [self.occasionField.text isEqualToString:@""]) && [identifier isEqualToString:@"showGifts"]) {
        
        return NO;
    }
    
    return YES;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if ([textField isEqual:self.sexField]) {
        //[self performSegueWithIdentifier:@"showSex" sender:textField];
        self.sexPicker = [[CZPickerView alloc] initWithHeaderTitle:@"Пол" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm"];
        self.sexPicker.headerBackgroundColor = [UIColor whiteColor];
        self.sexPicker.headerTitleColor = [UIColor colorWithRed:0.98039216f green:0.43529412f blue:0.32156863f alpha:1.f];
        self.sexPicker.headerTitleFont = [UIFont systemFontOfSize: 40];
        self.sexPicker.delegate = self;
        self.sexPicker.dataSource = self;
        self.sexPicker.needFooterView = NO;
        [self.sexPicker show];
        return NO;
    } else if ([textField isEqual:self.ageField]) {
        //[self performSegueWithIdentifier:@"showAge" sender:textField];
        self.agePicker = [[CZPickerView alloc] initWithHeaderTitle:@"Возраст" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm"];
        self.agePicker.headerBackgroundColor = [UIColor whiteColor];
        self.agePicker.headerTitleColor = [UIColor colorWithRed:0.98039216f green:0.43529412f blue:0.32156863f alpha:1.f];
        self.agePicker.headerTitleFont = [UIFont systemFontOfSize: 40];
        self.agePicker.delegate = self;
        self.agePicker.dataSource = self;
        self.agePicker.needFooterView = NO;
        [self.agePicker show];
        return NO;
    } else if ([textField isEqual:self.occasionField]) {
        //[self performSegueWithIdentifier:@"showOccasion" sender:textField];
        self.occasionPicker = [[CZPickerView alloc] initWithHeaderTitle:@"Событие" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm"];
        self.occasionPicker.headerBackgroundColor = [UIColor whiteColor];
        self.occasionPicker.headerTitleColor = [UIColor colorWithRed:0.98039216f green:0.43529412f blue:0.32156863f alpha:1.f];
        self.occasionPicker.headerTitleFont = [UIFont systemFontOfSize: 40];
        self.occasionPicker.delegate = self;
        self.occasionPicker.dataSource = self;
        self.occasionPicker.needFooterView = NO;
        [self.occasionPicker show];
        return NO;
    }
    
    return YES;
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    return UIModalPresentationNone;
}

#pragma mark - Actions

- (IBAction)searchButtonAction:(UIButton *)sender {
    
    if ([self.sexField.text isEqualToString:@""] || [self.ageField.text isEqualToString:@""] || [self.occasionField.text isEqualToString:@""]) {
        
        [RKDropdownAlert title:@"Ошибка!"
                       message:@"Заполните все поля для ввода!"
               backgroundColor:[UIColor colorWithRed:0.98039216f green:0.43529412f blue:0.32156863f alpha:1.f]
                     textColor:[UIColor whiteColor]
                          time:1
                      delegate:self];
        
    } else {
        
        //code to be executed
        
    }
    
}

@end
