--Juan Carlos Borges
library ieee;
use ieee.std_logic_1164.all;

entity g14_display_user is
port(	guess 				: in std_logic_vector(11 downto 0);
		score 				: in std_logic_vector(3 downto 0);
		USR_RST				: in std_logic;
		DS_EN, SOLVED		: in std_logic;
		HEX3, HEX2			: out std_logic_vector(6 downto 0);
		HEX1, HEX0			: out std_logic_vector(6 downto 0)
		);
end g14_display_user;


architecture beh of g14_display_user is

signal d3, d4 : std_logic;
signal g1, g2, g3, g4 : std_logic_vector(3 downto 0);

component g14_7_segment_decoder is
port(code : in std_logic_vector(3 downto 0);
		RippleBlank_In : in std_logic;
		RippleBlank_Out : out std_logic;
		segments : out std_logic_vector(6 downto 0));
end component;

begin

process (DS_EN,SOLVED) 
begin
		if(DS_EN = '1') then
			if(USR_RST = '1') then
				g1<='1'&guess(2 downto 0);
				g2<='1'&guess(5 downto 3);
				g3<='1'&guess(8 downto 6);
				g4<='1'&guess(11 downto 9);
			elsif(SOLVED ='1') then
				g1<="00"&score(1 downto 0);
				g2<="00"&score(3 downto 2);
				g3<="1110" -- victory!
				g4<="0000";
			elsif(solved = '0' and USR_RST = '0') then
				g1<="00"&score(1 downto 0);
				g2<="00"&score(3 downto 2);
				g3<="0000";
				g4<="0000";
			end if;
		end if;

end process;


disp0: g14_7_segment_decoder port map(segments=> HEX0, code=>g1, RippleBlank_In=>'0');

disp1: g14_7_segment_decoder port map(segments=> HEX1, code=>g2, RippleBlank_In=>d3);

disp2: g14_7_segment_decoder port map(segments=> HEX2, code=>g3, RippleBlank_In=>d4, RippleBlank_Out=>d3);

disp3: g14_7_segment_decoder port map(segments=> HEX3, code=>g4, RippleBlank_In=>'1', RippleBlank_Out=>d4);

end beh;