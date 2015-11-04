--Rodrigo Mendoza
library ieee;
Use ieee.std_logic_1164.all;

entity g14_mastermind_score is
		port( P1,P2,P3,P4       : in  std_logic_vector(2 downto 0);
			    G1,G2,G3,G4      : in  std_logic_vector(2 downto 0);
	        exact_match_score : out std_logic_vector(2 downto 0);
	        color_match_score : out std_logic_vector(2 downto 0);
	        score_code        : out std_logic_vector(3 downto 0));
 
 end g14_mastermind_score;
 
 ARCHITECTURE behavior of g14_mastermind_score is
 
    		
		
		COMPONENT g14_color_matches
		PORT (P1,P2,P3,P4         : in   std_logic_vector(2 downto 0);
          G1,G2,G3,G4         : in   std_logic_vector(2 downto 0);
		      num_exact_matches   : out  std_logic_vector(2 downto 0);
		      num_color_matches   : out  std_logic_vector(2 downto 0));
		END COMPONENT;

		
 
		COMPONENT g14_score_encoder
		PORT  ( num_exact_matches    : in  std_logic_vector(2 downto 0);
				  num_color_matches    : in  std_logic_vector(2 downto 0);
		        score_code           : out std_logic_vector(3 downto 0)); 
     END COMPONENT;

 		SIGNAL out1: std_logic_vector(2 downto 0);
 		SIGNAL out2: std_logic_vector(2 downto 0);
 		SIGNAL out3: std_logic_vector(3 downto 0);
	  
BEGIN
	  
	   
		--Find the number of color matches		
	 Inst2: g14_color_matches
	    PORT MAP(P1=>P1,P2=>P2,P3=>P3,P4=>P4,G1=>G1,G2=>G2,G3=>G3,G4=>G4,
		           num_exact_matches=>out1,
		           num_color_matches=>out2);
					      
					      
				
		
		--Find the score code combining both 1) and 2)
	Inst3: g14_score_encoder
		 PORT MAP(num_exact_matches=>out1,num_color_matches=>out2,score_code=>out3);
	   score_code <= out3;
	 
 
 end behavior;