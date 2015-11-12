--g14_color_matches_tst_vht
LIBRARY IEEE;                                             
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
                              

ENTITY g14_lab4_complexCounterFSM_vhd_tst IS
END g14_lab4_complexCounterFSM_vhd_tst;

ARCHITECTURE behavior OF g14_lab4_complexCounterFSM_vhd_tst IS
-- constants                                                 
-- signals                                                   
 SIGNAL EN,CLK       : std_logic;
 SIGNAL input        : std_logic_vector(1 DOWNTO 0);
 SIGNAL z            : std_logic_vector(7 DOWNTO 0);
 CONSTANT CLK_PERIOD : time := 40 ns;



  COMPONENT g14_lab4_complexCounterFSM 
    PORT(EN,CLK:IN std_logic;
          input:IN std_logic_vector(1 DOWNTO 0);
              z:OUT std_logic_vector(7 DOWNTO 0));
	 END COMPONENT;


		
	BEGIN
	i1 : g14_lab4_complexCounterFSM
	PORT MAP(EN=>EN, CLK=>CLK, input=>input, z=>z);

		init : PROCESS                                               
		-- variable declarations                                     
			BEGIN                                                        
			-- code that executes only once                      
			WAIT; 
                                                      
		END PROCESS init;                                           
	
	
		always : PROCESS                                              

		--optional sensitivity list                                    
				BEGIN                                                         
       
		 for i IN 0 to 5 LOOP
		     
			  EN <= '1';
			  input <= "10";
		    CLK <= '0';
			 wait for CLK_PERIOD/2;
			 CLK <= '1';
			 wait for CLK_PERIOD/2;
       
		 END LOOP;
  
           
		  
		  for j IN 0 to 20 LOOP
           
			  EN <= '0';
			 CLK <= '0';
			 wait for CLK_PERIOD/2;
			 CLK <= '1';
			 wait for CLK_PERIOD/2;
			  
			END LOOP;
			  
  
 


 
          wait;
                                                            
       END PROCESS always;                                          
END behavior;