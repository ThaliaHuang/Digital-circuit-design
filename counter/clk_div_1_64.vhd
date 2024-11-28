library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity clk_div_1_64 is port(
	clk_in : in std_logic;
	clk_out: out std_logic);
end clk_div_1_64;

architecture a of clk_div_1_64 is
	signal cnt : std_logic_vector(20 downto 0);
	signal reset: std_logic; --reset
	begin
	process(clk_in)
		begin
			if reset='1' then
				cnt<="000000000000000000000";
			elsif clk_in'event and clk_in='1' then
				cnt<=cnt+1;
			end if;
	end process;
	reset<='1' when cnt=25000000 else '0';
	clk_out<=cnt(20);
end a;