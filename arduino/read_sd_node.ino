//Primero debe crear un archivo index.txt en el SD
//https://www.todavianose.com/como-escribir-en-un-tarjeta-sd-con-arduino/
//http://www.playbyte.es/electronica/arduino/lector-de-memorias-sd/
//https://alex7tutoriales.com/arduinojson-convertir-datos-json-en-arduino/
#include <SPI.h>
#include <SD.h>

const int chipSelect = 16;
File dataFile;
byte password;
String FILE_Name = "index.txt";


void setup() {
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  Serial.print("Initializing SD card...");

  // see if the card is present and can be initialized:
  if (!SD.begin(chipSelect)) {
    Serial.println("Card failed, or not present");
    // don't do anything more:
    while (1);
  }
  Serial.println("card initialized.");

}

void loop() {
  String cadena = "";
  dataFile = SD.open(FILE_Name);
  // if the file is available, write to it:
  if (dataFile) {
    while (dataFile.available()) {
      password = dataFile.read();
      /* if (password==13) {
            break;
        }else{*/
      cadena = cadena + char(password);
      //}
      //Serial.write(password);
    }
    dataFile.close();
  }
  // if the file isn't open, pop up an error:
  else {
    Serial.println("error opening index.txt");
  }

  Serial.println(cadena);
  delay(2000);

}
