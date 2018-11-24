

var iconStyle = new ol.style.Style({
    image: new ol.style.Icon(({
        anchor: [0.5, 1],
        anchorXUnits: 'fraction',
        anchorYUnits: 'fraction',
        src: '../img/555.png'
    }))
});
var vectorSource = new ol.source.Vector();

var vectorLayer = new ol.layer.Vector({
    source: vectorSource
});

var rasterLayer = new ol.layer.Tile({
    source: new ol.source.OSM()
});


var map=new ol.Map({
    target:document.getElementById('map'),
    layers:[rasterLayer,vectorLayer],
    view:new ol.View({
        center:ol.proj.fromLonLat([120.86,32.01]),
        zoom:13
    }),

});


var iconFeature1=null;
var flag=true;
// display popup on click
map.on('click', function(evt) {
    var feature = map.forEachFeatureAtPixel(evt.pixel,
        function(feature) {
            return feature;
        });
    /*在此处传入点击地图加载图片功能*/

    if(!flag){
        if(!feature) {
            if (iconFeature1) {
                vectorSource.removeFeature(iconFeature1)
            }
            iconFeature1 = new ol.Feature({
                geometry: new ol.geom.Point(evt.coordinate)
            });
            // console.log(ol.proj.transform(evt.coordinate ,'EPSG:3857' ,'EPSG:4326')[0]+","+
            //     ol.proj.transform(evt.coordinate ,'EPSG:3857' ,'EPSG:4326')[1]);
            $("#Lon").val(ol.proj.transform(evt.coordinate, 'EPSG:3857', 'EPSG:4326')[0]);
            $("#Lat").val(ol.proj.transform(evt.coordinate, 'EPSG:3857', 'EPSG:4326')[1]);

            iconFeature1.setStyle(iconStyle);
            vectorSource.addFeature(iconFeature1);
        }
    }

});

// change mouse cursor when over marker
map.on('pointermove', function(e) {
    var pixel = map.getEventPixel(e.originalEvent);
    var hit = map.hasFeatureAtPixel(pixel);
    map.getTarget().style.cursor = hit ? 'pointer' : '';
});



function Tolocation(lon,lat) {
    var view = map.getView();
    var center=new ol.proj.fromLonLat([lon,lat]);
    view.setCenter(center);
}
function drawPoint(lon,lat,spatialName) {
    var iconFeature = new ol.Feature({
        geometry: new ol.geom.Point(new ol.proj.fromLonLat([lon,lat])),
        name: spatialName,
    });
    iconFeature.setStyle(iconStyle);
    vectorSource.addFeature(iconFeature);

}