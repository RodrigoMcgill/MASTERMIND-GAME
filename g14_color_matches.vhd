library ieee;
library lpm;  -- include the altera lpm library
LIBRARY altera_mf;  -- 
use lpm.lpm_components.all;
use ieee.std_logic_1164.all;


entity g14_color_matches is
      port (P1,P2,P3,P4     : in   std_logic_vector(2 downto 0);
            G1,G2,G3,G4     : in   std_logic_vector(2 downto 0);
		     num_exact_matches: out  std_logic_vector(2 downto 0);
		     num_color_matches: out  std_logic_vector(2 downto 0));
		     

			  end g14_color_matches;


ARCHITECTURE behavior of g14_color_matches is
  
  
    COMPONENT g14_num1s
              PORT (X: in std_logic_vector(3 DOWNTO 0);
                    num1s: out std_logic_vector(2 DOWNTO 0));
               END COMPONENT;
        
   
    COMPONENT g14_num_matches
	           PORT(P1, P2, P3, P4        : in  std_logic_vector(2 downto 0);
                  G1, G2, G3, G4        : in  std_logic_vector(2 downto 0);
	                 N                    : out std_logic_vector(2 downto 0));
						  END COMPONENT;
	 
	
			    
   COMPONENT g14_minimum3
	          PORT(N,M  :in  std_logic_vector(2 downto 0);
                  min :out std_logic_vector(2 downto 0));

   END COMPONENT;
   
   
SIGNAL output                              :std_logic_vector(2 downto 0);
--SIGNAL Result_comp                         : std_logic_vector(3 downto 0);
SIGNAL EQ4,EQ3,EQ2,EQ1,EQ44,EQ33,EQ22,EQ11 : std_logic_vector(7 downto 0);	
SIGNAL min1,min2,min3,min4,min5,min6       : std_logic_vector(2 downto 0);
SIGNAL result_of_1_2, result_of_1_2_3,result_of_1_2_3_4,result_of_1_2_3_4_5 : std_logic_vector(2 downto 0);	
SIGNAL NP1,NP2,NP3,NP4,NP5,NP6,NG1,NG2,NG3,NG4,NG5,NG6     : std_logic_vector(2 downto 0);
SIGNAL final_result :std_logic_vector( 2 downto 0);

