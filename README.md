<b>ESP32_MLX90614 Directory</b>
<br>Test code for MLX90614 Non-Contact Infrared Temperature Sensor with ESP32-WROVER Micro-controller

Hardware setup:
1. Setup the MLX90614 sensor on the ESP32-WROVER according to images (ESP32_IR_0, ESP32_IR_1)
2. Connect the ESP32 Micro-controller to your PC's USB port (2.0 or higher)

Software setup:
1. Install Arudino IDE 2.2.1 (https://www.arduino.cc/en/software)
2. Install Adafruit MLX90614 library
<br>&emsp;a. In Arduino IDE, go to Sketch->Include Libraries->Manage Libraries
<br>&emsp;b. Search and install Adafruit MLX90614 library
3. Open IRSensorReader.ino (polling read) or IRSensorReader_UserInput.ino sketch
4. Follow the ESP32's tutorial to install drivers and select the correct Comms port
5. Upload code to ESP32
6. Open Serial Monitor in Arduino IDE, set Baud rate to 115200
7. Enter command 'r' in the Serial Monitor to read from sensor (IRSensorReader_UserInput.ino only)
8. Open Serial Plotter in Arduino IDE to see the graph of readings

<br><b>MATLAB Directory</b>
<br>Modelling effect of chimeric antigen receptor (CAR) T cells on cancer cells
