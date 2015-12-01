library ieee;
use ieee.std_logic_1164.all;

entity g14_register is
generic(N :integer := 5);
port(	data 			: in std_logic_vector(N downto 0);
		enable, CLK : in std_logic;
		display 		: out std_logic_vector(N downto 0));

end g14_register;

architecture behavior of g14_register is

begin
process(clk)
begin
	if(rising_edge(clk))then
	  if(enable ='1')then
		display<=data;
		end if;
	end if;

end process;
end behavior;