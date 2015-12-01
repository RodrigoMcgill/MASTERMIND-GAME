--Juan Carlos Borges
library ieee;
use ieee.std_logic_1164.all;

entity g14_mastermind is
port(	USER, USR_RST 		: in std_logic; -- user defined inputs
		START, READY		: in std_logic; -- start ready signal for the game
		RND					: in std_logic; -- set random number
		CLK					: in std_logic;
		HEX1, HEX2			: out std_logic_vector(6 downto 0);
		HEX3, HEX4			: out std_logic_vector(6 downto 0)
		);
end g14_mastermind;

architecture behav of g14_mastermind is

signal SR_SEL, P_SEL, GR_SEL, SR_LD, GR_LD	: std_logic;
signal TM_IN, TM_EN, TC_RST, SOLVED				: std_logic;
signal TC_LAST, SC_CMP, SD_EN 					: std_logic;

component g14_mastermind_controller is 
port(	SC_CMP,TC_LAST,START					: in std_logic;
		USER, READY,CLK						: in std_logic;
		SR_SEL,P_SEL,GR_SEL,GR_LD,SR_LD	: out std_logic;
		TM_IN,TM_EN,TC_EN,TC_RST,SOLVED	: out std_logic;
		SD_EN										: out std_logic);
end component;

component g14_mastermind_datapath is
port( SR_SEL,P_SEL,GR_SEL,GR_LD,SR_LD	: in std_logic;
		TM_IN,TM_EN,TC_EN,TC_RST, CLK	: in std_logic;
		EXIT_PATTERN 							: in std_LOGIC_VECTOR(11 downto 0);
		SC_CMP,TC_LAST							: out std_logic);
end component;

component g14_display_user is
port(	guess 				: in std_logic_vector(11 downto 0);
		score 				: in std_logic_vector(3 downto 0);
		USR_RST, USER		: in std_logic;
		DS_EN, SOLVED		: in std_logic;
		HEX1, HEX2			: out std_logic_vector(6 downto 0);
		HEX3, HEX4			: out std_logic_vector(6 downto 0)
		);
end component;

begin



end behav;