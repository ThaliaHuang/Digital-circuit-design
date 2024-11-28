library ieee;
use ieee.std_logic_1164.all;

entity bin2dec is port (
	dip : in std_logic_vector(3 downto 0);
	seg : out std_logic_vector(6 downto 0));
end bin2dec;

architecture arch of bin2dec is
	begin
	process(dip)
		begin
			case dip is
				when "0000" => seg <= "1000000";
				when "0001" => seg <= "1111001";
				when "0010" => seg <= "0100100";
				when "0011" => seg <= "0110000";
				when "0100" => seg <= "0011001";
				when "0101" => seg <= "0010010";
				when "0110" => seg <= "0000001";
				when "0111" => seg <= "1011000";
				when "1000" => seg <= "0000000";
				when others => seg <= "0010000";
			end case;
	end process;
end arch;