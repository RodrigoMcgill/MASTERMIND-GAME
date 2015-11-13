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
signal count : integer;
signal clock : std_logic;
begin

newClk <= clock;

process(clk,reset)

begin
		if(reset = '1') then
			count<= 0;
			clock <= '0';
		elsif(rising_edge(clk))then
				if(count = n) then
					clock <= '1';
				elsif(count = n+n) then
					count <= 0;
					clock <= '0';
				elsif(en <= '0') then
					count <= count + 1;
				end if;
		end if;
end process;
end behavior;