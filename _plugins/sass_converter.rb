module Jekyll
  # Sass plugin to convert .scss to .css
  # 
  # Note: This is configured to use the new css like syntax available in sass.
  class SassConverter < Converter
    safe     true
    priority :low

    def setup
      return if @setup
      require 'sass'
      @setup = true
    rescue
      STDERR.puts 'do `gem install sass`'
      raise FatalException.new("Missing dependency: haml")
    end

    def matches (ext)
      ext =~ /scss/i
    end

    def output_ext (ext)
      '.css'
    end

    def convert (content)
      setup

      begin
        puts 'Performing Sass Conversion.'

        Sass::Engine.new(content, :syntax => :scss, :style => :compressed).render
      rescue Exception => e
        puts "!!! SASS Error: #{e.message}"
      end
    end
  end
end
