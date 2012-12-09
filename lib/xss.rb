# -*- coding: undecided -*-
module RailsSecurity
  module Xss
    safe_tag_names = %w(span div p font)
    reg = /<\/?span\s*[a-zA-Z0-9=_\-\s;]*\s*>/
    def replace_tag
      
    end

    def replace_keywork(str)
      str.gsub(/¡Ü/, "&le;").gsub(/¡Ý/, '&ge;');
    end

    def replace_dirty(str)
      str.gsub(/</, "&lt;").gsub(/>/, "&gt;")
    end

    def revert_tag
      
    end
  end
end
