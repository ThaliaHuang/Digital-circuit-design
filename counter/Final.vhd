library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Final is port (
	clk: in std_logic;
	reset: in bit;
	hit: in bit;
	led: out std_logic_vector(11 downto 0);
	seg: out std_logic_vector(6 downto 0));
end Final;

architecture a of Final is
	component clk_div_1_64 port(
		clk_in : in std_logic;
		clk_out: out std_logic);
	end component;
	component bin2dec port (
		dip : in std_logic_vector(3 downto 0);
		seg : out std_logic_vector(6 downto 0));
	end component;
	
	signal clk_1hz: std_logic;
	signal tempo: std_logic_vector(29 downto 0);
	signal seg_num: std_logic_vector(3 downto 0);
	
	begin
	C: clk_div_1_64 port map(clk, clk_1hz);
	B: bin2dec port map(seg_num, seg);
		process(clk)
			begin
			if(reset = '1') then
					tempo <= "101001110101000101000000000000";
					seg_num <= "0000";
			elsif(clk'event and clk = '1') then
				tempo <= '0' & tempo(29 downto 1);
				if(hit = '0' and tempo(0) = '1') then
					seg_num <= seg_num + 1;
				end if;
				led <= tempo(11 downto 0);
			end if;
		end process;
end a;