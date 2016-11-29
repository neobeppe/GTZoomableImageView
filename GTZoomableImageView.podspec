Pod::Spec.new do |s|
  s.name         = "GTZoomableImageView"
  s.version      = "1.0.0"
  s.summary      = "summary"
  s.description  = <<-DESC
    Your description here.
  DESC
  s.homepage     = "https://github.com/neobeppe/GTZoomableImageView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Giuseppe Travasoni" => "giuseppe.travasoni@gmail.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/neobeppe/GTZoomableImageView.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
