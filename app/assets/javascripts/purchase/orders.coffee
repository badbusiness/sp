update_name = -> 
	formValue =  $('#purchase_order_Supplier_id').val()
	$.getScript ("/purchase/suppliers/"+formValue+"/update_name_from_id.js")

$(document).ready ->
	$('#purchase_order_Supplier_id').change (event) -> 
		update_name()

		