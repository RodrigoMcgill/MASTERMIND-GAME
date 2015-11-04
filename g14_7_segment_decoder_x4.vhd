library ieee;
use ieee.std_logic_1164.all;

entity g14_7_segment_decoder_x4 is
port(code      : in std_logic_vector(3 downto 0);
     segments4 : out std_logic_vector(6 downto 0);
	  segments3 : out std_logic_vector(6 downto 0);
	  segments2 : out std_logic_vector(6 downto 0);
	  segments1 : out std_logic_vector(6 downto 0));


end g14_7_segment_decoder_x4;

architecture implementation of g14_7_segment_decoder_x4 is

component g14_7_segment_decoder
		port(code             : in std_logic_vector(3 downto 0);
			  RippleBlank_In   : in std_logic;
			  RippleBlank_Out  : out std_logic;
		     segments         : out std_logic_vector(6 downto 0));
     end component;
     

Signal RippleBlank_In_passing4To3 : std_logic;
Signal RippleBlank_In_passing3To2 :std_logic;
Signal RippleBlank_In_passing2To1 :std_logic;



Signal lastRippleBlankOut : std_logic;
begin


		inst1: g14_7_segment_decoder     --left most LED
		Port map(code => "0000" , RippleBlank_In=> '1'  , RippleBlank_Out=> RippleBlank_In_passing4To3   , segments=>segments4);
		
		inst2: g14_7_segment_decoder     
		Port map(code => code , RippleBlank_In=> RippleBlank_In_passing4To3  , RippleBlank_Out=> RippleBlank_In_passing3To2  , segments=>segments3);
		
		inst3: g14_7_segment_decoder 
		Port map(code => "0000" , RippleBlank_In=> RippleBlank_In_passing3To2  , RippleBlank_Out=> RippleBlank_In_passing2To1   , segments=>segments2);
		
		inst4: g14_7_segment_decoder    --right most LED
		Port map(code => "0000" , RippleBlank_In=> RippleBlank_In_passing2To1  , RippleBlank_Out=> lastRippleBlankOut  , segments=>segments1);

end implementation;