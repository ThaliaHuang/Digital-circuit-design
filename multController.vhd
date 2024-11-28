library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity multController is
	port(
		clk, st, k, m: in bit;
		load, sh, ad, done: out bit
	);
end multController;

architecture a of multController is
signal state, nextstate: integer range 0 to 3;
begin
	process(st, k, m,state)
	begin
		load <= '0';
		sh <= '0';
		ad <= '0';
		done <= '0';
		case state is
			when 0 =>
				if st = '1' then
					load <= '1';
					nextstate <= 1;
				else nextstate <= 0;
				end if;
			when 1 =>
				if m = '1' then
					ad <= '1';
					nextstate <= 2;
				else
					sh <= '1';
					if k = '1' then nextstate <= 3;
					else nextstate <= 1;
					end if;
				end if;
			when 2 =>
				sh <= '1';
				if k = '1' then nextstate <= 3;
				else nextstate <= 1;
				end if;
			when 3 =>
				done <= '1';
				nextstate <= 0;
		end case;
	end process;
	process(clk)
	begin
		if clk = '1' and clk'event then
			state <= nextstate;
		end if;
	end process;
end a;