library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopLevel is
    Port (
        clk, reset : in  std_logic;
        add, sub : in  std_logic := '1';
		  equal : in  std_logic := '0';
        valor : in  std_logic_vector(7 downto 0) := "00000000";
        total : out std_logic_vector(19 downto 0) := "00000000000000000000";
        seg1_output, seg2_output, seg3_output, seg4_output, seg5_output, seg6_output : out std_logic_vector(7 downto 0)
    );
end TopLevel;

architecture Behavioral_TopLevel of TopLevel is
    signal caixa_total : std_logic_vector(19 downto 0) := "00000000000000000000";

    signal caixa_seg1_output, caixa_seg2_output, caixa_seg3_output, caixa_seg4_output, caixa_seg5_output, caixa_seg6_output : std_logic_vector(7 downto 0);

begin
    Caixa : entity work.CaixaRegistradora
        port map (
            clk => clk,
            reset => reset,
            add => add,
            sub => sub,
            equal => equal,
            valor => valor,
            total => caixa_total
        );

    Tela : entity work.Tela
        port map (
            total => caixa_total,
            seg1_output => caixa_seg1_output,
            seg2_output => caixa_seg2_output,
            seg3_output => caixa_seg3_output,
            seg4_output => caixa_seg4_output,
            seg5_output => caixa_seg5_output,
            seg6_output => caixa_seg6_output
        );

    -- Mapeia as saídas do componente CaixaRegistradora para as saídas do TopLevel
    seg1_output <= caixa_seg1_output;
    seg2_output <= caixa_seg2_output;
    seg3_output <= caixa_seg3_output;
    seg4_output <= caixa_seg4_output;
    seg5_output <= caixa_seg5_output;
    seg6_output <= caixa_seg6_output;
    total <= caixa_total;

end Behavioral_TopLevel;
