library ieee;
use ieee.std_logic_1164.all;

entity adder8bit is
	port(
		A,B: in std_logic_vector(7 downto 0);
		carry_in: in std_logic;
		output: out std_logic_vector(7 downto 0);
		carry_out: out std_logic
	);
end adder8bit;

architecture arch of adder8bit is
	signal G: std_logic_vector(7 downto 0);
	signal P: std_logic_vector(7 downto 0);
	
	begin
		G <= A and B;
		P <= A or B;
		
		process(G,P)
			begin
				output(0) <= A(0) xor B(0) xor carry_in;
				output(1) <= (A(1) xor B(1)) xor (G(0) or (P(0) and carry_in));
				output(2) <= (A(2) xor B(2)) xor (G(1) or (P(1) and G(0)) or (P(1) and P(0) and carry_in));
				output(3) <= (A(3) xor B(3)) xor (G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and carry_in));
				output(4) <= (A(4) xor B(4)) xor (G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0)) or (P(3) and P(2) and P(1) and P(0) and carry_in));
				output(5) <= (A(5) xor B(5)) xor (G(4) or (P(4) and G(3)) or (P(4) and p(3) and G(2)) or (P(4) and P(3) and P(2) and G(1)) or (P(4) and P(3) and P(2) and P(1) and G(0)) or (P(4) and P(3) and P(2) and P(1) and P(0) and carry_in));
				output(6) <= (A(6) xor B(6)) xor (G(5) or (P(5) and G(4)) or (P(5) and P(4) and G(3)) or (P(5) and P(4) and P(3) and G(2)) or (P(5) and P(4) and P(3) and P(2) and G(1)) or (P(5) and P(4) and P(3) and P(2) and P(1) and G(0)) or (P(5) and P(4) and P(3) and P(2) and P(1) and P(0) and carry_in));
				output(7) <= (A(7) xor B(7)) xor (G(6) or (P(6) and G(5)) or (P(6) and P(5) and G(4)) or (P(6) and P(5) and P(4) and G(3)) or (P(6) and P(5) and P(4) and P(3) and G(2)) or (P(6) and P(5) and P(4) and P(3) and P(2) and G(1)) or (P(6) and P(5) and P(4) and P(3) and P(2) and P(1) and G(0)) or (P(6) and P(5) and P(4) and P(3) and P(2) and P(1) and P(0) and carry_in));
				carry_out <= G(7) or (P(7) and G(6)) or (P(7) and P(6) and G(5)) or (P(7) and P(6) and P(5) and G(4)) or (P(7) and P(6) and P(5) and P(4) and G(3)) or (P(7) and P(6) and P(5) and P(4) and P(3) and G(2)) or (P(7) and P(6) and P(5) and P(4) and P(3) and P(2) and G(1)) or (P(7) and P(6) and P(5) and P(4) and P(3) and P(2) and P(1) and G(0)) or (P(7) and P(6) and P(5) and P(4) and P(3) and P(2) and P(1) and P(0) and carry_in);
		end process;		
end arch;