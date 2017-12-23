-------------------------------------------------------------------------------
--	FILE:			decimal_ascii_to_7seg.vhd
--
--	DESCRIPTION:	This design is used to convert decimal ascii values
-- 	ENGINEER:		Gurjit Singh
-------------------------------------------------------------------------------
-- Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity
entity decimal_ascii_to_7seg is
port(
	seg_out			: out std_logic_vector(6 downto 0);	-- 7 Seg display number output
	ascii_in		: in std_logic_vector(7 downto 0);	-- ASCII data input
	clk				: in std_logic);
end;

-- Architecture
architecture behavior of decimal_ascii_to_7seg is

-- Signals
signal output		: std_logic_vector(6 downto 0);

begin
	-- Assign output to seg_out (7 Segs are active low)
	seg_out <= not output;

	seg_proc : process(clk)
	begin
		if(rising_edge(clk)) then
			case ascii_in is
				when x"30" => output <= "0111111";	-- 0
				when x"??" => output <= "0000110";	-- 1
				when x"??" => output <= "1011011";	-- 2
				when x"??" => output <= "1001111";	-- 3
				when x"??" => output <= "1100110";	-- 4
				when x"??" => output <= "1101101";	-- 5
				when x"??" => output <= "1111101";	-- 6
				when x"??" => output <= "0000111";	-- 7
				when x"??" => output <= "1111111";	-- 8
				when x"??" => output <= "1101111";	-- 9
				when others =>						-- Others (Useful for simulation errors)
					seg_out <= (others => 'X');
			end case;
		end if;
	end process seg_proc;

end behavior;
