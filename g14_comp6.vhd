-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Tue Sep 29 23:39:18 2015"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY g14_comp6 IS 
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		AeqB :  OUT  STD_LOGIC
	);
END g14_comp6;

ARCHITECTURE bdf_type OF g14_comp6 IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_0 <= NOT(A(0) XOR B(0));


SYNTHESIZED_WIRE_1 <= NOT(A(1) XOR B(1));


SYNTHESIZED_WIRE_2 <= NOT(A(2) XOR B(2));


SYNTHESIZED_WIRE_3 <= NOT(A(3) XOR B(3));


SYNTHESIZED_WIRE_4 <= NOT(A(4) XOR B(4));


SYNTHESIZED_WIRE_5 <= NOT(A(5) XOR B(5));


SYNTHESIZED_WIRE_6 <= SYNTHESIZED_WIRE_0 AND SYNTHESIZED_WIRE_1 AND SYNTHESIZED_WIRE_2;


SYNTHESIZED_WIRE_7 <= SYNTHESIZED_WIRE_3 AND SYNTHESIZED_WIRE_4 AND SYNTHESIZED_WIRE_5;


AeqB <= SYNTHESIZED_WIRE_6 AND SYNTHESIZED_WIRE_7;


END bdf_type;