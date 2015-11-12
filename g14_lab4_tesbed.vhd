-- Juan Carlos Borges

library ieee;
use ieee.std_logic_1164.all;

entity g14_lab4_tesbed is

port(	clk,en,reset	:	in std_logic;
		mode				:	in std_logic_vector(1 downto 0);
		print1, print2	: out std_logic_vector(7 downto 0));
		
end g14_lab4_tesbed;

architecture behavior of g14_lab4_tesbed is
--assigning internal signals
signal print : std_logic_vector(7 downto 0);
signal clock : std_logic;

--components description
component g14_lab4_complexCounterFSM is

port( EN,CLK: IN std_logic;
       input:IN std_logic_vector(1 DOWNTO 0);
           z: OUT std_logic_vector(7 DOWNTO 0));
			  
end component;

component g14_7_segment_decoder is
port(code : in std_logic_vector(3 downto 0);
		RippleBlank_In : in std_logic;
		RippleBlank_Out : out std_logic;
		segments : out std_logic_vector(6 downto 0));

end component;

component g14_lab4_frequencyDivier is

generic(n : integer := 500000);

port(	clk,en	: in std_logic;
		reset		: in std_logic;
		newClk	: out std_logic
		);
		
end component;

begin

FDivider: g14_lab4_frequencyDivier port map(clk => clk, en => en, reset => reset, newClk => clock);
complex : g14_lab4_complexCounterFSM port map(en => en, clk => clock, input => mode, z => print);
encod1  : g14_7_segment_decoder port map(code => print(7 downto 4), RippleBlank_In => '1', segments => print1);
encod2  : g14_7_segment_decoder port map(code => print(7 downto 4), RippleBlank_In => '0', segments => print1);

end behavior;
 