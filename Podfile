# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'PROD-Mobile' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Local Pods
  pod 'Solution', :path => 'LocalPods/Solution'
  pod 'ProdMobileCore', :path => 'LocalPods/ProdMobileCore'
  pod 'AppBase', :path => 'LocalPods/AppBase'

  target 'PROD-MobileTests' do
    inherit! :search_paths

    # Pods for testing
    pod 'iOSSnapshotTestCase'

  end

end
