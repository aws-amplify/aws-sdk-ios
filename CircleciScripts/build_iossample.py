from functions import runcommand
import sys
import os
import glob
import ntpath

def buildproject(projectfolder, workspace, scheme):
    print("build '{0}' ...".format(workspace))
    rn = runcommand(command = "pod install --verbose", workingdirectory=projectfolder);
    if rn != 0:
        print("Failed to install cocoapod for '{0}'".format(projectfolder))
        return rn

    rn = runcommand(command = "xcodebuild build -workspace {0}  -scheme {1}  -sdk iphonesimulator".format(workspace, scheme), workingdirectory=projectfolder); 
    return rn   

root = sys.argv[1]

projects = [
"CognitoAuth-Sample",
"IoT-Sample",
"Lex-Sample",
"Polly-Sample",
"S3TransferUtility-Sample",
"CognitoYourUserPools-Sample"
]

projecttypes = [
"Objective-C",
"Swift"
]
exitcode = 0 
for project in projects:
    for projecttype in projecttypes:
        projectfolder = os.path.join(root, project, projecttype)
        if os.path.isdir(projectfolder):
            workspaces = glob.glob(projectfolder + "/*.xcworkspace")
            for workspace in workspaces:
                scheme = os.path.splitext(ntpath.basename(workspace))[0]               
                rn = buildproject(projectfolder, workspace, scheme)
                if rn != 0 :
                    print("Failed to build '{0}'".format(workspace))
                    exitcode = 1

exit(exitcode)


