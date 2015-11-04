--Rodrigo Mendoza
library ieee;
Use ieee.std_logic_1164.all;

entity g14_minimum3 is
   port(N,M  :in std_logic_vector(2 downto 0);
      min :out std_logic_vector(2 downto 0));
		
end g14_minimum3;

architecture behavior of g14_minimum3 is

signal i2,i1,i0,Sel: std_logic;

   begin

    i2 <= not (M(2) xor  N(2));
    i1 <= not (M(1) xor  N(1));
    
    
	 
	 Sel <= (M(2)and not(N(2))) or ( i2 and M(1) and not (N(1))) or (i2 and i1 and M(0) and not(N(0)));
	 
	 with  Sel select
	 
	 
	 min <= 
	         N when '1',
				M when others;
	 
	 
end behavior;


		