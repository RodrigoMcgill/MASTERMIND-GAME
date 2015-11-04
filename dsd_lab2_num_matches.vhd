--exact  match counting	 part of the scoring circuit  for the Mastermind game 
--
--entity name: g00_num_matches;
--
--Copyright (C) 2015 James Clark
--Version 1.0
--Author: James J.Clark; clark@cim.mcgill.ca
--Date: June 15,2015

library ieee;    -- all use of the std_logic_vector type
USE ieee.std_logic_1164.all;

entity g14_num_matches is
port(P1, P2, P3, P4        : in  std_logic_vector(2 downto 0);
     G1, G2, G3, G4        : in  std_logic_vector(2 downto 0);
	  N                     : out std_logic_vector(2 downto 0));

	  end g14_num_matches;
	  
architecture a of  g14_num_matches is
	  
	     COMPONENT g14_comp6
	         PORT(A : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		           B : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		        AeqB : OUT STD_LOGIC );
        END COMPONENT;

        COMPONENT g14_nums1s
	         PORT(  X: in std_logic_vector (3 DOWNTO 0);
               num1s:out std_logic_vector(2 DOWNTO 0));
	  
	     END COMPONENT;
	  
	  SIGNAL Result_comp : std_logic_vector (3 downto 0);
	  
	  
	  Begin 
	  
	 I0_inst : g14_nums1s
	 PORT MAP( X => Result_comp, num1s => N);
	 
	 I1_inst : g14_comp6
	 PORT MAP( A(5 downto 3) => P1, A(2 downto 0) => P1 ,	
	           B(5 downto 3) => G1, B(2 downto 0) => G1 ,
				 AeqB => Result_comp(3) );
				 
	 
	 
	 I2_inst : g14_comp6
	 PORT MAP( A(5 downto 3) => P2 , A(2 downto 0) => P2  ,
	           B(5 downto 3) => G2 , B(2 downto 0) => G2 ,
	          AeqB => Result_comp(2) );
	 
	 I3_inst : g14_comp6
	 PORT MAP( A(5 downto 3) => P3,  A(2 downto 0) => P3 ,
	           B(5 downto 3) => G3, B(2 downto 0) => G3 ,
	          AeqB => Result_comp(1) );
	
	 I4_inst : g14_comp6
	 PORT MAP(  A(5 downto 3) => P4, A(2 downto 0) => P4 ,
	            B(5 downto 3) => P4 , B(2 downto 0) => G4 ,
	          AeqB => Result_comp(0) );
	 
	 
	 
	 
	 
	  
	  
end a;
