define(
[],
function() {
  var config = {
    bingMapsKey:"",   
    helperServices: {
       geometry:{
           url: location.protocol + "//gis.ecan.govt.nz/arcgis/rest/services/Utilities/Geometry/GeometryServer"
    },
       printTask: {
           url: location.protocol + "//gis.ecan.govt.nz/arcgis/rest/services/Printing/MapPrinting/GPServer/Export%20Web%20Map"
       },
       geocode: [{
           name: "Canterbury Maps Geocoder",
           url: location.protocol + "//gis.ecan.govt.nz/arcgis/rest/services/Locators/Canterbury_Locator/GeocodeServer",
           singleLineFieldName: "SingleLine",
           outFields: "*",
           placefinding: true,
           autocomplete: true
       }]
    }
};
  
  // could use a has() test to optionally populate some global
  // property so that the stuff defined is in some global identifier
  //
  // instead, just populate a global, will need to remove the next line when
  // when we remove support for loading modules with dojo.require
  // which will be when we move to Dojo 2.0
  commonConfig = config;
  // instead of using a global, this should probably be added to some namespace...
  // do the templates have a common namespace that they use?

  return config;  
});
