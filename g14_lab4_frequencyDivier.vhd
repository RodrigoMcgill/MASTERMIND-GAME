-- Juan Carlos Borges

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity g14_lab4_frequencyDivier is


port(	CLK_in,RST	: in std_logic;
		newClk	   : out std_logic
		);
		
end g14_lab4_frequencyDivier;

architecture behavior of g14_lab4_frequencyDivier is
signal change_CLK_value : std_logic;
signal clock : std_logic;
signal counter: integer range 0 to 50000000 := 0;

begin



process(CLK_in,RST)

begin
		
		
		
		if(rising_edge(CLK_in))then
				if(counter = 25000000) then
					change_CLK_value <= NOT(change_CLK_value);
					counter <= 0;
				else
					counter <= counter + 1;
				end if;
		end if;
end process;

newClk <= change_CLK_value;
end behavior;