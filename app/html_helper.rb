#!/usr/bin/env ruby

require "htmlbeautifier"

module HtmlHelper
  class Html
    def initialize()
      @head = ""
      @body = ""
    end

    def title(text = "")
      @head += "<title>#{text}"
      yield if block_given?
      @head += "</title>"
    end

    def meta(**parameters)
      if parameters
        @head += "<meta "
        for key, value in parameters
          @head += " #{key} = \"#{value}\""
        end
        @head += "</meta>"
      end
    end

    def script(src = "")
      @head += "<script src = \"#{src}\"></script>"
    end

    def style(**parameters)
      if parameters
        @head += "\n<style>"
        for key, value in parameters
          @head += "\n#{key} {#{value}}"
        end
        @head += "</style>"
      end
    end

    def apply_style(**parameters)
      return if !parameters
      @body += " style=\"#{parameters[:style]}\"" if parameters[:style]
      @body += " class=\"#{parameters[:class]}\"" if parameters[:class]
      @body += " id=\"#{parameters[:id]}\"" if parameters[:id]
      if parameters[:others]
        for key, value in parameters[:others]
          @body += " #{key}=\"#{value}\""
        end
      end
    end

    def method_missing(m, *args, &block)
      first, middle, last = args
      title = first && first.kind_of?(String) ? first : ""
      attributes = middle && middle != first && args.count > 1 && middle.kind_of?(String) ? middle : ""
      last = middle if args.count <= 2
      styles = last && last != first && args.count > 1 && last.kind_of?(Hash) ? last : {}
      general_tag(m, title, attributes, **styles, &block)
    end

    def general_tag(tag = "", text = "", attribute = "", **styles, &block)
      return if !tag || tag.empty?
      @body += "\n<#{tag}"
      @body += " #{attribute}" if attribute && !attribute.empty?
      apply_style **styles
      @body += ">#{text}"
      yield if block_given?
      @body += "</#{tag}>"
    end

    def link(text = "", link = "", **parameters, &block)
      general_tag("a", text, "href=#{link}", **parameters, &block)
    end

    def css_link(link = "", **parameters, &block)
      general_tag("link", "", "rel = 'stylesheet' href=#{link}", **parameters, &block)
    end

    def comment(text)
      @body += "<!--#{text}-->"
    end

    def image(src, **parameters)
      @body += "<img src=#{src}"
      @body += " alt=#{parameters[:alt]}" if parameters[:alt]
      @body += " width=\"#{parameters[:width]}\"" if parameters[:width]
      @body += " height=\"#{parameters[:height]}\"" if parameters[:height]
      apply_style **parameters
      @body += "/>"
    end

    def header_render(content)
      @head += content
    end

    def render(content)
      @body += content if !content.nil?
    end

    def html
      text = <<DOC
<!DOCTYPE html>
<html>
  <head>
    #{@head}
  </head>
  <body>
    #{@body}
  </body>
</html>
DOC
      formatted = HtmlBeautifier.beautify(text)
      return formatted
    end

    def body
      formatted = HtmlBeautifier.beautify(@body)
      return formatted
    end
  end

  class Form
    def initialize(**parameters, &block)
      @content = "<form"
      for k, v in parameters
        @content += " #{k} = \"#{v}\""
      end
      @content += ">"
      yield self if block_given?
      @content += "</form>"
    end

    def control(**parameters, &block)
      @content += "\n<input"
      @content += " type=\"#{parameters[:type]}\"" if parameters[:type]
      @content += " name=\"#{parameters[:name]}\"" if parameters[:name]
      @content += " value=\"#{parameters[:value]}\"" if parameters[:value]
      if parameters[:others]
        for key, value in parameters[:others]
          @content += " #{key}=\"#{value}\""
        end
      end
      @content += " />"
    end

    def select(**parameters, &block)
      @content += "\n<select "
      @content += " name=\"#{parameters[:name]}\"" if parameters[:name]
      if parameters[:others]
        for key, value in parameters[:others]
          @content += " #{key}=\"#{value}\""
        end
      end
      @content += ">"
      yield self if block_given?
      @content += "</select>"
    end

    def option(**parameters, &block)
      @content += "\n<option "
      @content += " value = \"#{parameters[:value]}\"" if parameters[:value]
      if parameters[:others]
        for key, value in parameters[:others]
          @content += " #{key}=\"#{value}\""
        end
      end
      @content += ">"
      @content += "#{parameters[:title]}" if parameters[:title]
      @content += "</option>"
    end

    def getForm
      @content
    end
  end
end

h = HtmlHelper::Html.new
h.p "paragraph"
h.p "paragraph with class", class: "class-paragraph"
h.p "paragraph with class and id", class: "class-paragraph", id: "id-paragraph"
h.p "paragraph with class , id and attribute", 'text="wang"', class: "class-paragraph", id: "id-paragraph"
h.p "paragraph with class , id, attribute and block", 'text="wang"', class: "class-paragraph", id: "id-paragraph" do
  h.p "paragraph in block"
end
h.a "image", 'href="http://www.google.com"', class: "class-iamge", id: "id-image" do
  h.p "test inside image"
end
h.h2 "to ruby world", class: "title"
h.div class: "div" do
  h.p "div test"
  h.div do
    h.p "div in div test"
  end
  h.br
  h.hr
  h.span("welcome")
end
puts h.html
