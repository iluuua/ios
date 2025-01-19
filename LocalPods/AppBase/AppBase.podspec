Pod::Spec.new do |s|
    s.name             = 'AppBase'
    s.version          = '0.1.0'
    s.summary          = 'Core pod'

    s.homepage         = 'https://www.example.com'
    s.author           = 'central-university'
    s.source           = { :path => '*' }

    s.static_framework = true

    s.ios.deployment_target = '16.0'
    
    # Sources
    s.source_files = [
        'AppBase/Classes/**/*.{swift}'
    ]
end
