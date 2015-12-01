--Juan Carlos Borges

library ieee;
use ieee.std_logic_1164.all;

entity g14_mastermind_controller is 
port(	SC_CMP,TC_LAST,START					: in std_logic;
		USER, READY,CLK, usr_rst			: in std_logic;
		SR_SEL,P_SEL,GR_SEL,GR_LD,SR_LD	: out std_logic;
		TM_IN,TM_EN,TC_EN,TC_RST,SOLVED	: out std_logic;
		SD_EN										: out std_logic);

end g14_mastermind_controller;

architecture behavior of g14_mastermind_controller is
	signal isSolved : std_logic;
	TYPE state_type IS (waitStart,resetCounter,setTable,waitReady,checkGuess,addScore,getNextGuess, displayResult, last);
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
	if(falling_edge(clk)) then
		case y is
		
-- waits for the start signal which means a new game.
			when waitStart =>
				output <= "0000000000";
				if(START = '1') then                 
					y <= resetCounter;       
				else
				   y <= waitStart;
				end if;
				
-- resets the counter in the table
			when resetCounter =>
			output <= "0000000010";
			if(START = '0') then 
					y <= waitStart;
			elsif(TC_LAST = '0') then
					y <= setTable;
			end if;
			
-- sets all the value of the possibility table to 1
			when setTable =>
		   output <= "0000011100";
			if(START = '0') then 
					y <= waitStart;
			elsif (TC_LAST = '1') then
					output <= "1011100000";
					y <= waitReady;
			end if;


-- waits for Ready signal from the oponent
			when waitReady =>
			SD_EN <= '1';
			if(START = '0') then 
					y <= waitStart;
			elsif(READY = '0') then
			-- If the guess comes from the setTable or the displayResult states
					if(TC_LAST = '1') then
							output <= "1011100000";
			-- If the guess comes form the getNextGuess 
					elsif(TC_LAST = '0') then
							output <= "1001100000";
		         end if;
			elsif(READY='1') then
					if(usr_rst = '0' and user = '1') then
						SD_EN <='0';
						output <= "1000000000";
						y <= checkGuess;
					elsif (User = '0') then
					--verifies that the gues is correct
						SD_EN <='0';
						output <= "1000000000";
						y <= checkGuess;
					end if;
			end if;
			
-- checks if the first trivial guess is correct
			when checkGuess =>
				SD_EN <= '0';
				output <= "1000000000";
				if(START = '0') then 
					y <= waitStart;
					
				-- If the guess is correct go to the end
				elsif (SC_CMP = '1') then
						output <= "0000000001";
						y <= Last;
						
				-- If the guess is not correct add the value to the table
				elsif (SC_CMP = '0') then
				-- This is if the player is a human
						if(USER = '1') then
							SD_EN <='1';
							y <= displayResult;
				-- This is for the first call to the table, 
				-- TC_RST = 1 so the table starts at first element
						elsif(TC_LAST = '1')then
							output <= "0100000010";
							y <= addScore;
				-- This is for all subsequent guesses, 
				-- TC_RST = 0 so the table continues at current values
						elsif(TC_LAST = '0') then 
							output <= "0100000000";
							y <= addScore;
				      end if;
				end if;

-- is the guess is not correct it adds the result into the possibility table	
			when addScore =>
				if(START = '0') then 
					y <= waitStart;
				-- This case should never happen, but incase it does, it will restart the table.
				elsif(TC_LAST = '1' and SC_CMP = '0') then
					output <= "0100001100";
				-- If the ADRR doesn't give the same result to the previous guess
				-- It makes the value at the table 0 and go to the next ADRR
				elsif(SC_CMP = '0') then
					output <= "0100001100";
				-- If the ADRR gives the same result to the previous guess.
				-- Stops the clock and  goes to wait for ready signal.
				elsif(SC_CMP = '1') then
					output <= "0100011000";
					y <= getNextGuess;
				end if;
				
-- take the first value of the possibility table that is non zero
			when getNextGuess =>
				SD_EN<='1';
				output <= "1000000000";
				if(START = '0') then 
					y <= waitStart;
				elsif(READY = '0') then
					y <= waitReady;
				end if;
				
-- Displays the result of the human user.			
			when displayResult =>
				SD_EN <= '0';
				output <= "1000000000";
				if(READY = '0') then
					y <= waitReady;
				end if;
				
-- the bot has guessed the pattern
			when Last => 
				output <= "0000000001";
				if (START = '0') then
					y <= waitStart;
				else 
				   y <= LAST;
				end if;
		
		end case;
	end if;
end process;

end behavior;