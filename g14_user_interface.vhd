--Rodrigo
library ieee;
use ieee.std_logic_1164.all;

entity g14_user_interface is
port( DONE_USER                  : in std_logic;
      position 						: in std_logic_vector(1 downto 0);
		Three_color_Assig				: in std_logic_vector(2 downto 0);  --uses 3 altera switches
		TC_EN, USER, USER_RST, CLK	: in std_logic;
		EXACT_PAT, USER_GUESS_PATT	: out std_logic_vector(11 downto 0);
		LEDDisplay4, LEDDisplay3, LEDDIsplay2, LEDDIsplay1: out std_logic_vector(6 downto 0));

end g14_user_interface;

architecture behavior of g14_user_interface is

		SIGNAL random_Number_Pat_Gen : std_logic_vector(11 downto 0);
		SIGNAL p1, p2, p3, p4 : std_logic_vector(2 downto 0);
		SIGNAL Code4,Code3,Code2,Code1: std_logic_vector (3 downto 0);
		SIGNAL DC4, DC3,DC2,DC1 :std_logic;

		component g14_random_num_gen is
		port(	CLK, TC_EN	: in std_logic;
				numb			: out std_logic_vector(11 downto 0));
		end component;
		
		--for visualization and debugging purposes
		component g14_7_segment_decoder is
      port( code           : in std_logic_vector(3 downto 0);
				RippleBlank_In : in std_logic;
				RippleBlank_Out: out std_logic;
				segments       : out std_logic_vector(6 downto 0));
      end component;
		




BEGIN


			gen : g14_random_num_gen port map(CLK=>CLK, TC_EN=> TC_EN, numb => random_Number_Pat_Gen);
			
			EXACT_PAT <= random_Number_Pat_Gen; 

			process (CLK,USER_RST,DONE_USER)
			begin
						if(rising_edge(CLK)) then
								if(USER_RST = '1') then
										if(position = "00" AND DONE_USER ='0') then       --assign p1  1st LED
										p1<=Three_color_Assig;
										elsif(position = "01" AND DONE_USER ='0') then   --assign p2  2nd LED
										p2<=Three_color_Assig;
										elsif(position ="10" AND DONE_USER ='0')then    --assign p3   3rd LED
										p3<=Three_color_Assig; 
										elsif(position = "11" AND DONE_USER ='0')then   --assign p4   4th LED
										p4<=Three_color_Assig;
								elsif(USER_RST = '0' AND DONE_USER ='1') then
								       p1<= "000";
										 p2<="000";
										 p3<="000";
										 p4<="000";
										end if;
								end if;
						end if;
		end process;
		
		 
		 USER_GUESS_PATT <= p4&p3&p2&p1;
		
				
				
		-- for debugging purposes
		Code4 <= '0'&p4;
		Code3 <= '0'&p3;
		Code2 <= '0'&p2;
		Code1 <= '0'&p1;
		 
		 LED4seg7Led: g14_7_segment_decoder
		 PORT MAP(code=> Code4	,RippleBlank_In=> '0', RippleBlank_Out=> DC4 ,segments=> LEDDisplay4  );
		 
		 LED3seg7Led: g14_7_segment_decoder
		 PORT MAP(code=> Code3	,RippleBlank_In=> '0', RippleBlank_Out=> DC3 ,segments=> LEDDisplay3 );
		 
		 LED2seg7Led: g14_7_segment_decoder
		 PORT MAP(code=> Code2	,RippleBlank_In=> '0', RippleBlank_Out=> DC2 ,segments=> LEDDIsplay2 );
		 
		 LED1seg7Led: g14_7_segment_decoder
		 PORT MAP(code=> Code1 	,RippleBlank_In=> '0', RippleBlank_Out=> DC1 ,segments=> LEDDIsplay1 );
		
				
		 
end behavior;