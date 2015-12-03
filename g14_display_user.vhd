--Juan Carlos Borges
library ieee;
use ieee.std_logic_1164.all;

entity g14_display_user is
port(	guess, userIN				: in std_logic_vector(11 downto 0);
		score 						: in std_logic_vector(3 downto 0);
		USR_RST, CHECK, READY	: in std_logic;
		DS_EN, SOLVED,USR			: in std_logic;
		HEX3, HEX2					: out std_logic_vector(6 downto 0);
		HEX1, HEX0					: out std_logic_vector(6 downto 0)
		);
end g14_display_user;


architecture beh of g14_display_user is

signal d3, d4 : std_logic;
signal c1, c2, c3, c4 : std_logic_vector(3 downto 0);
signal g1, g2, g3, g4 : std_logic_vector(3 downto 0);
signal u1, u2, u3, u4 : std_logic_vector(3 downto 0);

component g14_7_segment_decoder is
port(code : in std_logic_vector(3 downto 0);
		RippleBlank_In : in std_logic;
		RippleBlank_Out : out std_logic;
		segments : out std_logic_vector(6 downto 0));
end component;

component g14_color_decoder is
port(	code : in std_logic_vector(2 downto 0);
		color : out std_logic_vector(3 downto 0));

end component;

begin

process (DS_EN,SOLVED) 
begin
		if(DS_EN = '1') then
			if(USR = '1')then
				if(CHECK = '1') then
					g1<=c1;
					g2<=c2;
					g3<=c3;
					g4<=c4;
				elsif(READY = '0' and USR_RST = '1') then
					g1<=u1;
					g2<=u2;
					g3<=u3;
					g4<=u4;
				elsif(SOLVED ='1') then
					g1<="00"&score(1 downto 0);
					g2<="00"&score(3 downto 2);
					g3<="1110"; -- victory!
					g4<="0000";
				elsif(solved = '0' and USR_RST = '0' and check = '0') then
					g1<="00"&score(1 downto 0);
					g2<="00"&score(3 downto 2);
					g3<="0000";
					g4<="0000";
				end if;
			elsif(USR = '0')then
				if(CHECK = '1') then
					g1<=c1;
					g2<=c2;
					g3<=c3;
					g4<=c4;
				elsif(SOLVED ='1') then
					g1<="00"&score(1 downto 0);
					g2<="00"&score(3 downto 2);
					g3<="1110"; -- victory!
					g4<="0000";
				elsif(READY = '0' and solved = '0') then
					g1<="00"&score(1 downto 0);
					g2<="00"&score(3 downto 2);
					g3<="0000";
					g4<="0000";
				end if;
			end if;
		end if;

end process;

gui1: g14_color_decoder port map(code=>userIN(2 downto 0),color=>u1);
gui2: g14_color_decoder port map(code=>userIN(5 downto 3),color=>u2);
gui3: g14_color_decoder port map(code=>userIN(8 downto 6),color=>u3);
gui4: g14_color_decoder port map(code=>userIN(11 downto 9),color=>u4);

dec1: g14_color_decoder port map(code=>guess(2 downto 0),color=>c1);
dec2: g14_color_decoder port map(code=>guess(5 downto 3),color=>c2);
dec3: g14_color_decoder port map(code=>guess(8 downto 6),color=>c3);
dec4: g14_color_decoder port map(code=>guess(11 downto 9),color=>c4); 

disp0: g14_7_segment_decoder port map(segments=> HEX0, code=>g1, RippleBlank_In=>'0');

disp1: g14_7_segment_decoder port map(segments=> HEX1, code=>g2, RippleBlank_In=>d3);

disp2: g14_7_segment_decoder port map(segments=> HEX2, code=>g3, RippleBlank_In=>d4, RippleBlank_Out=>d3);

disp3: g14_7_segment_decoder port map(segments=> HEX3, code=>g4, RippleBlank_In=>'1', RippleBlank_Out=>d4);

end beh;