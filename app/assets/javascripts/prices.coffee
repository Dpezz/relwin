# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
<<<<<<< HEAD

$ ->
@calculos =	calculos = (intaxes) ->
	buy_p = $("#price_buy_p").val()
	margin = $("#price_return").val()
	sale_p = parseInt(buy_p) * (1 + (parseInt(margin) * 0.01))
	total_p = parseInt(buy_p) * (1 + (parseInt(margin)+parseInt(intaxes))* 0.01)
	$("#price_sale_p").val( sale_p )
	$("#price_total_p").val( total_p )
=======
>>>>>>> c66483081cf83138a2aa6b061be26ceefc71112f
