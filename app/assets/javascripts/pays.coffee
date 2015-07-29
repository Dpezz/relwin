# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->

@calculate = calculate = (total) ->
	price_in = $("#pay_in").val()
	vuelto = price_in - total
	price_out = $("#pay_out").val(vuelto)
