#include <ArduinoWiFiServer.h>
#include <BearSSLHelpers.h>
#include <CertStoreBearSSL.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiAP.h>
#include <ESP8266WiFiGeneric.h>
#include <ESP8266WiFiGratuitous.h>
#include <ESP8266WiFiMulti.h>
#include <ESP8266WiFiSTA.h>
#include <ESP8266WiFiScan.h>
#include <ESP8266WiFiType.h>
#include <WiFiClient.h>
#include <WiFiClientSecure.h>
#include <WiFiClientSecureBearSSL.h>
#include <WiFiServer.h>
#include <WiFiServerSecure.h>
#include <WiFiServerSecureBearSSL.h>
#include <WiFiUdp.h>

const char* ssid = "Your_SSID"; // Replace with your Wi-Fi SSID
const char* password = "Your_Password"; // Replace with your Wi-Fi password

WiFiServer server(80); // Set up the server on port 80
int lightPin = 7; // Pin connected to the LED or relay

void setup() {
  Serial.begin(115200); // Start serial communication
  pinMode(lightPin, OUTPUT); // Configure the light pin as output

  // Connect to Wi-Fi
  WiFi.begin(ssid, password);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.print(".");
  }
  Serial.println("\nConnected to Wi-Fi");
  Serial.println(WiFi.localIP()); // Print the IP address

  server.begin(); // Start the server
}

void loop() {
  WiFiClient client = server.available(); // Listen for incoming clients
  if (!client) {
    return;
  }

  // Read the HTTP request
  String request = client.readStringUntil('\r');
  Serial.println(request);
  client.flush();

  // Control the light based on the request
  if (request.indexOf("/ON") != -1) {
    digitalWrite(lightPin, HIGH); // Turn on light
  } else if (request.indexOf("/OFF") != -1) {
    digitalWrite(lightPin, LOW); // Turn off light
  }

  // Send HTTP response
  client.println("HTTP/1.1 200 OK");
  client.println("Content-Type: text/html");
  client.println();
  client.println("<!DOCTYPE HTML>");
  client.println("<html>");
  client.println("<h1>Light Control</h1>");
  client.println("<a href=\"/ON\">Turn ON</a><br>");
  client.println("<a href=\"/OFF\">Turn OFF</a><br>");
  client.println("</html>");
  delay(1);
}
