Pod::Spec.new do |s|
  s.name         = "SDWebImage-CircularProgressView"
  s.version      = "0.1.0"
  s.summary      = "Category for UIImageView. Adds circular, linear or custom progress view. Images downloading by SDWebImage."
  s.description      = <<-DESC
                        Progress View to see how much left to download an Image. It can be Circular or Apples Linear progress view. You can customize colors and other properties in data source.
                        DESC
  s.homepage     = "https://github.com/NikKovV/SDWebImage-CircularProgressView"
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Nik Kov" => "nikkovios@gmail.com" }
  s.source       = { 
  :git => "https://github.com/NikKovV/SDWebImage-CircularProgressView.git",
   :tag => s.version.to_s
    }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Classes/*.{h,m}'
  s.requires_arc = true
  s.frameworks = 'UIKit'
  s.dependency 'SDWebImage', '> 3.7.0'
  s.dependency 'DACircularProgress', '~> 2.3'
end
