--Juan Carlos Borges
library ieee;
use ieee.std_logic_1164.all;

entity g14_mastermind is
port(	USER, USR_RST 		: in std_logic; -- user defined inputs
		START, READY		: in std_logic; -- start ready signal for the game
		RNG, check			: in std_logic; -- set random number
		CLK					: in std_logic;
		position				: in std_logic_vector(1 downto 0);
		color 				: in std_logic_vector(2 downto 0);
		HEX3					: out std_logic_vector(6 downto 0);
		HEX2					: out std_logic_vector(6 downto 0);
		HEX1					: out std_logic_vector(6 downto 0);
		HEX0					: out std_logic_vector(6 downto 0)
		);
end g14_mastermind;

architecture behav of g14_mastermind is
signal P, G, GD, GUI									: std_logic_vector(11 downto 0);
signal sc												: std_logic_vector(3 downto 0);
signal SR_SEL, P_SEL, GR_SEL, SR_LD, GR_LD	: std_logic;
signal TM_IN, TM_EN, TC_RST, TC_EN,SOLVED		: std_logic;
signal TC_LAST, SC_CMP, SD_EN 					: std_logic;

component g14_mastermind_controller is 
port(	SC_CMP,TC_LAST,START					: in std_logic;
		USER, READY,CLK, usr_rst			: in std_logic;
		SR_SEL,P_SEL,GR_SEL,GR_LD,SR_LD	: out std_logic;
		TM_IN,TM_EN,TC_EN,TC_RST,SOLVED	: out std_logic;
		SD_EN										: out std_logic);
end component;

component g14_mastermind_datapath is
port(  SR_SEL,P_SEL,GR_SEL,GR_LD,SR_LD	: in std_logic;
		TM_IN,TM_EN,TC_EN,TC_RST, CLK		: in std_logic;
		EXIT_PATTERN,GUESS 					: in std_LOGIC_VECTOR(11 downto 0);
		DGUESS									: out std_logic_vector(11 downto 0);
		xcore										: out std_logic_vector(3 downto 0);
		SC_CMP,TC_LAST							: out std_logic);
end component;

component g14_display_user is
port(	guess, userIN				: in std_logic_vector(11 downto 0);
		score 						: in std_logic_vector(3 downto 0);
		USR_RST, CHECK, READY	: in std_logic;
		DS_EN, SOLVED,USR			: in std_logic;
		HEX3, HEX2					: out std_logic_vector(6 downto 0);
		HEX1, HEX0					: out std_logic_vector(6 downto 0)
		);
end component;

component g14_user_interface is
port( position						: in std_logic_vector(1 downto 0);
		color							: in std_logic_vector(2 downto 0);
		TC_EN, USER, USR_RST		: in std_logic;
		START, CLK					: in std_logic;
		EXT_PAT, GUESS, GUI		: out std_logic_vector(11 downto 0));

end component;

begin

ctrl: g14_mastermind_controller port map(TC_RST=>TC_RST, TC_EN=>TC_EN, TM_EN=> TM_en, tm_in=>tm_in,
														gr_ld=>gr_ld, sr_LD=> sr_LD, gr_sel=>gr_SEL, P_sEL=>P_sel, SR_sel=>SR_sel,
														Start=>start, ready=>ready, user=>user, usr_RST=>usr_RST, clk=>clk,
														SC_CMP=>SC_CMP, TC_LAST=>TC_LAST, SD_EN=>SD_EN, solved=>solved);

disp: g14_display_user port map(score=>sc, guess=>GD, DS_EN=>SD_EN, usr_RST=>usr_RST, solVED=>solVED, 
											hex0=>hex0, hex1=>hex1, hex2=>hex2, hex3=>hex3, userIN=>gui, ready=>ready, 
											usr=>user,check=>check);

Dpath: g14_mastermind_datapath port map(TC_RST=>TC_RST, TC_EN=>TC_EN, TM_EN=> TM_en, tm_in=>tm_in,
														gr_ld=>gr_ld, sr_LD=> sr_LD, gr_sel=>gr_SEL, P_sEL=>P_sel, SR_sel=>SR_sel,clk => clk,
														EXIT_PATTERN=>P, GUESS=>G, SC_CMP=>SC_CMP, TC_LAST=>TC_LAST, xcore=>sc, Dguess=>GD);

interface: g14_user_interface port map(user=> user, usr_RST=>usr_RST, TC_EN=>RNG, START=>STArT, ext_PAT=>P, guess=>G, clk=>clk, gui => gui,
													position => position, color => color);

end behav;