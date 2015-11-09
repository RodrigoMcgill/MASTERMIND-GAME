--RODRIGO MENDOZA

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;

entity g14_possibility_table is
port(   TC_EN 	   : in std_logic; -- table counter enable
		  TC_RST	: in std_logic; -- table counter reset
		  TM_IN		: in std_logic; -- table memory input data
		  TM_EN		: in std_logic; -- table memory write enable
		  CLK		: in std_logic;
		  TC_LAST	: out std_logic; -- last count flag
		  TM_ADDR	: out std_logic_vector(11 downto 0);
		  TM_OUT	: out std_logic); -- table memory output
end g14_possibility_table;

Architecture imp of g14_possibility_table is



SIGNAL count   : std_logic_vector (11 downto 0);
SIGNAL TC_LAST_flag : std_logic;
SIGNAL TM_OUT_flag: std_logic;
begin


process (CLK, TC_RST, TC_EN)

begin	
  if (rising_edge(CLK)) then
			if ( TC_RST = '1' ) then       -- when RESET is high then output 000000000000
				count <="000000000000";
		
	
	elsif(TC_RST ='0' and TC_EN = '1')	then
	
			if (count = std_logic_vector(to_unsigned(2925,12))) then    --when the counter arrives at max value reset
	          
				 count<=  "000000000000"   ;	 
			    
			elsif (count(8 downto 6) = "101" and  count(5 downto 3) = "101" and count(2 downto 0) = "101"  ) then -- add 147
			       count <= count + 147;
				
			elsif (count(5 downto 3) = "101" and count(2 downto 0) = "101"  ) then   -- add 19
			       count <= count+ 19;
				
			elsif (count(2 downto 0) = "101"  ) then         -- add 3
			       count <= count  + 3;
			
	       else 
			     
		        count <= count + 1;
	               
											
					end if;
       end if;
 end if;
	
end process;



process(count)       -- this check whether the last value has been attained. If yes, then TC_LAST goes hight for that clock cycle
	 begin
			if( count = "101101101101" ) then     
			TC_LAST_flag <= '1';
	
			else
			TC_LAST_flag <= '0';	

	
			end if;
	end process;
	
process (TM_EN,TM_IN)        -- process describing the write '1' and '0' and the resultant TM_OUT

 begin
         
			   if(TM_EN ='1' and TM_IN = '1') then   
			   TM_OUT_flag <= '0' ;
				
				elsif( TM_EN = '0' and TM_IN = '1') then
				TM_OUT_flag <= '1';
				
				elsif( TM_EN = '1'and TM_IN = '0') then
				TM_OUT_flag <= '0';
				
				elsif (TM_EN = '0' and TM_IN = '0') then
				TM_OUT_flag <= '0';
			  
			 
	 end if;
	
   end process;

	TM_ADDR <= count ;
        TC_LAST <= TC_LAST_flag;
	TM_OUT  <= TM_OUT_flag;
end imp;