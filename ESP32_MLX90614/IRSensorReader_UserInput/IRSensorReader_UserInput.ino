// --------------------------------------
// IR Sensor Reader with User Input
// --------------------------------------

#include <Adafruit_MLX90614.h>
#include <Wire.h>

float ambientTempC;
float objectTempC;
String readCommand = "r";

Adafruit_MLX90614 mlx = Adafruit_MLX90614();

void setup() {
  Serial.begin(115200);
  Serial.setDebugOutput(true);
  while (!Serial);

  Serial.println("IR Sensor MLX90614 test");
  
  if (!mlx.begin()) {
    Serial.println("Error connecting to MLX sensor. Check wiring.");
    while (1);
  };

  Serial.print("Emissivity = "); Serial.println(mlx.readEmissivity());
  Serial.println("================================================");
}

void loop() {

  Serial.println("Enter letter 'r' to read temps: ");

  // wait for user input
  while (Serial.available() == 0) {
  }

  // get user input
  String userInput = Serial.readString();

  // get ambient and object temps, pass to Serial Plotter and output to Serial Monitor
  if (userInput == readCommand) {
    ambientTempC = mlx.readAmbientTempC();
    objectTempC = mlx.readObjectTempC();
    Serial.print("Ambient: ");
    Serial.print(ambientTempC);
    Serial.print(", ");
    Serial.print("Object:");
    Serial.println(objectTempC);
  }
  else {
    Serial.println("Please enter a valid input!");
  }

}