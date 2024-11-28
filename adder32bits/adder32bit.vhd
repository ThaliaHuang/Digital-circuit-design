library ieee;
use ieee.std_logic_1164.all;

entity adder32bit is
	port(
		X: in std_logic_vector(31 downto 0);
		Y: in std_logic_vector(31 downto 0);
		cin: in std_logic;
		sum: out std_logic_vector(31 downto 0);
		cout: out std_logic
	);
end adder32bit;

architecture arch of adder32bit is
	component adder8bit
		port(
			A: in std_logic_vector(7 downto 0);
			B: in std_logic_vector(7 downto 0);
			carry_in: in std_logic;
			output: out std_logic_vector(7 downto 0);
			carry_out: out std_logic
		);
	end component;
	
	signal c: std_logic_vector(2 downto 0);
	
	begin
	U1: adder8bit port map(X(7 downto 0), Y(7 downto 0), cin, sum(7 downto 0), c(0));
	U2: adder8bit port map(X(15 downto 8), Y(15 downto 8), c(0), sum(15 downto 8), c(1));
	U3: adder8bit port map(X(23 downto 16), Y(23 downto 16), c(1), sum(23 downto 16),c(2));
	U4: adder8bit port map(X(31 downto 24), Y(31 downto 24), c(2), sum(31 downto 24), cout);
end arch;