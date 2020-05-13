# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def rx_swift
    pod 'RxSwift', '~> 5'
end


target 'Recipes' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  rx_swift
  pod 'RxCocoa', '~> 5'
  pod 'RxBiBinding'
  pod 'SwifterSwift'
  pod 'RxDataSources'
  pod "RxCoreData", "~> 1.0.0"
  pod 'Swinject', '~> 2.5.0'
  pod 'TagListView', '~> 1.0'
  pod 'RxGesture', '~> 3.0.0'
  pod 'ESPullToRefresh'
  pod 'QueryKit'

  target 'CoreDataPlatform' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    rx_swift
    pod 'QueryKit'
  end

  target 'Domain' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    rx_swift
  end
  # Pods for Recipes

#  target 'RecipesTests' do
#    inherit! :search_paths
#    # Pods for testing
#  end

end
