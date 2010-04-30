# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
 
 def title
    titulo_base = "Expedientes Medico Estandarizados"
    if @title.nil?
      titulo_base
    else
      "#{titulo_base} | #{@title}"
    end
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end
  
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
end
