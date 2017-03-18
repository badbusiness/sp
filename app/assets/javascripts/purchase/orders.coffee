#$( ".target" ).change(function() {
#  alert( "Handler for .change() called." );
#});

#test_alert = -> 
	
	
#$('input#purchase_order_Supplier_id').on "change", ->
#  test_alert()
	
#this.clickHandler = -> alert "Changed"
#element.addEventListener "click", (e) => this.clickHandler(e)


test_alert = ->
	alert "I knew it!"


$(document).ready ->
	$('#purchase_order_Supplier_id').change (event) -> 
		test_alert()

		