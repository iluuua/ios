Pod::Spec.new do |s|
    s.name             = 'ProdMobileCore'
    s.version          = '0.1.0'
    s.summary          = 'Core pod'

    s.homepage         = 'https://www.example.com'
    s.author           = 'central-university'
    s.source           = { :path => '*' }

    s.static_framework = true

    s.ios.deployment_target = '16.0'
    
    # Resources

    resources_bundle_name = "#{s.name}Resources"

    resources = [
        "#{s.name}/Resources/Assets/**/*.{xcassets}",
        "#{s.name}/Resources/Localization/**/*.{strings,stringsdict}"
    ]

    s.resource_bundles = {
        resources_bundle_name => resources
    }

    # Sources
    
    s.source_files = [
        'ProdMobileCore/Classes/**/*.{swift}'
    ]
end
