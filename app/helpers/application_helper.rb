# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

def title
    titulo_base = "Expedientes Medico Estandarizados"
    if @title.nil?
      titulo_base
    else
      "#{titulo_base} | #{@title}"
    end
  end

end
