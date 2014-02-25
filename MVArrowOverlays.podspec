Pod::Spec.new do |s|
  s.name         = "MVArrowOverlays"
  s.version      = "1.0.0"
  s.summary      = "Custom Arrow drawing classes for first time user experience"

  s.description  = <<-DESC
                    This project includes a simple MVArrow class that can be used to draw arrows in your code.
                   DESC

  s.homepage     = "https://github.com/bizz84/MVArrowOverlays"

  s.license      = { :type => 'MIT', :file => 'LICENSE.md' }

  s.author       = { "Andrea Bizzotto" => "bizz84@gmail.com" }

  s.platform     = :ios, '7.0'

  s.source       = { :git => "https://github.com/bizz84/MVArrowOverlays.git", :tag => '1.0.0' }

  s.source_files = 'MVArrowOverlay/*.{h,m}', 'MVArrowOverlays/*.{h,m}'

  s.resources = "MVArrowOverlays/*.storyboard" 

  s.frameworks = 'UIKit', 'Foundation', 'CoreGraphics'

  s.requires_arc = true

end
