Pod::Spec.new do |s|
  s.name         = "CustomProgressView"
  s.version      = "0.0.1"
  s.summary      = "A short description of CustomProgressView."
  s.homepage     = "https://github.com/un-xhobi/CutomProgressView"
  s.license      = 'MIT'
  s.author       = { "Xhobi" => "un.xhobi2@gmail.com" }
  s.source       = { :git => "https://github.com/un-xhobi/CutomProgressView.git", :tag => "0.0.1" }
  s.platform     = :ios
  s.source_files = 'CustomProgressView'   
  s.framework    = 'CustomProgressViewFramework'
  s.requires_arc = true
  s.ios.deployment_target = '11.0'
  s.swift_version= '5.0'
end
