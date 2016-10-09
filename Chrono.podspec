#
# Be sure to run `pod lib lint Chrono.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Chrono'
  s.version          = '0.1.0'
  s.summary          = 'Chrono is a lightweight and easy-to-use timer for profiling code on iOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Chrono is a tool aimed at profiling the time certain operations in your code takes.
                       DESC

  s.homepage         = 'https://github.com/larssondaniel/Chrono'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daniel Larsson' => 'hello@larssondaniel.com' }
  s.source           = { :git => 'https://github.com/larssondaniel/Chrono.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Chrono/Classes/*'
  
  # s.resource_bundles = {
  #   'Chrono' => ['Chrono/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
