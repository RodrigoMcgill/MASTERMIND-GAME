--@author:Rodrigo Mendoza
-- December 4th, 2015
library ieee;
use ieee.std_logic_1164.all;

entity g14_color_decoder is
port(	code : in std_logic_vector(2 downto 0);
		color : out std_logic_vector(3 downto 0));

end g14_color_decoder;

architecture beh of g14_color_decoder is
begin
process (code)
begin
	if(code = "000") then
		color<="1010";
	elsif(code = "001") then
		color<="1011";
	elsif(code = "010") then
		color<="1100";
	elsif(code = "011") then
		color<="1101";
	elsif(code = "100") then
		color<="1110";
	elsif(code = "101") then
		color<="1111";
	end if;
end process;
end beh;