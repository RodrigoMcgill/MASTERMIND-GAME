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
-- Generated on "11/30/2015 18:33:33"
                                                            
-- Vhdl Test Bench template for design  :  g14_mastermind_controller
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g14_mastermind_controller_vhd_tst IS
END g14_mastermind_controller_vhd_tst;
ARCHITECTURE g14_mastermind_controller_arch OF g14_mastermind_controller_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL GR_LD : STD_LOGIC;
SIGNAL GR_SEL : STD_LOGIC;
SIGNAL P_SEL : STD_LOGIC;
SIGNAL READY : STD_LOGIC;
SIGNAL SC_CMP : STD_LOGIC;
SIGNAL SD_EN : STD_LOGIC;
SIGNAL SOLVED : STD_LOGIC;
SIGNAL SR_LD : STD_LOGIC;
SIGNAL SR_SEL : STD_LOGIC;
SIGNAL START : STD_LOGIC;
SIGNAL TC_EN : STD_LOGIC;
SIGNAL TC_LAST : STD_LOGIC;
SIGNAL TC_RST : STD_LOGIC;
SIGNAL TM_EN : STD_LOGIC;
SIGNAL TM_IN : STD_LOGIC;
SIGNAL USER : STD_LOGIC;
COMPONENT g14_mastermind_controller
	PORT (
	CLK : IN STD_LOGIC;
	GR_LD : OUT STD_LOGIC;
	GR_SEL : OUT STD_LOGIC;
	P_SEL : OUT STD_LOGIC;
	READY : IN STD_LOGIC;
	SC_CMP : IN STD_LOGIC;
	SD_EN : OUT STD_LOGIC;
	SOLVED : OUT STD_LOGIC;
	SR_LD : OUT STD_LOGIC;
	SR_SEL : OUT STD_LOGIC;
	START : IN STD_LOGIC;
	TC_EN : OUT STD_LOGIC;
	TC_LAST : IN STD_LOGIC;
	TC_RST : OUT STD_LOGIC;
	TM_EN : OUT STD_LOGIC;
	TM_IN : OUT STD_LOGIC;
	USER : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : g14_mastermind_controller
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	GR_LD => GR_LD,
	GR_SEL => GR_SEL,
	P_SEL => P_SEL,
	READY => READY,
	SC_CMP => SC_CMP,
	SD_EN => SD_EN,
	SOLVED => SOLVED,
	SR_LD => SR_LD,
	SR_SEL => SR_SEL,
	START => START,
	TC_EN => TC_EN,
	TC_LAST => TC_LAST,
	TC_RST => TC_RST,
	TM_EN => TM_EN,
	TM_IN => TM_IN,
	USER => USER
	);
init : PROCESS                                                                                   
BEGIN                                                        
      loop
			CLK <= '1';
			wait for 20 ns;
			CLK <= '0';
			wait for 20 ns;
		end loop;
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                             

--Important signals: SC_CMP,TC_LAST,START,READY,CLK

BEGIN                                                      
-- First case, Table not at the last value and the value was found on the first try.
		USER <= '0';
		START <= '0';
		READY <= '0';
		SC_CMP <= '0';
		TC_LAST <= '0';
		wait for 40 ns;
		
		START <='1';
		wait for 340 ns;
		
		TC_LAST<='1';
		wait for 100 ns;
		
		READY <= '1';
		wait for 20 ns;
		
		SC_CMP <= '1';
		wait for 100 ns;
		
-- Second case, at the last value and the value was found on the second try.
		START <= '0';
		READY <= '0';
		SC_CMP <= '0';
		wait for 100 ns;
		
		START <= '1';
		wait for 40 ns;
		
		TC_LAST <= '0';
		wait for 320 ns;
		
		TC_LAST<='1';
		wait for 100 ns;
		
		READY <= '1';
		wait for 40 ns;
		
		SC_CMP <= '0';
		wait for 40 ns;
		
		TC_LAST <= '0';
		wait for 200 ns;
		
		SC_CMP <= '1';
		wait for 70 ns;
		
		READY <= '0';
		wait for 100 ns;
		
		READY <= '1';
		wait for 10 ns;
		
		SC_CMP <= '1';
		
		wait;                                                  
END PROCESS always;                                          
END g14_mastermind_controller_arch;
