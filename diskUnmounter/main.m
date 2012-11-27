//
//  main.m
//  diskUnmounter
//
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]); //LOL it just works

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSArray *listOfMedia = [[NSWorkspace sharedWorkspace]mountedRemovableMedia];
        unsigned numberOfUnmounted = 0;
        if(![listOfMedia count])
        {
            NSLog(@"Nothing to unmount!");
        }
        else
        {
        for (NSString *path in listOfMedia)
        {
            if([[NSWorkspace sharedWorkspace] unmountAndEjectDeviceAtPath:path])
            {
                NSLog(@"Device %@ unmounted successfully!", path);
                numberOfUnmounted++;
            }
                else
            {
                NSLog(@":-(");
            }
        }
        NSLog(@"%d volumes unmounted", numberOfUnmounted);
    }
        
    }
    return 0;
}

