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

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "12/02/2015 20:23:03"
                                                            
-- Vhdl Test Bench template for design  :  g14_mastermind
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g14_mastermind_vhd_tst IS
END g14_mastermind_vhd_tst;
ARCHITECTURE g14_mastermind_arch OF g14_mastermind_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL check : STD_LOGIC;
SIGNAL CLK : STD_LOGIC;
SIGNAL color : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL position : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL READY : STD_LOGIC;
SIGNAL RNG : STD_LOGIC;
SIGNAL START : STD_LOGIC;
SIGNAL USER : STD_LOGIC;
SIGNAL USR_RST : STD_LOGIC;
COMPONENT g14_mastermind
	PORT (
	check : IN STD_LOGIC;
	CLK : IN STD_LOGIC;
	color : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	position : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	READY : IN STD_LOGIC;
	RNG : IN STD_LOGIC;
	START : IN STD_LOGIC;
	USER : IN STD_LOGIC;
	USR_RST : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : g14_mastermind
	PORT MAP (
-- list connections between master ports and signals
	check => check,
	CLK => CLK,
	color => color,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	position => position,
	READY => READY,
	RNG => RNG,
	START => START,
	USER => USER,
	USR_RST => USR_RST
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
      loop
			CLK<='0';
			wait for 20 ns;
			clk<='1';
			wait for 20 ns;
		end loop;
			
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
                                     
BEGIN                                                         
      user <= '0';
		  start<= '0';
		  ready<= '0';
		  check<= '0';
		  usr_RST<= '0';
		  position<="00";
		  color<="000";
		  RNG<='0';
		  wait for 70 ns;
		  
		  start<='1';
		  usr_RST<= '1';
		  RNG<='1';
		  wait for 90 ns;
		  
		  position<="01";
		  color<="001";
		  wait for 60 ns;
		  
		  RNG<='0';
		  position<="11";
		  color<="010";
		  wait for 80 ns;
		  
		  position<="10";
		  color<="010";
		  wait for 90 ns;
		  
		  USR_RST<='0';
		  wait for 50 ns;
		  
		  start<= '1';
		  wait for 100000 ns;
		  
		  wait for 50 ns;
		  
		  ready<= '1';
		  wait for 200000 ns;
		  
		  ready<='0';
		  
WAIT;                                                        
END PROCESS always;                                          
END g14_mastermind_arch;
