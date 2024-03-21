library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity tb_CaixaRegistradora is
end tb_CaixaRegistradora;

architecture Behavioral of tb_CaixaRegistradora is
    signal clk, reset : std_logic  := '0';
	 signal add, sub : std_logic := '1';
	 signal equal : std_logic := '0';
    signal valor : std_logic_vector(7 downto 0) := "00000000";
    signal total : std_logic_vector(19 downto 0) := "00000000000000000000";

    constant Clock_Period : time := 20 ns; -- Período do clock (ajuste conforme necessário)

    component CaixaRegistradora
        Port (
            -- Entradas
            clk, reset  : in  std_logic;
            add, sub    : in  std_logic := '1'; -- Sinal de controle para adição/subtração
            equal       : in  std_logic := '0'; -- Sinal de "="
            valor       : in  std_logic_vector(7 downto 0) := "00000000"; -- Valor da compra

            -- Saídas
            total       : out std_logic_vector(19 downto 0) := "00000000000000000000"
        );
    end component;

begin
    -- Instanciando o módulo CaixaRegistradora
    UUT : CaixaRegistradora
        port map (clk => clk, reset => reset, add => add, sub => sub, equal => equal, valor => valor, total => total);

    -- Processo de clock
    process
    begin
        clk <= '0';
        wait for Clock_Period/2; -- Metade do período
        clk <= '1';
        wait for Clock_Period/2; -- Metade do período
    end process;

    -- Estímulos
    stim_proc: process
    begin
        reset <= '1';
        wait for 2*Clock_Period;
        reset <= '0';
        wait for 2*Clock_Period;

        -- Adicionando valor
        valor <= "00000111"; -- 7
        wait for 2*Clock_Period;
        add <= '0';
        wait for 2*Clock_Period;
        add <= '1';
        wait for 2*Clock_Period;
        equal <= '1';
        wait for 2*Clock_Period;
        equal <= '0';
        wait for 7*Clock_Period;

        -- Subtraindo valor
        valor <= "00000010"; -- 2
        wait for 2*Clock_Period;
        sub <= '0';
        wait for 2*Clock_Period;
        sub <= '1';
        wait for 2*Clock_Period;
        equal <= '1';
        wait for 2*Clock_Period;
        equal <= '0';
        wait for 9*Clock_Period;

        -- Adicionando mais valor
        valor <= "00001000"; -- 8
        wait for 2*Clock_Period;
        add <= '0';
        wait for 2*Clock_Period;
        add <= '1';
        wait for 2*Clock_Period;
        equal <= '1';
        wait for 2*Clock_Period;
        equal <= '0';
        wait for 4*Clock_Period;
		  
        valor <= "00001111"; -- 15
        wait for 2*Clock_Period;
        sub <= '0';
        wait for 2*Clock_Period;
        sub <= '1';
        wait for 2*Clock_Period;
        equal <= '1';
        wait for 2*Clock_Period;
        equal <= '0';
        wait for 2*Clock_Period;

        -- Adicione mais estímulos conforme necessário

        wait;
    end process stim_proc;

end Behavioral;
