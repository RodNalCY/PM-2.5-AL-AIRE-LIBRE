//////////////////////////WIFI//CREDENCIALES///////////////////////////////////////////////////
#include <ESP8266WiFi.h>
//////////////////////////SD//LIBRERIAS///////////////////////////////////////////////////
#include <SPI.h>
#include <SD.h>
const int chipSelect = 16;
File dataFileSSID;
File dataFilePASS;
byte txt_ssid;
byte txt_passw;
String FILE_ssID = "ssid.txt";
String FILE_Password = "password.txt";
//////////////////////////CONFIGURACION//DEL//SERVIDOR////////////////////////////////////////
String ssid     = "";
String password = "";

void setup() {
  Serial.begin(9600);
  /////////////////////////////////////////////////////////////////////////////////////////////
  Serial.print("Initializing SD card...");

  if (!SD.begin(chipSelect)) {
    Serial.println("Card failed, or not present");
    while (1);
  } else {
    Serial.println("card initialized.");

    String cadenaSSID = "";
    String cadenaPassword = "";

    dataFileSSID = SD.open(FILE_ssID);
    dataFilePASS = SD.open(FILE_Password);

    if (dataFileSSID && dataFilePASS) {
      while (dataFileSSID.available()) {
        txt_ssid = dataFileSSID.read();
        cadenaSSID = cadenaSSID + char(txt_ssid);
      }
      while (dataFilePASS.available()) {
        txt_passw = dataFilePASS.read();
        cadenaPassword = cadenaPassword + char(txt_passw);
      }
      dataFileSSID.close();
      dataFilePASS.close();
    } else {
      Serial.println("error opening SSID.txt or PASSWOR.txt");
    }
    Serial.println(cadenaSSID);
    Serial.println(cadenaPassword);
    ssid = cadenaSSID;
    password = cadenaPassword;
  }

  /////////////////////////////////////////////////////////////////////////////////////////////

  Serial.print("Node MCU Chip Id : ");
  String chip_id = String(ESP.getChipId());
  Serial.println(chip_id);
  /////////////////////////////////////////////////////////////////////////////////////////////
  Serial.print("'Conectando Modulo' a la RED WiFi espere por favor (...) : ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi Conectado Correctamente");
  Serial.println("Mi direccion IP: ");
  Serial.println(WiFi.localIP());

}

void loop() {

}
