#
# Be sure to run `pod lib lint BluetoothMessageProtocol.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BluetoothMessageProtocol'
  s.version          = '0.1.0'
  s.summary          = 'Encoding and Decoding of th Bluetooth Message Protocol.'


  s.description      = <<-DESC
Encoding and Decoding of th Bluetooth Message Protocol.
                       DESC

  s.homepage         = 'https://github.com/khoogheem/BluetoothMessageProtocol'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kevin A. Hoogheem' => 'kevin@hoogheem.net' }
  s.source           = { :git => 'https://github.com/FitnessKit/BluetoothMessageProtocol.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'

  s.source_files = 'BluetoothMessageProtocol/Classes/**/*'
  

  s.dependency 'FitnessUnits', '~> 1.0.0'
end
