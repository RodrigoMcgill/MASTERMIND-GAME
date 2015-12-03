--Rodrigo
library IEEE;
USE ieee.std_logic_1164.all;
entity g14_MDecoder_to_hex is
Port( code_in:          in std_logic_vector(3 downto 0);
		code_for_LEDS : out std_logic_vector(7 downto 0));

		end g14_MDecoder_to_hex;
		
architecture impl of g14_MDecoder_to_hex is
		
		Begin
		
		process(code_in) 
			Begin
				case code_in is
				when "0000" => code_for_LEDS <= "00000000"; --0,0
				when "0001" => code_for_LEDS <= "00000001"; --0,1
				when "0010" => code_for_LEDS <= "00000010"; --0,2
				when "0011" => code_for_LEDS <= "00000011"; --0,3
				when "0100" => code_for_LEDS <= "00000100"; --0,4
				when "0101" => code_for_LEDS <= "00010000"; --1,0
				when "0110" => code_for_LEDS <= "00010001"; --1,1
				when "0111" => code_for_LEDS <= "00010010"; --1,2
				when "1000" => code_for_LEDS <= "00010011"; --1,3 
				when "1001" => code_for_LEDS <= "00100000"; --2,0
				when "1010" => code_for_LEDS <= "00100001"; --2,1
		      when "1011" => code_for_LEDS <= "00100010"; --2,2
				when "1100" => code_for_LEDS <= "00110000"; --3,0
				when "1101" => code_for_LEDS <= "01000000"; --4,0
				when others => code_for_LEDS <= "11111111"; -- others
				end case;
			end process;
		end impl;