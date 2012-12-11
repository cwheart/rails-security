lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|   
  s.name = %q{rails-security}   
  s.version = "0.0.2"  
  s.date = %q{2012-12-09}
  s.summary = %{rails security utils}
  s.description = %q{make your rails app more safe}
  s.homepage = %q{http://hi.baidu.com/htcoolwind}
  s.files = Dir["README.md", 'lib/**/*']   
  s.author   = 'heart'
  s.email    = 'xinshuaifeng@126.com'
  s.require_paths = ["lib"]
end  
