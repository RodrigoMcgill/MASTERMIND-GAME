--Rodrigo Mendoza
library IEEE;
USE ieee.std_logic_1164.all;
library lpm;
use lpm.lpm_components.all;

entity g14_score_encoder is
port(  score_code         : out std_logic_vector(3 downto 0);
       num_exact_matches  : in std_logic_vector (2 downto 0);
		 num_color_matches  : in std_logic_vector (2 downto 0));



end g14_score_encoder;

ARCHITECTURE behavior of g14_score_encoder is

SIGNAL six_bit_full_scorer: std_logic_vector( 5 downto 0);
 


	BEGIN
	  six_bit_full_scorer <= num_exact_matches & num_color_matches;

		process (six_bit_full_scorer) is
		BEGIN

			case   six_bit_full_scorer is
				when "000000" => score_code <= "0000";
				when "000001" => score_code <= "0001";
				when "000010" => score_code <= "0010";
				when "000011" => score_code <= "0011";
				when "000100" => score_code <= "0100";
				when "001000" => score_code <= "0101";
				when "001001" => score_code <= "0110";
				when "001010" => score_code <= "0111";
				when "001011" => score_code <= "1000";
				when "010000" => score_code <= "1001";
				when "010001" => score_code <= "1010";
				when "010010" => score_code <= "1011";
				when "011000" => score_code <= "1100";
				when "100000" => score_code <= "1101";
				  
				when "011001" => score_code <= "1110";     --special case (3,1) will never occur
        when others  =>  score_code <="1111" ;     -- other type of score will not be possible
			end case;
   

    end process;

end behavior;