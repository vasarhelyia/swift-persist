Pod::Spec.new do |s|

  s.name         = "swift-persist"
  s.version      = "0.1.0"
  s.summary      = "Swift library for persistent storage on iOS and OS X."
  s.homepage     = "https://github.com/vasarhelyia/swift-persist"
  s.license = { :type => 'BSD', :file => 'LICENSE' }
  s.author    = "vasarhelyia"
  s.social_media_url   = "http://twitter.com/vasarhelyia"
  s.ios.deployment_target = "7.0"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/vasarhelyia/swift-persist.git", :tag => "v0.1.0" }
  s.source_files  = 'PersistentStorage.swift'
  s.exclude_files = "SwiftStorageTest/*"

end
