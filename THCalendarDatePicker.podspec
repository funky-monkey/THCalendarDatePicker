Pod::Spec.new do |s|
  s.name         		= "THCalendarDatePicker"
  s.version      		= "1.3.4"
  s.summary      		= "A DatePicker based on THCalendarDatePicker based on a custom calendar view"
  s.homepage     		= "https://github.com/funky-monkey/THCalendarDatePicker"
  s.license      		= { :type => 'MIT', :file => 'LICENSE.md' }
  s.author       		= { "Hannes Tribus" => "hons82@gmail.com", "Sidney de Koning" => "sidney.dekoning@gmail.com"}
  s.source       		= { :git => "https://github.com/funky-monkey/THCalendarDatePicker.git", :tag => "{s.version}" }
  s.platform     		= :ios, '7.0'
  s.requires_arc 		= true
  s.header_mappings_dir	= 'SDKCalendarDatePicker'
  s.source_files 		= 'SDKCalendarDatePicker/Source/*.{h,m}'
  s.resources 	 		= ["SDKCalendarDatePicker/Source/*.xib", "SDKCalendarDatePicker/Source/Images.xcassets"]
  s.frameworks   	 	=  'QuartzCore'
end
