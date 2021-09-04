#
# Be sure to run `pod lib lint BluetoothMessageProtocol.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BluetoothMessageProtocol'
  s.version          = '2.0.1'
  s.summary          = 'Encoding and Decoding of the Bluetooth Message Protocol.'


  s.description      = <<-DESC
Encoding and Decoding of the Bluetooth Message Protocol.  Makes creating apps using BLE easy.

Support for HomeKit, BLE Mesh and Custom Services/Characteristics.
                       DESC

  s.homepage            = 'https://github.com/FitnessKit/BluetoothMessageProtocol'
  s.documentation_url   = 'https://fitnesskit.github.io/BluetoothMessageProtocol/'
  s.license             = { :type => 'MIT', :file => 'LICENSE' }
  s.author              = { 'Kevin A. Hoogheem' => 'kevin@hoogheem.net' }
  s.source              = { :git => 'https://github.com/FitnessKit/BluetoothMessageProtocol.git', :tag => s.version.to_s }
  s.swift_versions      = ['5.0', '5.1', '5.2', '5.3', '5.4', '5.5']
  
#Targets
  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'

#Source
  s.source_files = 'Sources/BluetoothMessageProtocol/**/*'

#Required Frameworks
#  s.ios.framework       = [ 'Dispatch' ]

#Dependancy
  s.dependency 'DataDecoder', '>= 5.0.0'
  s.dependency 'FitnessUnits', '>= 3.1.0'
  s.dependency 'CryptoSwift'

end
