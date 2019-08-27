Pod::Spec.new do |s|
  s.name         = "GTZoomableImageView"
  s.version      = "1.2.0"
  s.summary      = "View that implements pinch to zoom and double tap zoom gesture for a Image View"

  s.homepage     = "https://github.com/neobeppe/GTZoomableImageView"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Giuseppe Travasoni" => "giuseppe.travasoni@gmail.com" }
  s.social_media_url   = "https://twitter.com/neobeppe"

  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/neobeppe/GTZoomableImageView.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "UIKit"
  s.swift_version = '4.2'
end
