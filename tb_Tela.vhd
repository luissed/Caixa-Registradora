library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_Tela is
end tb_Tela;

architecture TB_ARCH of tb_Tela is
	signal tb_reset : std_logic := '0';
	signal tb_int_total : STD_LOGIC_VECTOR(19 downto 0) := "00000000000000000000";  -- Valor inicial de entrada
    
	signal tb_seg1_output : STD_LOGIC_VECTOR(6 downto 0);
	signal tb_seg2_output : STD_LOGIC_VECTOR(6 downto 0);
	signal tb_seg3_output : STD_LOGIC_VECTOR(6 downto 0);
	signal tb_seg4_output : STD_LOGIC_VECTOR(6 downto 0);
	signal tb_seg5_output : STD_LOGIC_VECTOR(6 downto 0);
	signal tb_seg6_output : STD_LOGIC_VECTOR(6 downto 0);

	component Tela
		Port ( 
			total   : in STD_LOGIC_VECTOR(19 downto 0);
			seg1_output : out STD_LOGIC_VECTOR(6 downto 0);
			seg2_output : out STD_LOGIC_VECTOR(6 downto 0);
			seg3_output : out STD_LOGIC_VECTOR(6 downto 0);
			seg4_output : out STD_LOGIC_VECTOR(6 downto 0);
			seg5_output : out STD_LOGIC_VECTOR(6 downto 0);
			seg6_output : out STD_LOGIC_VECTOR(6 downto 0)
		);
	end component;

begin
	UUT : Tela
	port map (
		total   => tb_int_total,
		seg1_output => tb_seg1_output,
		seg2_output => tb_seg2_output,
		seg3_output => tb_seg3_output,
		seg4_output => tb_seg4_output,
		seg5_output => tb_seg5_output,
		seg6_output => tb_seg6_output
	);

	TB_STIMULUS : process
	begin
		wait for 10 ns;  -- Espera inicial
		tb_reset <= '1';  -- Reset ativo em nível alto
		wait for 10 ns;
		tb_reset <= '0';

        -- Teste com valores de entrada
		tb_int_total <= "00000000000000000000";  -- Caso de teste 1: entrada = 0
		wait for 20 ns;

		tb_int_total <= "00000000000000000101";  -- Caso de teste 2: entrada = 5
		wait for 20 ns;

		tb_int_total <= "00000000000000011001";  -- Caso de teste 3: entrada = 25
		wait for 20 ns;

		tb_int_total <= "00000000000011101001";  -- Caso de teste 4: entrada = 233
		wait for 20 ns;

		tb_int_total <= "00000000001111100111";  -- Caso de teste 5: entrada = 999
		wait for 20 ns;
		  
		tb_int_total <= "11110100001000111111";  -- Caso de teste 5: entrada = 999999
		wait for 20 ns;

        -- Adicione mais casos de teste conforme necessário

		wait;
	end process;

end TB_ARCH;