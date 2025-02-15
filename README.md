# ABAPPushChannel

**ABAP Push Channels for Real-Time UI5 Updates**  

ABAP Push Channels (APC) provide WebSocket-based communication in SAP’s ABAP environment. They enable real-time message push from the backend to SAPUI5 apps without polling.  

When a business event occurs, the backend sends a message via APC, and the UI5 app receives it instantly using WebSocket APIs like `sap.ui.core.ws.WebSocket`. This improves performance and user experience.  

APC is often used in combination with ABAP Messaging Channels (AMC), which support a publish/subscribe model for inter-session communication. By binding an AMC channel to a WebSocket connection, developers can implement collaboration scenarios where messages are filtered per user or session, ensuring that each UI5 client receives only its relevant notifications.

**SAPC configuration**
![image](https://github.com/user-attachments/assets/ccd06c73-cc76-4e9a-b1da-7d71add4959f)

**SAMC configuration**
![image](https://github.com/user-attachments/assets/f9c866f6-e895-4de1-8c86-6afe5baf6ec7)

