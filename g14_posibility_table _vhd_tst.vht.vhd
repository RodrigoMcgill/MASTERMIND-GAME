--Rodrigo Mendoza
--testbench

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity g14_possibility_table_tst is 

end g14_possibility_table_tst;


architecture implementation of g14_possibility_table_tst is

				Signal		TC_EN 	:  std_logic;
				Signal		TC_RST	:  std_logic; 
				Signal		TM_IN		:  std_logic; 
				Signal		TM_EN		:  std_logic; 
				Signal		CLK	  	:  std_logic;
				Signal		TC_LAST	:  std_logic; -- last count flag
				Signal		TM_ADDR	:  std_logic_vector(11 downto 0);
				Signal		TM_OUT	:  std_logic; 
				constant  CLK_PERIOD:  time :=  40 ns ;

		COMPONENT g14_possibility_table
            PORT( TC_EN 	: in std_logic; -- table counter enable
						      TC_RST	: in std_logic; -- table counter reset
						      TM_IN		: in std_logic; -- table memory input data
						      TM_EN		: in std_logic; -- table memory write enable
						        CLK		: in std_logic;
					     	      TC_LAST	: out std_logic; -- last count flag
						      TM_ADDR	: out std_logic_vector(11 downto 0);
					        	TM_OUT	: out std_logic) ;
      END COMPONENT;


Begin

   i1 :  g14_possibility_table
	PORT MAP(TC_EN => TC_EN, TC_RST => TC_RST, TM_IN => TM_IN, TM_EN=> TM_EN, CLK => CLK,TC_LAST =>TC_LAST, TM_ADDR => TM_ADDR,TM_OUT => TM_OUT);
	
	init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT; 
                                                      
END PROCESS init;                                           

always : PROCESS                                              

--optional sensitivity list                                    
BEGIN                                                         

   
  TC_RST <= '1';
  TC_EN  <= '0';
  wait for 20 ns;
  TC_RST <= '0';
  TC_EN  <= '1';
  TM_EN <= '1';
  TM_IN <= '1';
   
	 
	 for i IN 0 to 1295 loop    --clock cycles writting 1
			TM_EN <= '1';
         TM_IN <= '1';
			CLK <= '1'  ;
			wait for CLK_PERIOD/2 ;
			CLK <= '0' ;
			wait for CLK_PERIOD/2;
      
	 end loop;
		TM_EN <= '0';
      TM_IN <= '1'; 
   
  
	for j IN 0 to 1295 loop    --reading is 1
	
			CLK <= '1'  ;
			wait for CLK_PERIOD/2 ;
			CLK <= '0' ;
			wait for CLK_PERIOD/2;
      
	 end loop;
		
	 TM_EN <= '1';
    TM_IN <= '0'; 
		for k IN 0 to 1294 loop    -- writing 0
			CLK <= '1'  ;
			wait for CLK_PERIOD/2 ;
			CLK <= '0' ;
			wait for CLK_PERIOD/2;
      
	 end loop;
 
		 
    
		for l IN 0 to 1294 loop    -- reding 0
		TM_EN <= '0';
     TM_IN <= '0'; 
			CLK <= '1'  ;
			wait for CLK_PERIOD/2 ;
			CLK <= '0' ;
			wait for CLK_PERIOD/2;
      
	 end loop;
   wait;
WAIT;                                                        
END PROCESS always;                                          
END implementation;

	
	
