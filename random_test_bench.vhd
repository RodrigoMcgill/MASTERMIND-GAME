-- Juan Carlos Borges

library ieee;
use ieee.std_logic_1164.all;

entity random_test_bench is
port( CLK, TC_EN	: in std_logic;
		disp1, disp2: out std_logic_vector(6 downto 0); 
		disp3, disp4: out std_logic_vector(6 downto 0));

end random_test_bench;

architecture beh of random_test_bench is
signal numb : std_logic_vector(15 downto 0);
signal d1,d2,d3,d4 : std_logic;

component g14_random_num_gen is
port(	CLK, TC_EN	: in std_logic;
		numb			: out std_logic_vector(11 downto 0));
end component;

component g14_7_segment_decoder is
port(	code : in std_logic_vector(3 downto 0);
		RippleBlank_In : in std_logic;
		RippleBlank_Out : out std_logic;
		segments : out std_logic_vector(6 downto 0));
end component;
begin
d4 <= '1';
d1 <= '0';

gen: g14_random_num_gen port map(CLK=>CLK, TC_EN=>TC_EN, numb(2 downto 0)=>numb(2 downto 0),
											numb(5 downto 3)=>numb(6 downto 4),numb(8 downto 6)=>numb(10 downto 8),
											numb(11 downto 9)=>numb(14 downto 12));
numb(3)<='0';
numb(7)<= '0';
numb(11)<= '0';
numb(15)<= '0';
					--    
	
dip1: g14_7_segment_decoder port map(code => numb(3 downto 0), RippleBlank_In=>d1, segments => disp1);

dip2: g14_7_segment_decoder port map(code => numb(7 downto 4), RippleBlank_In=>d2, segments => disp2);

dip3: g14_7_segment_decoder port map(code => numb(11 downto 8), RippleBlank_In=>d3, RippleBlank_Out=> d2, segments => disp3);

dip4: g14_7_segment_decoder port map(code => numb(15 downto 12), RippleBlank_In=>d4, RippleBlank_Out=> d3, segments => disp4);

end beh;