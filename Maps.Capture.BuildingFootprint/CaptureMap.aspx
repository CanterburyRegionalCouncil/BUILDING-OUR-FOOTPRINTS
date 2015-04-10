﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CaptureMap.aspx.cs" Inherits="Maps.Capture.BuildingFootprint.CaptureMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <title>Capture Building Footprints</title>
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
 
    <link rel="stylesheet" type="text/css" href="//js.arcgis.com/3.10/js/dojo/dijit/themes/claro/claro.css" />
    <link rel="stylesheet" type="text/css" href="//js.arcgis.com/3.10/js/esri/css/esri.css" />
    <link rel="stylesheet" href="Content/layout.css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

    <script type="text/javascript">
        var path_location = location.pathname.replace(/\/[^/]+$/, '');
        var dojoConfig = {
            parseOnLoad: true,
            packages: [{
                name: "utilities",
                location: path_location + '/Scripts'
            }, {
                name: "config",
                location: path_location + '/Scripts'
            }]
        };
        var debug = "true" == "<%: Maps.Capture.BuildingFootprint.Properties.Settings.Default.debugMode.ToString() %>";
        var username = "<%: Page.User.Identity.Name %>";

        var editPath = "<%: Maps.Capture.BuildingFootprint.Properties.Settings.Default.EditLayerProxyPath.ToString() %>";

    </script>

    <script type="text/javascript" src="//js.arcgis.com/3.10/"></script>

    <script type="text/javascript">
        require([
            "dojo/parser",
            "dojo/ready",
            "dojo/_base/lang",
            "dojo/_base/Color",
            "dojo/dom",
            "dojo/query",
            "dojo/on",
            "dojo/dom-style",
            "dojo/_base/array",
            "dojo/dom-construct",
            "dojo/dom-geometry",
            "utilities/app",
            "utilities/CreateContent",
            "utilities/CreateGeocoder",
            "config/commonConfig",
            "dojo/_base/Deferred",
            "esri/arcgis/utils",
            "esri/layers/FeatureLayer",
            "esri/geometry/Point",
            "esri/symbols/SimpleMarkerSymbol",
            "esri/symbols/SimpleLineSymbol",
            "esri/dijit/Legend",
            "esri/graphic",
            "esri/lang"
        ],
            function (
                parser,
                ready,
                lang,
                Color,
                dom,
                query,
                on,
                domStyle,
                array,
                domConstruct,
                domGeometry,
                App,
                Content,
                CreateGeocoder,
                config,
                Deferred,
                arcgisUtils,
                FeatureLayer,
                Point,
                SimpleMarkerSymbol,
                SimpleLineSymbol,
                Legend,
                Graphic,
                esriLang
              ) {

                ready(function () {
                    var defaults = {
                        "webmap": "<%: Maps.Capture.BuildingFootprint.Properties.Settings.Default.WebMapIDCapture %>",
                        "bingmapskey": config.bingMapsKey,
                        "sharingurl": "http://www.arcgis.com",
                        "theme": "green",  //blue, green black
                        "proxyurl": "<%: Maps.Capture.BuildingFootprint.Properties.Settings.Default.Proxy %>",
                        "home_button": true,
                        "locate_button": true,
                        "geocoder": true,
                        "helperServices": config.helperServices,
                        "queryForOrg": false,
                        "displaytoolbar": false,
                        "toolbarOptions": {
                            "polylineDrawTools": [],
                            "polygonDrawTools": [esri.dijit.editing.Editor.CREATE_TOOL_FREEHAND_POLYGON, esri.dijit.editing.Editor.CREATE_TOOL_POLYGON,
                                esri.dijit.editing.Editor.CREATE_TOOL_CIRCLE, esri.dijit.editing.Editor.CREATE_TOOL_RECTANGLE]
                        }
                    };

                    var supportsLocalization = true;
                    var app = new App(defaults, supportsLocalization);
                    on(app, "ready", lang.hitch(this, function (config) {
                        this.options = config;

                        //apply the specified theme
                        var ss = document.createElement("link");
                        ss.type = "text/css";
                        ss.rel = "stylesheet";
                        ss.href = "Content/" + options.theme + ".css";
                        document.getElementsByTagName("head")[0].appendChild(ss);

                        //Build the user interface for the application. In this case it's a simple app with a header, content and a left (or floating) panel
                        this.appcontent = new Content(this.options);
                        this.appcontent.createLayout().then(function () {
                            var itemInfo = this.options.itemInfo || this.options.webmap;
                            createMap(itemInfo);
                        });
                    }));

                    function createMap(itemInfo) {
                        var mapDeferred = arcgisUtils.createMap(itemInfo, "map", {
                            bingMapsKey: this.options.bingmapskey
                        });
                        mapDeferred.then(function (response) {
                            this.appcontent.response = response;

                            //Hold on to the click event handler because we might want to disconnect popup clicks
                            this.appcontent.handler = response.clickEventHandle;
                            this.map = response.map;
                            this.response = response;


                            //set the title and subtitle in the app's header
                            document.title = this.options.title || response.itemInfo.item.title;
                            dom.byId("title").innerHTML = this.options.title || response.itemInfo.item.title;
                            if (dom.byId("subtitle")) {
                                dom.byId("subtitle").innerHTML = this.options.subtitle || response.itemInfo.item.snippet || "";
                            }

                            if (this.map.loaded) {
                                initUI(response);
                            } else {
                                on(this.map, "load", function () {
                                    initUI(response);
                                });
                            }
                        }, function (error) {
                            alert(this.options.i8n.viewer.errors.message + " : " + error.message);
                        });
                    }

                    function initUI(response) {
                        var supportsOrientationChange = "onorientationchange" in this,
                         orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";
                        //IE8 doesn't support addEventListener so check before calling
                        if (this.addEventListener) {
                            this.addEventListener(orientationEvent, function () {
                                orientationChanged();
                            }, false);
                        }

                        //add home button if enabled 
                        if (this.options.home_button) {//Add the home button to the small slider 
                            require(["esri/dijit/HomeButton", "dojo/query"], lang.hitch(this, function (HomeButton, query) {
                                var homeButton = new HomeButton({
                                    map: this.map
                                }, domConstruct.create("div", {}, query(".esriSimpleSliderIncrementButton")[0], "after"));
                                homeButton.startup();
                            }));
                        }

                        //add address search if enabled 
                        if (this.options.geocoder) {
                            var options = {
                                map: this.map,
                                config: this.options,
                                content: this.appcontent
                            }
                            var myGeocoder = new CreateGeocoder(options);
                            if (myGeocoder.geocoder && myGeocoder.geocoder.domNode) {
                                domConstruct.place(myGeocoder.geocoder.domNode, "map", "last");
                            }
                        }

                        var content = domConstruct.create("div", { id: "editorDiv" });

                        //create the Legend or Editor 
                        var editableLayers = this.appcontent.getEditableLayers(response.itemInfo.itemData.operationalLayers, this.map);

                        // Attach a handler for map scale changes
                        this.appcontent.setMapScaleChangehandler(this.map);

                        //edit permissions 
                        var editable = true;
                        var content_title = this.options.i18n.viewer.content_title;
                        if (esriLang.isDefined(this.options.userPrivileges)) {
                            if (array.indexOf(this.options.userPrivileges, "features:user:edit") === -1) {
                                editable = false;
                                //change the title to legend 
                                content_title = content_title = this.options.i18n.viewer.legend_title;
                            }
                        } else if (editableLayers.length === 0) {
                            //change the title to legend 
                            content_title = content_title = this.options.i18n.viewer.legend_title;
                        }
                        this.appcontent.setPanelContent(content_title, content, "240px").then(lang.hitch(this, function () {

                            this.map.reposition();
                            this.map.resize();

                            if (editableLayers.length === 0 || !editable) {
                                console.log(this.options.i18n.viewer.errors.no_editable_layers_message);
                                var legend = new Legend({
                                    map: this.map,
                                    layerInfos: arcgisUtils.getLegendLayers(response)
                                }, domConstruct.create("div", {}, dom.byId("editorDiv")));

                                legend.startup();

                            } else { //can edit 
                                if (!this.appcontent.isMobile) {
                                    this.appcontent.createEditorToggleButton();
                                }
                                if (!dojo.isIE) {
                                    adjustPopup();
                                }
                            }

                            //add the location button if enabled. 
                            if (this.options.locate_button) {
                                require(["esri/dijit/LocateButton"], lang.hitch(this, function (LocateButton) {
                                    //add the location button as a child of the map div. This button
                                    //is positioned using css. Search main.css for the locateDiv selector
                                    var locateDiv = domConstruct.create("div", { id: "locateDiv" }, "map");
                                    var locationButton = new LocateButton({
                                        map: this.map
                                    }, locateDiv);
                                    locationButton.startup();
                                }));
                            }

                            if (this.appcontent.isMobile) {
                                //listen for info this and maximize
                                on(this.map.infoWindow, "show", function () {
                                    this.map.infoWindow.maximize();
                                });
                            }
                        }));
                    }

                    function zoomToLocation(location) {
                        //Add  a graphic to the map to show the current location. Location is determined using geolocation api
                        this.map.graphics.clear();
                        var pt = new Point(location.coords);
                        var symbol = new SimpleMarkerSymbol(SimpleMarkerSymbol.STYLE_CIRCLE, 12,
                              new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID,
                              new Color([102, 255, 255, 0.5]), 8),
                              new Color([102, 255, 255, 0.9])
                            );
                        graphic = new Graphic(pt, symbol);
                        map.graphics.add(graphic);
                        var zoom = this.map.getZoom() || 12;
                        map.centerAndZoom(pt, zoom);
                    }

                    function locationError(error) {

                        switch (error.code) {
                            case error.PERMISSION_DENIED:
                                alert("Location not provided");
                                break;

                            case error.POSITION_UNAVAILABLE:
                                alert("Current location not available");
                                break;

                            case error.TIMEOUT:
                                alert("Timeout");
                                break;

                            default:
                                alert("unknown error");
                                break;
                        }
                    }

                    function adjustPopup() {
                        var box = domGeometry.getContentBox(this.map.container);

                        var width = 270, height = 300, // defaults
                            newWidth = Math.round(box.w * 0.60),
                            newHeight = Math.round(box.h * 0.45);
                        if (newWidth < width) {
                            width = newWidth;
                        }

                        if (newHeight < height) {
                            height = newHeight;
                        }

                        this.map.infoWindow.resize(width, height);
                    }

                    function orientationChanged() {
                        if (this.map) {
                            if (this.appcontent.isMobile) {
                                //resize the info this if displayed.
                                if (this.map.infoWindow.isShowing) {
                                    this.map.infoWindow.reposition();
                                    this.map.infoWindow.maximize();
                                }
                            }
                            this.map.reposition();
                            this.map.resize();
                        }
                    }
                });
            });
    </script>
</head>
<body class="claro">
    <form id="form1" runat="server">
        <div id="linkBlock"> 
            <a class="btn btn-primary" href="Default.aspx">Home</a>
            <asp:LoginStatus class="btn btn-primary" runat="server" ID="loginStatus"  LogoutPageUrl="~/" LogoutAction="Redirect" OnLoggingOut="loginStatus_LoggingOut" />
        </div>
    </form>
</body>
</html>
