#!/usr/local/bin/ruby

class Html

  def initialize(text = "")
    @head = ""
    @body = ""
    @head += title(text)
  end

  def title(text = "")
    @head += "<title>#{text}"
    yield if block_given?
    @head += "</title>"
  end

  def apply_style(**parameters)
    @body += " style='#{parameters[:style]}'" if parameters[:style]
  end

  def paragraph(text = "", **parameters)
    @body += "\n<p"
    apply_style parameters
    @body += ">#{text}"
    yield if block_given?
    @body += "</p>"
  end

  def h(level = 1, text = "", **parameters)
    @body += "\n<h#{level}"
    apply_style parameters
    @body += ">#{text}"
    yield if block_given?
    @body += "</h#{level}>"
  end

  def div(**parameters)
    @body += "\n<div"
    apply_style parameters
    @body += ">"
    yield if block_given?
    @body += "</div>"
  end

  def span(**parameters)
    @body += "\n<span"
    apply_style parameters
    @body += ">"
    yield if block_given?
    @body += "</span>"
  end

  def table(**parameters)
    @body += "\n<table"
    apply_style parameters
    @body += ">"
    yield if block_given?
    @body += "</table>"
  end

  def row(**parameters)
    @body += "\n<tr"
    apply_style parameters
    @body += ">"
    yield if block_given?
    @body += "</tr>"
  end

  def head(text = "", **parameters)
    @body += "\n<th"
    apply_style parameters
    @body += ">#{text}"
    yield if block_given?
    @body += "</th>"
  end

  def column(text = "", **parameters)
    @body += "\n<td"
    apply_style parameters
    @body += ">#{text}"
    yield if block_given?
    @body += "</td>"
  end

  def link(text = "", link = "", **parameters)
  	@body += "<a href=#{link}"
    apply_style parameters
    @body += ">#{text}"
    yield if block_given?
    @body += "</a>"
  end

  def comment(text)
    @body += "<!--#{text}-->"
  end

  def spepratorline
    @body += "\n<hr />"
  end

  def pre(text)
    @body += "<pre>#{text}</pre>"
  end

  def nextline
    @body += "\n<br />"
  end

  def order_list(**parameters)
    @body += "\n<ol"
    apply_style parameters
    @body += ">"
    yield if block_given?
    @body += "</ol>"
  end

  def list_item(text = "", **parameters)
    @body += "\n<li"
    apply_style parameters
    @body += ">#{text}"
    yield if block_given?
    @body += "</li>"
  end

  def unorder_list(**parameters)
    @body += "\n<ul"
    apply_style parameters
    @body += ">"
    yield if block_given?
    @body += "</ul>"
  end

  def image(src, **parameters)
    @body += "<img src=#{src}"
    @body += " alt=#{parameters[:alt]}" if parameters[:alt]
    @body += " width='#{parameters[:width]}'" if parameters[:width]
    @body += " height='#{parameters[:height]}'" if parameters[:height]
    apply_style parameters
    @body += "/>"
  end

  def html
    """
<html>
  <head>
    #{@head}
  </head>
  <body>
    #{@body}
  </body>
</html>

""" 
  end

  alias ol order_list
  alias ul unorder_list
  alias li list_item
  alias br nextline
  alias a link
  alias td column
  alias tr row
  alias th head
  alias p paragraph
  alias hr spepratorline

end