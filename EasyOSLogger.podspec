#
# Be sure to run `pod lib lint EasyOSLogger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasyOSLogger'
  s.version          = '0.1.1'
  s.summary          = 'A swift logger using OSLog'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Provides a lightweight Swift logging framework which supports Unified Logging.
                       DESC

  s.homepage         = 'https://github.com/gsabatie/EasyOSLogger'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gsabatie' => 'gsabatie@me.com' }
  s.source           = { :git => 'https://github.com/gsabatie/EasyOSLogger.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.0'
  s.source_files = 'EasyOSLogger/Classes/**/*'
  
  # s.resource_bundles = {
  #   'EasyOSLogger' => ['EasyOSLogger/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
