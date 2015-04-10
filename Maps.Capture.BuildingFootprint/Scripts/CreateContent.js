define([
  "dojo/_base/declare",
  "dojo/parser",
  "dojo/_base/lang",
  "dojo/_base/array",
  "dojo/string",
  "dojo/_base/window",
  "dojo/_base/connect",
  "dojo/on",
  "dojo/has",
  "dojo/Deferred",
  "dojo/dom",
  "dojo/dom-class",
  "dojo/dom-construct",
  "esri/domUtils",
  "esri/dijit/editing/Editor",
  "dijit/layout/BorderContainer",
  "dijit/layout/ContentPane",
  "dojo/text!utilities/templates/instructions.html",
  "dojo/text!utilities/templates/outofscale.html",
],
    function (
      declare,
      parser,
      lang,
      array,
      string,
      win,
      connect,
      on,
      has,
      Deferred,
      dom,
      domClass,
      domConstruct,
      domUtils,
      Editor,
      BorderContainer,
      ContentPane,
      instructionTemplate,
      outOfScaleTemplate
      ) {
        var CreateContent = declare("utilities.CreateContent", null, {
            isMobile: false,
            leftPanel: null,
            mainWindow: null,
            header: null,
            mapPane: null,
            displayButton: null,
            editableLayers: [],
            options: null,
            map: null,
            handler: null,
            response: null,
            constructor: function (args) {
                (has("touch") && window.innerWidth <= 360) ? this.isMobile = true : this.isMobile = false;
                this.options = args;
            },
            createLayout: function () {
                var deferred = new Deferred();
                this.mainWindow = new BorderContainer({
                    id: 'mainWindow',
                    design: 'headline',
                    gutters: false,
                    style: {
                        height: '100%',
                        width: '100%'
                    }
                }).placeAt(win.body(), "first");

                //add header pane if its a smart phone add a button and omit the subtitle 
                var content = "";
                if (!this.isMobile) {
                    content = "<div id='title'></div><div id='subtitle'></div>";
                } else {
                    var h = domConstruct.create("div", { id: "headerBar" });
                    //add a button to the header 
                    this.displayButton = domConstruct.create("a", {
                        id: "displayButton",
                        className: "headerButton leftButton"
                    }, h);

                    domConstruct.create("span", { id: "title" }, h);

                    var rightTools = domConstruct.create("span", { id: "rightTools" }, h);

                    //toggle the panel content when button is clicked 
                    on(this.displayButton, "click", lang.hitch(this, function () {
                        var lp = dom.byId("leftPane");
                        lp.style.display === "none" ? domUtils.show(lp) : domUtils.hide(lp);

                        //create the content (legend or editor) or toggle it 
                        //toggle the panel content 
                        if (!this.editorWidget) {
                            //this.createEditor();
                            this.createEditorToggleButton();
                        }

                    }));
                    content = h;
                }
                this.header = new ContentPane({
                    id: "header",
                    region: "top",
                    content: content
                }).placeAt(this.mainWindow);

                //add map content
                this.mapPane = new ContentPane({
                    id: "map",
                    region: "center"
                }).placeAt(this.mainWindow);

                //add  content pane for left content if desktop or tablet. For smart phones create a div that will be toggled.                   
                if (!this.isMobile) {
                    this.leftPanel = new ContentPane({
                        id: "leftPane",
                        region: "left"
                    }).placeAt(this.mainWindow);
                } else {
                    this.leftPanel = domConstruct.create("div", {
                        id: "leftPane",
                        style: "display: none"
                    }, "map");
                }

                //add a class for smartphones that applies slightly different styles 
                if (this.isMobile) {
                    domClass.add("mainWindow", "mobile");
                }
                this.mainWindow.startup();
                deferred.resolve();
                return deferred.promise;
            },

            addMobileButton: function (title, imageUrl) {
                //add a button to the header 
                var content;
                if (imageUrl) {
                    content = string.substitute("<img src=${image} alt=${title} width=22 height=22/>", { "image": imageUrl, "title": title });
                } else {
                    content = title;
                }
                var mobileButton = domConstruct.create("a", {
                    innerHTML: content,
                    className: "headerButton rightButton"
                }, dom.byId("rightTools"), "last");
                return mobileButton;

            },

            setPanelContent: function (title, content, width) {
                var deferred = new Deferred();
                if (this.isMobile) {
                    dom.byId("displayButton").innerHTML = title;
                    domConstruct.place(content, this.leftPanel);
                    this.mainWindow.resize();
                    deferred.resolve();
                } else {
                    this.leftPanel.set("content", content);
                    this.leftPanel.set("style", { width: width });
                    this.mainWindow.resize();
                    deferred.resolve();
                }

                return deferred.promise;
            },

            updateButton: function (updatedTitle) {
                if (this.isMobile) {
                    var b = dom.byId("displayButton");
                    b.innerHTML = updatedTitle;
                }
            },

            showPanelContent: function () {
                //show panel content on mobile devices 
                if (this.isMobile) {
                    var lp = dom.byId("leftPane");
                    domUtils.show(lp);
                }
            },

            hidePanelContent: function () {
                //hide panel content on mobile devices 
                if (this.isMobile) {
                    var lp = dom.byId("leftPane");
                    domUtils.hide(lp);
                }
            },

            getEditableLayers: function (layers, map) {
                this.map = map;
                array.forEach(layers, lang.hitch(this, function (layer) {
                    if (layer && layer.layerObject) {
                        var eLayer = layer.layerObject;
                        if (eLayer instanceof esri.layers.FeatureLayer && eLayer.isEditable()) {
                            this.editableLayers.push({ 'featureLayer': eLayer })
                        }
                    }
                }));

                //add field infos if applicable - this will contain hints if defined in the popup. Also added logic to hide fields that have visible = false. The popup takes 
                //care of this for the info this but not for the edit this. 
                array.forEach(this.editableLayers, lang.hitch(this, function (layer) {
                    if (layer.featureLayer && layer.featureLayer.infoTemplate && layer.featureLayer.infoTemplate.info && layer.featureLayer.infoTemplate.info.fieldInfos) {
                        //only display visible fields 
                        var fields = layer.featureLayer.infoTemplate.info.fieldInfos;

                        var fieldInfos = [];
                        array.forEach(fields, function (field) {
                            if (field.visible) {
                                fieldInfos.push(field);
                            }
                        });
                        layer.fieldInfos = fieldInfos;
                    }
                }));
                return this.editableLayers
            },

            createEditor: function () {
                //disconnect the popup handler
                if (this.handler) {
                    this.handler.remove();
                }

                //add a pre-"commit edits" handler to update the user attributes as the shapes are committed
                array.forEach(this.editableLayers, lang.hitch(this, function (layer) {
                    if (layer && layer.featureLayer) {
                        var eLayer = layer.featureLayer;
                        layer.beforeEditsHandle = eLayer.on('before-apply-edits', this.updateLayerAttributes);
                        layer.clickHandle = eLayer.on('click', this.checkIsFeatureEditable);
                    }
                }));


                //display the toolbar if the configuration option has been enabled and the site isn't mobile.
                var settings = {
                    map: this.map,
                    layerInfos: this.editableLayers,
                    toolbarVisible: (this.options.displaytoolbar && !this.isMobile) ? true : false
                };

                // Set the available edit tools if specified
                if (this.options.displaytoolbar && !this.isMobile && this.options.toolbarOptions) {
                    settings.createOptions = this.options.toolbarOptions;
                }

                var params = {
                    settings: settings
                };

                //create the editor, apply snapping and disable the tooltips for the template picker
                this.editorWidget = new Editor(params, domConstruct.create("div", {}, dom.byId("editorDiv")));//dom.byId('editorDiv'));
                this.editorWidget.startup();

                //when template picker selection changes close this
                if (this.editorWidget && this.editorWidget.templatePicker && this.isMobile) {
                    this.editorWidget.templatePicker.on("selection-change", lang.hitch(this, function () {
                        this.hidePanelContent();
                    }));
                }
                this.map.enableSnapping();
            },

            destroyEditor: function () {
                if (this.editorWidget) {
                    this.editorWidget.destroy();
                }
                this.editorWidget = null;

                // Remove edit layer event handlers
                array.forEach(this.editableLayers, lang.hitch(this, function (layer) {
                    if (layer && layer.featureLayer) {
                        layer.beforeEditsHandle.remove();
                        layer.clickHandle.remove();
                    }
                }));

                this.handler = this.map.on("click", this.response.clickEventListener);
            },

            createEditorToggleButton: function (){
                // Creates a toggle button that activates/deavtivates the editor tools
                this.editorButton = domConstruct.create("a", {
                    id: "editorButton",
                    className: "btn btn-primary",
                    innerHTML: "Start editing"
                }, dom.byId("editorDiv"), "before");

                //toggle the panel content when button is clicked 
                on(this.editorButton, "click", lang.hitch(this, function () {
                    if (!this.editorWidget) {
                        var z = this.map.getScale();

                        if (z <= 8000) {
                            this.createEditor();
                            this.editorButton.innerHTML = "Stop editing";
                        }
                    }
                    else {
                        this.destroyEditor();
                        this.editorButton.innerHTML = "Start editing";
                    }
                }));

                // Populate the instructions
                this.createInstructions();
            },

            showOutOfScaleMessage: function () {
                // Create the outofscale message display div
                if (!this.outOfScaleMessage) {
                    this.outOfScaleMessage = domConstruct.create("div", { innerHTML: outOfScaleTemplate }, dom.byId("editorDiv"), "before");
                }

                if (this.outOfScaleMessage.innerHTML != outOfScaleTemplate)
                {
                    this.outOfScaleMessage.innerHTML = outOfScaleTemplate;
                }
            },

            clearOutOfScaleMessage: function () {
                if (this.outOfScaleMessage && this.outOfScaleMessage.innerHTML != "")
                    this.outOfScaleMessage.innerHTML = "";
            },

            setMapScaleChangehandler: function(map) {
                map.on("extent-change", lang.hitch(this, function (evt) {
                    var z = this.map.getScale();
                    if (z <= 8000) {
                        this.clearOutOfScaleMessage();
                    } else {
                        this.showOutOfScaleMessage();
                    }
                }));
            },

            createInstructions: function () {
                //creates the instructions for the editor component
                domConstruct.create("div", { innerHTML: instructionTemplate }, dom.byId("editorDiv"), "after");
            },

            updateLayerAttributes: function (evt) {
                var d = new Date();
                var z = this.map.getScale();
                var e = 'Unknown';

                if (username)
                    e = username;

                if (evt.adds && evt.adds.length > 0) {
                    array.forEach(evt.adds, lang.hitch(this, function (graphic) {
                        // Set the date attributes
                        graphic.attributes["CAPTURED_DATE"] = d.valueOf();
                        graphic.attributes["DATE_LAST_CHANGE"] = d.valueOf();
                        graphic.attributes["CAPTURED_BY"] = e;
                        graphic.attributes["CAPTURE_SCALE"] = z;
                    }));
                }

                if (evt.updates && evt.updates.length > 0) {
                    array.forEach(evt.updates, lang.hitch(this, function (graphic) {
                        // Set the date attributes
                        graphic.attributes["DATE_LAST_CHANGE"] = d.valueOf();
                        graphic.attributes["CAPTURED_BY"] = e;
                        graphic.attributes["CAPTURE_SCALE"] = z;
                    }));
                }
            },

            checkIsFeatureEditable: function (evt) {
                if (evt.graphic && evt.graphic.attributes) {
                    var e = 'Unknown';

                    if (username)
                        e = username;

                    if (evt.graphic.attributes["CAPTURED_BY"] != e && evt.graphic.attributes["CAPTURED_BY"] != 'OSM') {
                        
                        if (!evt)
                            evt = window.event;

                        //IE9 & Other Browsers
                        if (evt.stopPropagation) {
                            evt.stopPropagation();
                        }
                            //IE8 and Lower
                        else {
                            evt.cancelBubble = true;
                        }

                        // Send alert to user
                        window.alert("This is not a feature you created.  You are not permitted to modify it.");
                    }
                }
            }

        });
        return CreateContent;
    });

