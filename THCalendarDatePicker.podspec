Pod::Spec.new do |s|
  s.name         		= "THCalendarDatePicker"
  s.version      		= "1.2.7"
  s.summary      		= "A DatePicker based on a custom calendar view"
  s.homepage     		= "https://github.com/funky-monkey/THCalendarDatePicker"
  s.license      		= { :type => 'MIT', :file => 'LICENSE.md' }
  s.author       		= { "Hannes Tribus" => "hons82@gmail.com", "Sidney de Koning" => "sidney.dekoning@gmail.com"}
  s.source       		= { :git => "https://github.com/funky-monkey/THCalendarDatePicker.git", :tag => spec.version.to_s }
  s.platform     		= :ios, '6.1'
  s.requires_arc 		= true
  s.header_mappings_dir	= 'THCalendarDatePicker'
  s.source_files 		= 'THCalendarDatePicker/*.{h,m}'
  s.resources 	 		= ["THCalendarDatePicker/*.xib", "THCalendarDatePicker/Images.xcassets"]
  s.frameworks   	 	=  'QuartzCore'
  s.prefix_header_contents = <<-EOS
	  #define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
	  #define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
	  #define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
	  #define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
	  #define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
    EOS
end
