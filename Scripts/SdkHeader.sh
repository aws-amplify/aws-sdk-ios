echo "correct the way to import framework headers"
find . -name '*.h' | xargs perl -pi -e 's/"Mantle.h"/<Mantle\/Mantle.h>/g'
find . -name '*.h' | xargs perl -pi -e 's/"Bolts.h"/<Bolts\/Bolts.h>/g'
find . -name '*.h' | xargs perl -pi -e 's/"TMCache.h"/<TMCache\/TMCache.h>/g'
find . -name '*.h' | xargs perl -pi -e 's/"BFTask.h"/<Bolts\/BFTask.h>/g'
find . -name '*.h' | xargs perl -pi -e 's/#import "/#import <AWSiOSSDKv2\//g'
find . -name '*.h' | xargs perl -pi -e 's/h"/h>/g'