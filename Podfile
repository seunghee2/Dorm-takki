# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Dorm+takki' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Dorm+takki
  pod 'Charts', :git => 'https://github.com/danielgindi/Charts.git', :branch => 'master'
  pod 'AZSClient'
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
        config.build_settings['SDKROOT'] = 'iphoneos10'
      end
    end
  end
end
