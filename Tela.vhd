library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity Tela is
	Port ( 
		total   : in STD_LOGIC_VECTOR(19 downto 0);
		seg1_output : out STD_LOGIC_VECTOR(7 downto 0);
		seg2_output : out STD_LOGIC_VECTOR(7 downto 0);
		seg3_output : out STD_LOGIC_VECTOR(7 downto 0);
		seg4_output : out STD_LOGIC_VECTOR(7 downto 0);
		seg5_output : out STD_LOGIC_VECTOR(7 downto 0);
		seg6_output : out STD_LOGIC_VECTOR(7 downto 0)
	);
end Tela;

architecture Behavioral of Tela is
	
begin
	 
	process(total)
		variable int_total : integer;
		variable dig1, dig2, dig3, dig4, dig5, dig6 : std_logic_vector(3 downto 0);
    
	begin
		int_total := to_integer(unsigned(total));
		  
		dig1(3 downto 0) := std_logic_vector(to_unsigned(int_total mod 10, 4));
		int_total := int_total / 10;
		dig2(3 downto 0) := std_logic_vector(to_unsigned(int_total mod 10, 4));
		int_total := int_total / 10;
		dig3(3 downto 0) := std_logic_vector(to_unsigned(int_total mod 10, 4));
		int_total := int_total / 10;
		dig4(3 downto 0) := std_logic_vector(to_unsigned(int_total mod 10, 4));
		int_total := int_total / 10;
		dig5(3 downto 0) := std_logic_vector(to_unsigned(int_total mod 10, 4));
		int_total := int_total / 10;
		dig6(3 downto 0) := std_logic_vector(to_unsigned(int_total mod 10, 4));
		  
		case to_integer(unsigned(dig1)) is
			when 0 =>
				seg1_output <= "11000000"; -- 0
			when 1 =>
				seg1_output <= "11111001"; -- 1
			when 2 =>
				seg1_output <= "10100100"; -- 2
			when 3 =>
				seg1_output <= "10110000"; -- 3
			when 4 =>
				seg1_output <= "10011001"; -- 4
			when 5 =>
				seg1_output <= "10010010"; -- 5
			when 6 =>
				seg1_output <= "10000010"; -- 6
			when 7 =>
				seg1_output <= "11111000"; -- 7
			when 8 =>
				seg1_output <= "10000000"; -- 8
			when others =>
				seg1_output <= "10010000"; -- 9
		end case;
		  
		case to_integer(unsigned(dig2)) is
			when 0 =>
				seg2_output <= "11000000"; -- 0
			when 1 =>
				seg2_output <= "11111001"; -- 1
			when 2 =>
				seg2_output <= "10100100"; -- 2
			when 3 =>
				seg2_output <= "10110000"; -- 3
			when 4 =>
				seg2_output <= "10011001"; -- 4
			when 5 =>
				seg2_output <= "10010010"; -- 5
			when 6 =>
				seg2_output <= "10000010"; -- 6
			when 7 =>
				seg2_output <= "11111000"; -- 7
			when 8 =>
				seg2_output <= "10000000"; -- 8
			when others =>
				seg2_output <= "10010000"; -- 9
		end case;
		  
		case to_integer(unsigned(dig3)) is
			when 0 =>
				seg3_output <= "11000000"; -- 0
			when 1 =>
				seg3_output <= "11111001"; -- 1
			when 2 =>
				seg3_output <= "10100100"; -- 2
			when 3 =>
				seg3_output <= "10110000"; -- 3
			when 4 =>
				seg3_output <= "10011001"; -- 4
			when 5 =>
				seg3_output <= "10010010"; -- 5
			when 6 =>
				seg3_output <= "10000010"; -- 6
			when 7 =>
				seg3_output <= "11111000"; -- 7
			when 8 =>
				seg3_output <= "10000000"; -- 8
			when others =>
				seg3_output <= "10010000"; -- 9
		end case;
		  
		case to_integer(unsigned(dig4)) is
			when 0 =>
				seg4_output <= "11000000"; -- 0
			when 1 =>
				seg4_output <= "11111001"; -- 1
			when 2 =>
				seg4_output <= "10100100"; -- 2
			when 3 =>
				seg4_output <= "10110000"; -- 3
			when 4 =>
				seg4_output <= "10011001"; -- 4
			when 5 =>
				seg4_output <= "10010010"; -- 5
			when 6 =>
				seg4_output <= "10000010"; -- 6
			when 7 =>
				seg4_output <= "11111000"; -- 7
			when 8 =>
				seg4_output <= "10000000"; -- 8
			when others =>
				seg4_output <= "10010000"; -- 9
		end case;
		  
		case to_integer(unsigned(dig5)) is
			when 0 =>
				seg5_output <= "11000000"; -- 0
			when 1 =>
				seg5_output <= "11111001"; -- 1
			when 2 =>
				seg5_output <= "10100100"; -- 2
			when 3 =>
				seg5_output <= "10110000"; -- 3
			when 4 =>
				seg5_output <= "10011001"; -- 4
			when 5 =>
				seg5_output <= "10010010"; -- 5
			when 6 =>
				seg5_output <= "10000010"; -- 6
			when 7 =>
				seg5_output <= "11111000"; -- 7
			when 8 =>
				seg5_output <= "10000000"; -- 8
			when others =>
				seg5_output <= "10010000"; -- 9
		end case;
		  
		case to_integer(unsigned(dig6)) is
			when 0 =>
				seg6_output <= "11000000"; -- 0
			when 1 =>
				seg6_output <= "11111001"; -- 1
			when 2 =>
				seg6_output <= "10100100"; -- 2
			when 3 =>
				seg6_output <= "10110000"; -- 3
			when 4 =>
				seg6_output <= "10011001"; -- 4
			when 5 =>
				seg6_output <= "10010010"; -- 5
			when 6 =>
				seg6_output <= "10000010"; -- 6
			when 7 =>
				seg6_output <= "11111000"; -- 7
			when 8 =>
				seg6_output <= "10000000"; -- 8
			when others =>
				seg6_output <= "10010000"; -- 9
		end case;
		  
	end process;

end Behavioral;
