require_plugin 'tog_core'
require_plugin 'tog_user'
 
Dir[File.dirname(__FILE__) + '/locale/**/*.yml'].each do |file|
  I18n.load_path << file
end
 
 
Tog::Interface.sections(:admin).add "Forums", "/admin/forums"
Tog::Interface.sections(:member).add "Forums", "/member/forums"
Tog::Interface.sections(:site).add "Forums", "/forums"
 
