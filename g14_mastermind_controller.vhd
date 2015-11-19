--Juan Carlos Borges

library ieee;
use ieee.std_logic_1164.all;

entity g14_mastermind_controller is 
port(	SC_CMP,TC_LAST,START,READY,CLK	: in std_logic;
		SR_SEL,P_SEL,GR_SEL,GR_LD,SR_LD	: out std_logic;
		TM_IN,TM_EN,TC_EN,TC_RST,SOLVED	: out std_logic);

end g14_mastermind_controller;

architecture behavior of g14_mastermind_controller is
	signal isSolved = std_logic;
	TYPE state_type IS (waitStart,startTable,setTable,waitReady,checkGuess,addScore,getNextGuess,last);
	Signal y : state_type;
	signal output : std_logic_vector(9 downto 0);

begin
SR_SEL 	<=	output(9);
P_SEL 	<=	output(8);
GR_SEL	<=	output(7);
GR_LD 	<=	output(6);
SR_LD 	<=	output(5);
TM_IN 	<=	output(4);
TM_EN 	<=	output(3);
TC_EN 	<=	output(2);
TC_RST 	<=	output(1);
SOLVED 	<=	output(0);
process (clk)
begin
	if(rising_edge(clk)) then
		case y is
		
-- waits for the start signal which means a new game.
			when waitStart =>
				output <= "0000000000";
				if(START = '1') then
					y <= startTable;
				end if;
				
-- resets the couter in the table
			when startTable =>
				output <= "0000000000";
				y <= setTable;
			
-- sets all the value of the possibility table to 1
			when setTable =>
				output <= "0000001100";
				if (TC_LAST = '1') then
					y <= waitReady;
				end if;

-- waits for Ready signal from the oponent
			when waitReady =>
				output <= "0000000000";
				if(READY='1')) then
					y <= checkGuess;
				end if;
			
-- checks if the guess is correct
			when checkGuess =>
				output <= "0000000000";
				if(READY='0')) then
					if (SC_CMP = '1') then
						y <= Last;
					elsif (SC_CMP = '0') then
						y <= addScore;
					end if;
				end if;

-- is the guess is not correct it adds the result into the possibility table	
			when addScore =>
				output <= "0000000000";
				
-- take the first value of the possibility table that is non zero
			when getNextGuess =>
				output <= "0000000000";
			
-- the bot has guessed the pattern
			when Last => 
				output <= "0000000000";
				if (START = '0') then
					y <= waitStart;
				end if;
		end case;
	end if;
end process;

end behavior;