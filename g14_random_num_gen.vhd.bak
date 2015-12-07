-- Juan Carlos Borges
library ieee;
use ieee.std_logic_1164.all;

entity g14_random_num_gen is
port(	CLK, TC_EN	: in std_logic;
		numb			: out std_logic_vector(11 downto 0));

end g14_random_num_gen;

architecture behavior of g14_random_num_gen is
signal reset, useless, TC_LAST : std_logic;
signal addr, stored : std_logic_vector(11 downto 0);


component g14_possibility_table is
port(   TC_EN 	   : in std_logic; -- table counter enable
		  TC_RST		: in std_logic; -- table counter reset
		  TM_IN		: in std_logic; -- table memory input data
		  TM_EN		: in std_logic; -- table memory write enable
		  CLK			: in std_logic;
		  TC_LAST	: out std_logic; -- last count flag
		  TM_ADDR	: out std_logic_vector(11 downto 0);
		  TM_OUT		: out std_logic); -- table memory output
end component;

begin

Counter: g14_possibility_table port map(TC_EN=>TC_EN, CLK =>CLK, TM_ADDR => addr, TC_RST=> reset, TC_LAST=> TC_LAST,
													 TM_IN =>useless, TM_EN=> useless, TM_OUT => useless); 
process (TC_EN, CLK)

begin
		if(rising_edge(CLK)) then
			if(TC_EN ='0') then
				reset <= '1';
				numb<=stored;
			elsif(TC_EN = '1') then
				reset <= TC_LAST;
				stored<= addr;
			end if;
		end if;
end process;													 

end behavior;