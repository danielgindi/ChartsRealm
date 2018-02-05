Pod::Spec.new do |s|
  s.name = "ChartsRealm"
  s.version = "3.0.5"
  s.summary = "A Realm.io module for Charts"
  s.homepage = "https://github.com/danielgindi/ChartsRealm"
  s.license = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  s.authors = "Daniel Cohen Gindi", "Philipp Jahoda"
  s.ios.deployment_target = "8.0"
  s.tvos.deployment_target = "9.0"
  s.osx.deployment_target = "10.11"
  s.source = { :git => "https://github.com/danielgindi/ChartsRealm.git", :tag => "v#{s.version}" }
  s.source_files  = "ChartsRealm/Classes/**/*.swift"
  s.dependency "Charts", "3.0.5"
  s.dependency "RealmSwift", "~> 3.1.1"
end
