--@author:Rodrigo Mendoza
-- December 4th, 2015
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity g14_7_segment_decoder is
port(code : in std_logic_vector(3 downto 0);
		RippleBlank_In : in std_logic;
		RippleBlank_Out : out std_logic;
		segments : out std_logic_vector(6 downto 0));
end g14_7_segment_decoder;

architecture imp of g14_7_segment_decoder is
signal y : std_logic_vector(7 downto 0);
signal x : std_logic_vector(4 downto 0);
begin

RippleBlank_Out <= y(7);
segments <= y(6 downto 0);
x <= RippleBlank_In & code;

with x select

-- for the right most decoder or decoders that have a RippleBlank_In signal of 0

		y	<= 		"01000000" when "00000",--0
						"01111001" when "00001",--1
						"00100100" when "00010",--2
						"00110000" when "00011",--3
						"00011001" when "00100",--4
						"00010010" when "00101",--5
						"00000010" when "00110",--6
						"01111000" when "00111",--7
						"00000000" when "01000",--8
						"00011000" when "01001",--9
						"00000011" when "01010",--b
						"00101111" when "01011",--r
						"00101011" when "01100",--n
						"01100001" when "01101",--j
						"01000001" when "01110",--u
						"01000110" when "01111",--c
						
-- for the left most decoder or decoders that have a RippleBlank_In signal of 1
			
						"11111111" when "10000",--leading 0
						"01111001" when "10001",--1
						"00100100" when "10010",--2
						"00110000" when "10011",--3
						"00011001" when "10100",--4
						"00010010" when "10101",--5
						"00000010" when "10110",--6
						"01111000" when "10111",--7
						"00000000" when "11000",--8
						"00011000" when "11001",--9
						"00000011" when "11010",--b
						"00101111" when "11011",--r
						"00101011" when "11100",--n
						"01100001" when "11101",--j
						"01000001" when "11110",--u
						"01000110" when "11111",--c
						
--for any other type of signal
				
						"11111111" when others;
end imp;


