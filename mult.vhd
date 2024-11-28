library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mult is
port(
	a, b: in std_logic_vector(2 downto 0);
	x: out std_logic_vector(5 downto 0)
);
end mult;

architecture arch of mult is
signal temp1: std_logic_vector(2 downto 0);
signal temp2: std_logic_vector(3 downto 0);
signal temp3: std_logic_vector(4 downto 0);
begin
	temp1 <= a when b(0) = '1' else "000";
	temp2 <= (a&'0') when b(1) = '1' else "0000";
	temp3 <= (a&"00") when b(2) = '1' else "00000";
	X <= temp1 + temp2 + ('0'&temp3);
end arch;