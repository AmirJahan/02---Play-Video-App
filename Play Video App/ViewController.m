#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
// recommended by apple to not sub class AVPlayerViewController


-(void)playThis:(NSURL *)inpUrl
{
    AVPlayer *player = [AVPlayer playerWithURL:inpUrl];

    // myAvPlayerCtrl *thisOne = [segue destinationViewcon];
    AVPlayerViewController *controller = [[AVPlayerViewController alloc] init];
    [self presentViewController:controller animated:YES completion:nil];
    controller.player = player;
    [player play];
}




- (IBAction)watchOnline:(id)sender {
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://ajcut.com/wp-content/uploads/2014/06/AmirJahanlouReel.mp4"];

    [self playThis: url];
}

- (IBAction)watchOffline:(id)sender {
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"ANTI" withExtension:@"mp4"];
   
    [self playThis: videoURL];

}



- (IBAction)getVideo:(id)sender {
    
    UIImagePickerController* myCtrl = [[UIImagePickerController alloc] init];
    
    myCtrl.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    myCtrl.delegate = self;

    myCtrl.mediaTypes =
    [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
    // https://developer.apple.com/documentation/mobilecoreservices/uttype
   
    [self presentViewController:myCtrl animated:true completion:nil];
}






-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
}






-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [self dismissViewControllerAnimated:true
                             completion:nil];
    
    NSURL *localUrl = (NSURL *) [info objectForKey:UIImagePickerControllerMediaURL];

    [self playThis: localUrl];
}

@end
