Pod::Spec.new do |s|
s.name         = "CommonTableView"
s.version      = "1.0"
s.summary      = "CommonTableView let you to use tableview more convenient"
s.homepage     = "https://github.com/wichlin/WLCommonTableView"
s.license      = 'WL (LICENSE)'
s.author       = { "wichlin" => "wichlin@163.com" }
s.platform     = :ios, '6.0'
s.source       = { :git => "https://github.com/wichlin/WLCommonTableView.git", :tag => "1.0" }
s.source_files = 'WLCommonTableView/*.{h,m}'
s.framework    = 'Foundation', 'CoreGraphics', 'UIKit'
s.requires_arc = true
end