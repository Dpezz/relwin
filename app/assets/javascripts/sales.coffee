# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

array = [];

@destroy = destroy = (id) ->
	index = (i for i in array when i.id is id)[0]
	console.log index
	array.splice(index,1)
	$("#row").delegate("#delete", "click", ->
     	$(this).parents("tr").remove();
  	);



@add = add = (data) ->
	product = $("#producto").val();
	unit = $("#cantidad").val();
	a = {'id':product,'unidad':unit}
	array.push(a)
	console.log array
	cadena = '';
	cadena += '<tr>';
	cadena += '<td>1</td>';
	cadena += '<td>' + a.id + ' </td>';
	cadena += '<td>' + a.unidad + ' </td>';
	cadena += '<td>$2500</td>';
	cadena += '<td> <a class="glyphicon glyphicon-trash text-danger" href="javascript:void(0)" id="delete" onclick="destroy(\'' + a.id + '\')"></a> </td>';
	cadena += '</tr>';
	$("#row").append(cadena);
	$("#producto").val("");
	$("#cantidad").val("1");
