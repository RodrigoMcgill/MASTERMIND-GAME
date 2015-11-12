-- Juan Carlos Borges

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity g14_lab4_frequencyDivier is

generic(n : integer := 500000);

port(	clk,en	: in std_logic;
		reset		: in std_logic;
		newClk	: out std_logic
		);
		
end g14_lab4_frequencyDivier;

architecture behavior of g14_lab4_frequencyDivier is
signal count : integer(n downto 0);

begin

process(clk,reset)

		if(reset = '1') then
			count<= std_logic_vector(to_unsigned(0,20));
			newClk <= '0'
		elsif(rising_edge(clk) )then
				if(count = n) then
					count <= 0;
					newClk <= newClk+1;
				elsif() then
					count <= count + 1;
				end if;
		end if;

end behavior;