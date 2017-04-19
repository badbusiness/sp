module Sale::OrdersHelper
  def unit(ol) 
    if ol.object.article
		  ol.object.article.unit
		end
  end
  
  def bruto_prijs(ol)
    if ol.object.article
      number_to_currency(ol.object.article.bruto_prijs, unit: "&euro; ".html_safe)
    end
  end
  
  def regelwaarde(ol)
    if ol.object.article
      number_to_currency(ol.object.regelwaarde, unit: "&euro; ".html_safe)
    end
  end
  
  def btw(ol)
    if ol.object.article
      number_to_currency(ol.object.btw, unit: "&euro; ".html_safe)
    end
  end
  
  def inclusief_btw(ol)
    if ol.object.article
      number_to_currency(ol.object.inclusief_btw, unit: "&euro; ".html_safe)
    end
  end
  
  def totaalprijs_ex(order)
    if order.totaalprijs
      number_to_currency(order.totaalprijs, unit: "&euro; ".html_safe)
    end
  end
  
  def totaal_btw(order)
    if order.btw
      number_to_currency(order.btw, unit: "&euro; ".html_safe)
    end
  end
  
  def totaal_btw(order)
    if order.btw
      number_to_currency(order.btw, unit: "&euro; ".html_safe)
    end
  end

  def totaal_inclusief_btw(order)
    if order.btw
      number_to_currency(order.inclusief_btw, unit: "&euro; ".html_safe)
    end
  end


end
