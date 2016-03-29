Pod::Spec.new do |s|
  s.name         		= "THCalendarDatePicker"
  s.version      		= "1.2.8"
  s.summary      		= "A DatePicker based on a custom calendar view"
  s.homepage     		= "https://github.com/funky-monkey/THCalendarDatePicker"
  s.license      		= { :type => 'MIT', :file => 'LICENSE.md' }
  s.author       		= { "Hannes Tribus" => "hons82@gmail.com", "Sidney de Koning" => "sidney.dekoning@gmail.com"}
  s.source       		= { :git => "https://github.com/funky-monkey/THCalendarDatePicker.git", :tag => "{s.version}" }
  s.platform     		= :ios, '6.1'
  s.requires_arc 		= true
  s.header_mappings_dir	= 'THCalendarDatePickerExample'
  s.source_files 		= 'THCalendarDatePickerExample/*.{h,m}'
  s.resources 	 		= ["THCalendarDatePickerExample/*.xib", "THCalendarDatePickerExample/Images.xcassets"]
  s.frameworks   	 	=  'QuartzCore'
  s.prefix_header_contents = <<-EOS
	  #define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
	  #define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
	  #define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
	  #define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
	  #define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
    EOS
end
