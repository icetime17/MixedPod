Pod::Spec.new do |s|

s.name         = "MixedPod"
s.version      = "0.0.1"
s.summary      = "MixedPod"

s.description  = <<-DESC
    MixedPod.
DESC

s.homepage     = "www"
s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
                © 2020-2030 icetime. All rights reserved.
                LICENSE
}
s.author       = { "Chris Hu" => "work.chris.hu@outlook.com" }

s.requires_arc = true
s.platform     = :ios, "10.0"
s.ios.deployment_target = "10.0"

s.source       = { :git => "", :tag => s.version }
s.source_files = ["Sources/*.{swift,h,m,mm}"]
s.public_header_files = ["Sources/**/*.h"]

end
