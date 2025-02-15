// Create websocket object in onInit and attach event handlers to it

sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "sap/ui/core/ws/WebSocket",
  "sap/m/MessageBox"
],
  function (Controller, WebSocket, MessageBox) {
    "use strict";

    return Controller.extend("materialmaster.controller.View1", {
      onInit: function () {

        var oWebSocket = new WebSocket("/sap/bc/apc/sap/zapc_basic");

        oWebSocket.attachOpen((oEvent) => {
          MessageBox.information("WebSocket connection opened");
        });

        oWebSocket.attachMessage(function (oEvent) { // Attach an event handler for the 'message' event

          var sMessage = oEvent.getParameter("data"); // Get the sent message data 
          MessageBox.information(sMessage);


        }.bind(this)
        );

        oWebSocket.attachError(function (oEvent) {
          MessageBox.information("WebSocket error occurred");
          
          this.storeMessage("Error websocket");
        }.bind(this));

        oWebSocket.attachClose((oEvent) => {
          MessageBox.information("Websocket closed")

        });

      }    
    });
  });
