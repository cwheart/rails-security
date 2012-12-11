module RailsSecurity
  module Xss
    SAFE_TAGS = %w(span div p font)
    TAG_BEG = "[rs:beg]"
    TAG_END = "[rs:end]"
    
    class << self
      def html_safe(str)
        str = replace_keyword(str)
        str = replace_tag(str)
        str = replace_dirty(str)
        str = revert_tag(str)
      end
      
      private
      def replace_keyword(str)
        str.gsub(/\[(rs\:(beg|end))\]/, "&#91;\\1&#93;")
      end
      def replace_tag(str)
        str.gsub(instance_safe_reg, "#{TAG_BEG}\\1#{TAG_END}")
      end
      def replace_dirty(str)
        str.gsub(/</, "&lt;").gsub(/>/, "&gt;")
      end
      def revert_tag(str)
        str.gsub(/\[rs:beg\]/, "<").gsub(/\[rs:end\]/, ">")
      end
      def instance_safe_reg
        Regexp.compile("<(\/?(?:#{SAFE_TAGS.join('|')})(?:\\s+[a-z0-9\\s_=\\-\\'"+'\"'+"\\s;\\:#]+)?)>")
      end
    end
  end
end

class String
  def xss_safe
    RailsSecurity::Xss.html_safe(self)
  end
end
