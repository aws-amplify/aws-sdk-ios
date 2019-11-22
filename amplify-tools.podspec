#
# Be sure to run `pod lib lint amplify-tools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'amplify-tools'
    s.version          = '2.12.2'
    s.summary          = 'Installs Amplify CLI'
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  
    s.description      = <<-DESC
  Creates an amplify project in your next build. Generate models by setting modelgen in amplifyxc.config to true and running the build. Push your resources to the cloud by setting amplifyPush in amplifyxc.config to true and running the build.
                         DESC
  
    s.homepage         = 'https://github.com/aws-amplify/amplify-cli'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Amplify CLI' => 'amplify-cli@amazon.com' }
    s.source           = { :git => 'https://github.com/nikhname/aws-sdk-ios.git', :tag => s.version.to_s, :branch => 'podspec' }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
    s.ios.deployment_target = '9.0'
    s.swift_versions = '4.0'
    s.source_files = 'packages/*'
    
    s.script_phase = {
      :name => 'Amplify',
      :script =>
  'set -e
  export PATH=$PATH:`npm bin -g`
  
  cd ..
  if ! which node > /dev/null; then
    echo "warning: Node is not installed. Vist https://nodejs.org/en/download/ to install it"
  elif [ ! -f ./amplifyxc.config ]; then
    npx amplify-app@canary --platform ios --path $PWD
  fi
  
  . amplifyxc.config
  amplifyPush=$push
  amplifyModelgen=$modelgen
  amplifyProfile=$profile
  amplifyAccessKey=$accessKeyId
  amplifySecretKey=$secretAccessKey
  amplifyRegion=$region
  amplifyEnvName=$envName
  
  if $amplifyModelgen; then 
    amplify codegen model
  fi
  
  if [ -z "$amplifyAccessKey" ] || [ -z "$amplifySecretKey" ] || [ -z "$amplifyRegion" ]; then
  AWSCLOUDFORMATIONCONFIG="{\
  \"configLevel\":\"project\",\
  \"useProfile\":true,\
  \"profileName\":\"${amplifyProfile}\"\
  }"
  else 
  AWSCLOUDFORMATIONCONFIG="{\
  \"configLevel\":\"project\",\
  \"useProfile\":true,\
  \"profileName\":\"${amplifyProfile}\",\
  \"accessKeyId\":\"${amplifyAccessKeyId}\",\
  \"secretAccessKey\":\"${amplifySecretAccessKey}\",\
  \"region\":\"${amplifyRegion}\"\
  }"
  fi
  
  if [ -z "$amplifyEnvName" ]; then 
  AMPLIFY="{\
  \"envName\":\"amplify\"\
  }"
  else
  AMPLIFY="{\
  \"envName\":\"${amplifyEnvName}\"\
  }"
  fi
  
  PROVIDERS="{\
  \"awscloudformation\":$AWSCLOUDFORMATIONCONFIG\
  }"
  
  if $amplifyPush; then
      if test -f ./amplify/.config/local-env-info.json; then
          amplify push --yes
      else 
          amplify init --amplify $AMPLIFY --providers $PROVIDERS --yes
      fi
  fi',
      :execution_position => :before_compile
    }
    
    # s.resource_bundles = {
    #   'amplify-tools' => ['amplify-tools/Assets/*.png']
    # }
  
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
  end
  
