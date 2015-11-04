--Juan Carlos Borges

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity g14_possibility_table is
port( TC_en 	: in std_logic; -- table counter enable
		TC_RST	: in std_logic; -- table counter reset
		TM_IN		: in std_logic; -- table memory input data
		TM_EN		: in std_logic; -- table memory write enable
		clk		: in std_logic;
		TC_LAST	: out std_logic; -- last count flag
		TM_ADDR	: out std_logic_vector(11 downto 0);
		TM_OUT	: out std_logic); -- table memory output
end g14_possibility_table;

Architecture imp of g14_possibility_table is

signal TC : std_logic_vector(11 downto 0);
signal flag : std_logic;

begin
TM_ADDR <= TC;
TC_LAST <= flag;
process (clk, TC_RST)
begin	
	
	if(TC = std_logic_vector(to_unsigned(0,12))) then flag <= '0';
			
	elsif (TC = std_logic_vector(to_unsigned(2925,12))) then flag <= '1';
	
	elsif ((flag = '1' or TC_RST = '1') and rising_edge(clk)) then
			TC <= std_logic_vector(to_unsigned(0,12));
			
	elsif (TC(8 downto 6) = "101" and rising_edge(clk)) then
			TC <= TC+512;
				
	elsif (TC(5 downto 3) = "101" and rising_edge(clk)) then
			TC <= TC+64;
				
	elsif (TC(2 downto 0) = "101" and rising_edge(clk)) then
			TC <= TC+8;
			
	elsif(clk'event and clk = '1' and flag = '0' and TC_RST = '0') then
			TC <= TC+1;
			
	end if;
	
end process;

process(clk, TM_EN, TC_RST)
begin
		
	if (rising_edge(clk) and TM_EN = '1' and TC_RST = '0') then
		TM_OUT <= TM_IN;
	end if;
end process;

end imp;