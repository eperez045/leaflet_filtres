var map = L.map('mapid').on('load', onMapLoad).setView([41.400, 2.206], 9);
//map.locate({setView: true, maxZoom: 17});

var tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);

//en el clusters almaceno todos los markers
var markers = L.markerClusterGroup();
var data_markers = [];
var kindFood = [];

function onMapLoad() {

    console.log("Mapa cargado");
    /*
	FASE 3.1
		1) Relleno el data_markers con una petición a la api
		2) Añado de forma dinámica en el select los posibles tipos de restaurantes
		3) Llamo a la función para --> render_to_map(data_markers, 'all'); <-- para mostrar restaurantes en el mapa
	*/
    $.getJSON("http://localhost/mapa/api/apiRestaurants.php", function(data) {
        for (let i = 0; i < data.length; i++) {
            data_markers.push(data[i]);
        }
        // crear array con tipos de restaurante
        console.log(data_markers);
        $.each(data, function(key, val) {
            kindFood.push(val.kind_food);
        });
        console.log(kindFood);

        // separar tipo de restaurante del array
        kindFood = kindFood.toString();
        kindFood = kindFood.split(',');
        kindFood.unshift("Todos")
        console.log(kindFood)

        // eliminar los tipos de restaurante repetidos
        Array.prototype.unique = function(a) {
            return function() { return this.filter(a) }
        }(function(a, b, c) {
            return c.indexOf(a, b + 1) < 0
        });
        kindFood = kindFood.unique();
        console.log(kindFood)

        // añadir valores al select
        for (let j = 0; j < kindFood.length; j++) {
            $("#kind_food_selector").append("<option>" + kindFood[j] + "</option>");
        }

        // añadir marker de restaurantes al mapa
        for (let marker of data_markers) {
            markers.addLayer(
                L.marker([marker.lat, marker.lng]).bindPopup(
                    "<strong>" + marker.name +
                    "</strong><br>" + marker.address +
                    "<br><i>" + marker.kind_food + "<i>"
                )
            );
        }
        map.addLayer(markers);
    });
}

$('#kind_food_selector').on('change', function() {
    console.log(this.value);
    render_to_map(data_markers, this.value);
});



function render_to_map(data_markers, filter) {

    /*
    FASE 3.2
        1) Limpio todos los marcadores
    	2) Realizo un bucle para decidir que marcadores cumplen el filtro, y los agregamos al mapa
    */

    //    eliminar marcadores
    markers.clearLayers();

    // Bucle para filtros
    for (marker of data_markers) {

        if (marker.kind_food.includes(filter)) {
            markers.addLayer(
                L.marker([marker.lat, marker.lng]).bindPopup(
                    "<strong>" + marker.name +
                    "</strong><br>" + marker.address +
                    "<br><i>" + marker.kind_food + "<i>"
                )
            );
        } else if (filter == 'Todos') {
            markers.addLayer(
                L.marker([marker.lat, marker.lng]).bindPopup(
                    "<strong>" + marker.name +
                    "</strong><br>" + marker.address +
                    "<br><i>" + marker.kind_food + "<i>"
                )
            );
        }
    }
    map.addLayer(markers);
}