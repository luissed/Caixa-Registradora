library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_TopLevel is
end tb_TopLevel;

architecture testbench of tb_TopLevel is
    signal clk, reset : std_logic;
	 signal add, sub : std_logic := '1';
	 signal equal : std_logic := '0';
    signal valor : std_logic_vector(7 downto 0) := "00000000";
    signal total : std_logic_vector(19 downto 0) := "00000000000000000000";
	 signal seg1_output, seg2_output, seg3_output, seg4_output, seg5_output, seg6_output : std_logic_vector(7 downto 0);

    constant clock_period : time := 20 ns; -- Ajuste conforme necessário

    signal stop_simulation : boolean := false;

begin

    -- Instância do componente
    uut : entity work.TopLevel
        port map (
            clk => clk,
            reset => reset,
            add => add,
            sub => sub,
            equal => equal,
            valor => valor,
            total => total,
            seg1_output => seg1_output,
            seg2_output => seg2_output,
            seg3_output => seg3_output,
            seg4_output => seg4_output,
            seg5_output => seg5_output,
            seg6_output => seg6_output
        );

    -- Processo para gerar o clock
    process
    begin
        clk <= '0';
        wait for clock_period / 2;
        clk <= '1';
        wait for clock_period / 2;
    end process;

    -- Processo para aplicar estímulos
    process
    begin
        reset <= '1';
        wait for clock_period * 2;
        reset <= '0';
        wait for clock_period * 2;

        -- Exemplo: Inserir o valor 255 na CaixaRegistradora
        valor <= "11111111";
        wait for clock_period * 2;

        -- Exemplo: Pressionar o botão add
        add <= '0';
        wait for clock_period * 2;

        -- Exemplo: Liberar o botão add
        add <= '1';
        wait for clock_period * 2;

        -- Exemplo: Pressionar o botão de igual
        equal <= '1';
        wait for clock_period * 2;
        equal <= '0';
        wait for clock_period * 2;
        -- Adicionar mais estímulos conforme necessário

        -- Parar a simulação após um tempo
        wait for 100 ns;
        stop_simulation <= true;

    end process;

    -- Processo para verificar as saídas
    process
    begin
        wait until stop_simulation = true;

        -- Exemplo: Verificar as saídas após algum tempo
        assert total = "00000000000011111111" 
            report "Teste falhou: total não obteve o valor esperado '00000000000000011111'" 
            severity error;

        assert seg1_output = "00010010" 
            report "Test failed: seg1_output does not match expected value '0010010'" 
            severity error;

        assert seg2_output = "00010010" 
            report "Test failed: seg2_output does not match expected value '0010010'" 
            severity error;

        assert seg3_output = "00100100" 
            report "Test failed: seg3_output does not match expected value '0110000'" 
            severity error;

        -- Adicionar mais verificações conforme necessário

        -- Exibir mensagem de sucesso se todos os testes passarem
        report "Testbench realizado com sucesso!" severity note;
        wait;
    end process;

end testbench;
