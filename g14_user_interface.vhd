--Juan Carlos Borges
library ieee;
use ieee.std_logic_1164.all;

entity g14_user_interface is
port( position 						: in std_logic_vector(1 downto 0);
		color								: in std_logic_vector(2 downto 0)
		TC_EN, USER, USR_RST, CLK	: in std_logic;
		EXT_PAT, GUESS					: out std_logic_vector(11 downto 0));

end g14_user_interface;

architecture behavior of g14_user_interface is
signal bot : std_logic_vector(11 downto 0);
signal p1, p2, p3, p4 : std_logic_vector(3 downto 0);

component g14_random_num_gen is
port(	CLK, TC_EN	: in std_logic;
		numb			: out std_logic_vector(11 downto 0));

end 
begin

gen : g14_random_num_gen port map(CLK=>CLK, TC_EN=> TC_EN, numb => bot);

with USER select EXT_PAT<=
	p4&p3&p2&p1 when '1',
	bot when others;

with USER select GUESS<=
	p4&p3&p2&p1 when '0',
	bot when others;

process (CLK,USR_RST)
begin
		if(rising_edge(CLK)) then
			if(USR_RST = '1') then
				if(position = "00") then
					p1<=color;
				elsif(position = "01") then
					p2<=color;
				elsif(position ="11")then
					p3<=color;
				elsif(position = "10")
					p4<=color;
				end if;
			end if;
		end if;
end process;
end behavior;