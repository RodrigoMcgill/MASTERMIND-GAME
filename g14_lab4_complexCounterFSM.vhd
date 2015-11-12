--@ Author: RODRIGO MENDOZA ARBIZU 
library IEEE;
use ieee.std_logic_1164.all;

entity g14_lab4_complexCounterFSM is

port( EN,CLK: IN std_logic;
       input:IN std_logic_vector(1 DOWNTO 0);
           z: OUT std_logic_vector(7 DOWNTO 0));

end g14_lab4_complexCounterFSM;


architecture behavior of g14_lab4_complexCounterFSM is

	
	TYPE state_type IS (A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Last);
	Signal y : state_type;
	
	BEGIN
	
		PROCESS(CLK,EN)
		BEGIN
		
				
	if(rising_edge(CLK)) then
		
	  if(EN = '0') then
	  y <= y ;
			
	  else
		
			CASE y  is
						WHEN A => 
								if (input = "00") then
									y <= B;
						
								elsif(input ="01") then
									y <= B;
						
								elsif(input = "10") then
									y<=B ;
						
								else
									y <= B;
								end if;
						
						WHEN B => 
								if (input = "00") then
									y <= C;
						
								elsif(input ="01") then
									y <= C;
						
								elsif(input = "10") then
									y <= D ;
						
								else
									y <= B;
								end if;
						  
						 WHEN C => 
								if (input = "00") then
									y <= D;
						
								elsif(input ="01") then
									y <= E;
						
								elsif(input = "10") then
									y <= D ;
						
								else
									y <= B;
							   end if;
							
						  WHEN D => 
								if (input = "00") then
									y <= E;
						
								elsif(input ="01") then
									y <= E;
						
								elsif(input = "10") then
									y <= K ;
						
								else
									y <= B;
							   end if;
							
							WHEN E => 
								if (input = "00") then
									y <= F;
						
								elsif(input ="01") then
									y <= I;
						
								elsif(input = "10") then
									y <= K ;
						
								else
									y <= B;
							   end if;
								
							WHEN F => 
								if (input = "00") then
									y <= G;
						
								elsif(input ="01") then
									y <= I;
						
								elsif(input = "10") then
									y <= K ;
						
								else
									y <= B;
							   end if;
								
							
							
							
						  WHEN G => 
								if (input = "00") then
									y <= H;
						
								elsif(input ="01") then
									y <= I;
						
								elsif(input = "10") then
									y <= K ;
						
								else
									y <= B;
							   end if;
								
						  WHEN H => 
								if (input = "00") then
									y <= I;
						
								elsif(input ="01") then
									y <= I;
						
								elsif(input = "10") then
									y <= K ;
						
								else
									y <= B;
							   end if;
								
								
						   WHEN I => 
								if (input = "00") then
									y <= J;
						
								elsif(input ="01") then
									y <= J;
						
								elsif(input = "10") then
									y <= K ;
						
								else
									y <= B;
							   end if;
								
							WHEN J => 
								if (input = "00") then
									y <= K;
						
								elsif(input ="01") then
									y <= M;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
								
						   WHEN K => 
								if (input = "00") then
									y <= L;
						
								elsif(input ="01") then
									y <= M;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
								
							 WHEN L => 
								if (input = "00") then
									y <= M;
						
								elsif(input ="01") then
									y <= M;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
								
							WHEN M => 
								if (input = "00") then
									y <= N;
						
								elsif(input ="01") then
									y <= P;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
								
							WHEN N => 
								if (input = "00") then
									y <= O;
						
								elsif(input ="01") then
									y <= P;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
							
							
							WHEN O => 
								if (input = "00") then
									y <= P;
						
								elsif(input ="01") then
									y <= P;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
								
							 WHEN P => 
								if (input = "00") then
									y <= Q;
						
								elsif(input ="01") then
									y <= W;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
								
							 WHEN Q => 
								if (input = "00") then
									y <= R;
						
								elsif(input ="01") then
									y <= W;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
								
								
							WHEN R => 
								if (input = "00") then
									y <= S;
						
								elsif(input ="01") then
									y <= W;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
								
								
							WHEN S => 
								if (input = "00") then
									y <= T;
						
								elsif(input ="01") then
									y <= W;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
								
							WHEN T => 
								if (input = "00") then
									y <= U;
						
								elsif(input ="01") then
									y <= W;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
								
							WHEN U => 
								if (input = "00") then
									y <= V;
						
								elsif(input ="01") then
									y <= W;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
								
							
							WHEN V => 
								if (input = "00") then
									y <= W;
						
								elsif(input ="01") then
									y <= W;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
						  
						  WHEN W => 
								if (input = "00") then
									y <= X;
						
								elsif(input ="01") then
									y <= X;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
								
							WHEN X => 
								if (input = "00") then
									y <= Last;
						
								elsif(input ="01") then
									y <= A;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
								
							WHEN LAST => 
								if (input = "00") then
									y <= A;
						
								elsif(input ="01") then
									y <= A;
						
								elsif(input = "10") then
									y <= B ;
						
								else
									y <= B;
							   end if;
						END CASE;
			   END IF;
			END IF;
	END PROCESS;
	
	
		PROCESS(CLK,y)
		
	   BEGIN
	        
			 if(rising_edge(CLK)) then 
				CASE  y is 
				
				   WHEN A =>    
				   z <= "00000010";     --2
				   
				   WHEN B =>
				   z <= "00000011";     -- 3
				
			      WHEN C =>
				   z <= "00000101";    -- 5
				   
					WHEN D =>
				   z <= "00000111";	 -- 7
					
					WHEN E =>          --11
					z <= "00010001";    
					
					WHEN F =>          --13
					z <= "00010011";
					
	            WHEN G =>         --17
					z <= "00010111";
					
					WHEN H =>         --19
					z <= "00011001";
	        
			      WHEN I =>      --23
					z <= "00100011";
					
					WHEN J =>       --29
					z <= "00101001";
					
					WHEN K =>     --31
					z <= "00110001";
				
				   WHEN L =>    --37
					z <= "00110111";
					
					WHEN M =>  --41
					z <= "10000001";
					
					WHEN N =>   --43
					z <= "10000011";
					
				   WHEN O =>    --47
					z <= "10000111";
					
					WHEN P =>    --53
					z <= "01010011";
					
					WHEN Q =>    -- 59
					z <= "01011001";
					 
					WHEN R =>    --61
					z <= "01100001";
					
					WHEN S =>   --67
					z <= "01100111";
					
					WHEN T =>  --71
					z <= "01110001";
					
					WHEN U =>  --73
					z <= "01110011";
					
					WHEN V =>  --79
					z <= "01111001";
					
					WHEN W =>  -- 83
					z <= "10000011";
					
					WHEN X => -- 89
					z <= "10001001";
					
					WHEN LAST =>  -- 97
					z <= "10010111";
					
					END CASE;
			 END if ;	
		END PROCESS;
end behavior;





