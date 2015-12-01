-- Juan Carlos Borges
library ieee;
use ieee.std_logic_1164.all;

entity g14_mastermind_datapath is
port( SR_SEL,P_SEL,GR_SEL,GR_LD,SR_LD	: in std_logic;
		TM_IN,TM_EN,TC_EN,TC_RST, CLK		: in std_logic;
		EXIT_PATTERN,GUESS 					: in std_LOGIC_VECTOR(11 downto 0);
		DGUESS									: out std_logic_vector(11 downto 0);
		sc											: out std_logic_vector(3 downto 0);
		SC_CMP,TC_LAST							: out std_logic);
end g14_mastermind_datapath;

architecture implementation of g14_mastermind_datapath is
signal P,G,TM_ADDR,MUXG	: std_logic_vector(11 downto 0);
signal score,RS			: std_logic_vector(3 downto 0);
signal ground				: std_logic_vector(2 downto 0);
signal MUXS, RegSc, sc	: std_logic_vector(5 downto 0);

component g14_mastermind_score is
		port( P1,P2,P3,P4      : in  std_logic_vector(2 downto 0);
			   G1,G2,G3,G4      : in  std_logic_vector(2 downto 0);
	        exact_match_score : out std_logic_vector(2 downto 0);
	        color_match_score : out std_logic_vector(2 downto 0);
	        score_code        : out std_logic_vector(3 downto 0));
 
end component;

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

component g14_comp6 IS 
	PORT
	(	A :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		AeqB :  OUT  STD_LOGIC);
end component;

component g14_register is
generic(N : integer :=5);
port(	data 			: in std_logic_vector(N downto 0);
		enable, CLK : in std_logic;
		display 		: out std_logic_vector(N downto 0));
end component;

begin

with SR_SEL select MUXS <=
				score&"00" when '0',
				"110100" when others;
		--		"------" when others;
				
with P_SEL select P <=
				TM_ADDR when '1',
				EXIT_PATTERN when others;
				
with GR_SEL select MUXG <=
				TM_ADDR when '0',
				GUESS when others;

sc <= score&"00";

Mscore: g14_mastermind_score port map(P1=>P(11 downto 9), P2 =>P(8 downto 6), P3=>P(5 downto 3),P4=>P(2 downto 0), G1=>G(11 downto 9), G2 =>G(8 downto 6), G3=>G(5 downto 3),G4=>G(2 downto 0),score_code=>score, exact_match_score=>ground, color_match_score=>ground);
												  
PosTab: g14_possibility_table port map(TC_EN=>TC_EN, TC_RST=>TC_RST, TM_IN=>TM_IN, TM_EN=>TM_EN, CLK=>CLK,
													TC_LAST=>TC_LAST, TM_ADDR=>TM_ADDR, TM_OUT=>ground(0));
													
ScoreComparator: g14_comp6 port map(A=>RegSc,B=>MUXS,AeqB=>SC_CMP);

ScoreRegister: g14_register port map(data => sc, enable => SR_LD, display => RegSc, clk=>clk);

guessRegister: g14_register generic map(N => 11) port map(data => MUXG, enable => GR_LD,display=>G,CLK=>clk);

end implementation;