//
//  BlueAudioSourceiOS.h
//  BlueAudioSourceiOS
//
//  Created by Stehling, Brennan on 1/12/22.
//  Copyright © 2022 Amazon.com, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for BlueAudioSourceiOS.
FOUNDATION_EXPORT double BlueAudioSourceiOSVersionNumber;

//! Project version string for BlueAudioSourceiOS.
FOUNDATION_EXPORT const unsigned char BlueAudioSourceiOSVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <BlueAudioSourceiOS/PublicHeader.h>

#import <BlueAudioSourceiOS/BFAudioSource.h>
#import <BlueAudioSourceiOS/BFAudioSourceDelegate.h>
#import <BlueAudioSourceiOS/BFDecoder.h>
#import <BlueAudioSourceiOS/BFOpusDecoder.h>
#import <BlueAudioSourceiOS/BFAudioEncoding.h>
#import <BlueAudioSourceiOS/BFEncoder.h>
#import <BlueAudioSourceiOS/BFLPCM16Encoder.h>
#import <BlueAudioSourceiOS/BFOpusEncoder.h>
#import <BlueAudioSourceiOS/BFAudioSourceError.h>
#import <BlueAudioSourceiOS/BFAudioRecorder.h>
#import <BlueAudioSourceiOS/BFVADConfig.h>
#import <BlueAudioSourceiOS/BFVoiceActivityDetector.h>
#import <BlueAudioSourceiOS/BFVoiceActivityDetectorDelegate.h>
