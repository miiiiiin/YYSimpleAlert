#
# Be sure to run `pod lib lint YYSimpleAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YYSimpleAlert'
  s.version          = '0.0.1'
  s.summary          = 'A short description of YYSimpleAlert.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/miiiiiin/YYSimpleAlert'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'miiiiiin' => 'min.songkyung@gmail.com' }
  s.source           = { :git => 'https://github.com/miiiiiin/YYSimpleAlert.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_versions = '5.0'
  s.ios.deployment_target = '13.0'

  s.source_files = 'YYSimpleAlert/Classes/**/*'
  #s.resources = 'YYSimpleAlert/Assets/**/*'
  s.frameworks = 'UIKit'

  s.static_framework = true
 # s.subspec 'Google' do |google|
      #google.source_files = 'Socially/Classes/Google/*', 'Socially/Classes/SociallyAuth/*'
   #   google.dependency 'GoogleSignIn'
  #end
 # s.subspec 'Facebook' do |facebook|
      #facebook.source_files = 'Socially/Classes/Facebook/*', 'Socially/Classes/SociallyAuth/*'
   #   facebook.dependency 'FBSDKLoginKit'
  #end
 
  # s.resource_bundles = {
  #   'YYSimpleAlert' => ['YYSimpleAlert/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'GoogleSignIn'
end

