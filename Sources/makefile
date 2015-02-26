#Este es un makefile que sirve para ejecutar secciones del proyecto final, linux.
#JeanCarlos Chavarria Hughes

#Sources
SOURCE1 = signed_adder_testbench.v
SOURCE2 = float_adder_testbench.v
SOURCE3 = float_multiplier_testbench.v
SOURCE4 = calculator_testbench.v

#Se define e l compilador

CC = iverilog 
VVP = VVP
#Bandera de output

EXEC = -o

#Targets
TARGET1 = signed_adder_testbench
TARGET2 = float_adder_testbench
TARGET3 = float_multiplier_testbench
TARGET4 = calculator

#Reglas a ejecutar cuando se ejecute make
signed_adder:
	$(CC) $(EXEC) $(TARGET1) $(SOURCE1)

float_adder:
	$(CC) $(EXEC) $(TARGET2) $(SOURCE2)

float_multipler:
	$(CC) $(EXEC) $(TARGET3) $(SOURCE3)

calculator:
	$(CC) $(EXEC) $(TARGET4) $(SOURCE4)

all: signed_adder float_adder float_multiplier calculator

clean :
	clear