BEGIN
		 ----------calculating num_exact_matches => score(1)-------
   
    I_begin: g14_num_matches
	          PORT MAP(P1=>P1,P2=>P2,P3=>P3,P4=>P4,G1=>G1,G2=>G2,G3=>G3,G4=>G4,N=>output) ;
	num_exact_matches <= output;
		  
		-------------------------------------------------------------  
		  
		  ----------calculating num_color_matches => score(2)-------
		  
	--De-coding	  
   I2_1inst : LPM_DECODE	
             GENERIC MAP(LPM_WIDTH => 3, LPM_DECODES => 8)	
             PORT MAP( Data => P4, EQ => EQ4);
   I2_2inst : LPM_DECODE
             GENERIC MAP (LPM_WIDTH => 3, LPM_DECODES => 8)
	           PORT MAP( Data => P3, EQ => EQ3);
	I2_3inst : LPM_DECODE
            	GENERIC MAP (LPM_WIDTH => 3, LPM_DECODES => 8)
	           PORT MAP( Data => P2, EQ => EQ2);	
   I2_4inst : LPM_DECODE
             GENERIC MAP(LPM_WIDTH => 3, LPM_DECODES => 8)
	           PORT MAP( Data => P1, EQ => EQ1);
   
   I2_5inst : LPM_DECODE
             GENERIC MAP (LPM_WIDTH => 3, LPM_DECODES => 8)
	           PORT MAP( Data => G4, EQ => EQ44);
   I2_6inst : LPM_DECODE
             GENERIC MAP (LPM_WIDTH => 3, LPM_DECODES => 8)
	           PORT MAP( Data => G3, EQ => EQ33);
   I2_7inst : LPM_DECODE
            GENERIC MAP (LPM_WIDTH => 3, LPM_DECODES => 8)
	           PORT MAP( Data => G2, EQ => EQ22);
   I2_8inst : LPM_DECODE
             GENERIC MAP(LPM_WIDTH => 3, LPM_DECODES => 8)
	           PORT MAP( Data => G1, EQ => EQ11);
			  
	--Calculating the number of 1s and output NPs and NGs		 
	Inum1_NP1st_color: g14_num1s  
	                 PORT MAP(X(3)=>EQ1(0), X(2)=>EQ2(0), X(1)=> EQ3(0), X(0)=>EQ4(0), num1s => NP1);
	Inum1_NP2st_color: g14_num1s  
	                 PORT MAP(X(3)=>EQ1(1), X(2)=>EQ2(1), X(1)=> EQ3(1),  X(0)=>EQ4(1), num1s => NP2);
	Inum1_NP3st_color: g14_num1s  
	                 PORT MAP(X(3)=>EQ1(2), X(2)=>EQ2(2), X(1)=> EQ3(2),  X(0)=>EQ4(2), num1s => NP3);							 
	Inum1_MP4st_color: g14_num1s  
	                 PORT MAP(X(3)=>EQ1(3), X(2)=>EQ2(3), X(1)=> EQ3(3),  X(0)=>EQ4(3),  num1s => NP4); 						  
   Inum1_NP5st_color: g14_num1s  
	                 PORT MAP(X(3)=>EQ1(4), X(2)=>EQ2(4), X(1)=> EQ3(4),  X(0)=>EQ4(4), num1s=> NP5);						  
	Inum1_NP6st_color: g14_num1s  
	                 PORT MAP(X(3)=>EQ1(5), X(2)=>EQ2(5), X(1)=> EQ3(5),  X(0)=>EQ4(5), num1s => NP6);
	
						  
	Inum1_NG1st_color: g14_num1s  
	                 PORT MAP(X(3)=>EQ11(0), X(2)=>EQ22(0), X(1)=> EQ33(0), X(0)=>EQ44(0), num1s => NG1);
	Inum1_NG2st_color: g14_num1s  
	                 PORT MAP(X(3)=>EQ11(1), X(2)=>EQ22(1), X(1)=> EQ33(1),  X(0)=>EQ44(1), num1s => NG2);
	Inum1_NG3st_color: g14_num1s  
	                 PORT MAP(X(3)=>EQ11(2), X(2)=>EQ22(2), X(1)=> EQ33(2),  X(0)=>EQ44(2), num1s => NG3);							 
	Inum1_NG4st_color: g14_num1s  
	                 PORT MAP(X(3)=>EQ11(3), X(2)=>EQ22(3), X(1)=> EQ33(3),  X(0)=>EQ44(3),  num1s => NG4); 						  
   Inum1_NG5st_color: g14_num1s  
	                 PORT MAP(X(3)=>EQ11(4), X(2)=>EQ22(4), X(1)=> EQ33(4),  X(0)=>EQ44(4), num1s => NG5);						 

	Inum1_NG6st_color: g14_num1s  
	                 PORT MAP(X(3)=>EQ11(5), X(2)=>EQ22(5), X(1)=> EQ33(5),  X(0)=>EQ44(5), num1s => NG6);
	

   --Calculating the minimum of NP and NG	
	Imin3_1: g14_minimum3 
                    PORT MAP(M=>NP1, N=>NG1, min=>min1); 
	Imin3_2: g14_minimum3 
                    PORT MAP(M=>NP2, N=>NG2, min=>min2);
	Imin3_3: g14_minimum3 
                    PORT MAP(M=>NP3, N=>NG3, min=>min3);
	Imin3_4: g14_minimum3 
                    PORT MAP(M=>NP4, N=>NG4, min=>min4);
	Imin3_5: g14_minimum3 
                    PORT MAP(M=>NP5, N=>NG5, min=>min5);
	Imin3_6: g14_minimum3 
                    PORT MAP(M=>NP6, N=>NG6, min=>min6);				  
						
	--using the add.module   min1 = 1 , min 2 = 2 ...
	Ins_add1:  lpm_add_sub
	   GENERIC MAP (LPM_WIDTH => 3)
	               PORT MAP(dataa=>min1, datab=>min2, result=> result_of_1_2);                 
	Ins_add2:  lpm_add_sub
	 GENERIC MAP(LPM_WIDTH => 3)
	                PORT MAP(dataa=>result_of_1_2, datab=>min3, result=> result_of_1_2_3);
	Ins_add3:  lpm_add_sub
	 GENERIC MAP(LPM_WIDTH => 3)
	                PORT MAP(dataa=>result_of_1_2_3, datab=>min4, result=> result_of_1_2_3_4);				 
	Ins_add4:  lpm_add_sub
	 GENERIC MAP(LPM_WIDTH => 3)
	                PORT MAP(dataa=>result_of_1_2_3_4, datab=>min5, result=> result_of_1_2_3_4_5);						 
	Ins_add5:  lpm_add_sub
	 GENERIC MAP(LPM_WIDTH => 3)
	                PORT MAP(dataa=>result_of_1_2_3_4_5, datab=>min6, result=> final_result);						 
	
	--using the sub.module
   Ins_sub:   lpm_add_sub
   GENERIC MAP (LPM_WIDTH => 3)
	                PORT MAP(dataa=>final_result, datab=>output, result=>num_color_matches, add_sub =>'0');
	
		  
		  end behavior;
