library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CaixaRegistradora is
Port (
	-- Entradas
	clk, reset  : in  std_logic;
	add, sub    : in  std_logic := '1'; -- Sinal de controle para adição/subtração
	equal       : in  std_logic := '0'; -- Sinal de "="
	valor       : in  std_logic_vector(7 downto 0) := "00000000"; -- Valor da compra

	-- Saídas
	total       : out std_logic_vector(19 downto 0) := "00000000000000000000"
);
end CaixaRegistradora;

architecture Comportamental_CaixaRegistradora of CaixaRegistradora is
type StateType is (WaitState, AddState, SubState);
signal state : StateType := WaitState;
signal int_temp_total : integer := 0;
signal int_valor : integer := 0;
signal int_total : integer := 0;
signal temp_total : std_logic_vector(19 downto 0) := "00000000000000000000";

begin
process (clk, reset)
begin
if reset = '1' then
	int_temp_total <= 0;
	int_valor <= 0;
	int_total <= 0;
	temp_total <= "00000000000000000000";
	state <= WaitState;
	total <= temp_total;

  elsif rising_edge(clk) then
		case state is
		

			 when WaitState =>
				if (add = '0' and sub = '1' and reset = '0') then
					state <= AddState;
				elsif (add = '1' and sub = '0' and reset = '0') then
					state <= SubState;
				elsif (add = '1' and sub = '1' and reset = '0') then
					temp_total <= std_logic_vector(to_unsigned(int_temp_total, total'length));
					total <= temp_total;
					state <= WaitState;
				elsif (add = '0' and sub = '0' and reset = '0') then
					state <= WaitState;
				elsif reset = '1' then
					int_temp_total <= 0;
					int_valor <= 0;
					int_total <= 0;
					temp_total <= "00000000000000000000";
					state <= WaitState;
					total <= temp_total;
				end if;
				  
				  
				  
			 when AddState =>
				int_total <= to_integer(unsigned(temp_total));
				int_valor <= to_integer(unsigned(valor));
				int_temp_total <= int_valor + int_total;
				if (equal = '1' and reset = '0') then
					state <= WaitState;
				elsif (equal = '0' and reset = '0') then
					state <= AddState;
				elsif reset = '1' then
					int_temp_total <= 0;
					int_valor <= 0;
					int_total <= 0;
					temp_total <= "00000000000000000000";
					state <= WaitState;
					total <= temp_total;
				end if;

				
				
			 when SubState =>
				int_total <= to_integer(unsigned(temp_total));
				int_valor <= to_integer(unsigned(valor));
				if int_valor >= int_total then
					if (equal = '1' and reset = '0') then
						int_temp_total <= 0;
						int_valor <= 0;
						int_total <= 0;
						temp_total <= "00000000000000000000";
						state <= WaitState;
						total <= temp_total;
					elsif (equal = '0' and reset = '0') then
						state <= SubState;
					elsif reset = '1' then
						int_temp_total <= 0;
						int_valor <= 0;
						int_total <= 0;
						temp_total <= "00000000000000000000";
						state <= WaitState;
						total <= temp_total;
					end if;
				elsif int_valor < int_total then
					int_temp_total <= int_total - int_valor;
					if (equal = '1' and reset = '0') then
						state <= WaitState;
					elsif (equal = '0' and reset ='0') then
						state <= Substate;
					elsif reset = '1' then
						int_temp_total <= 0;
						int_valor <= 0;
						int_total <= 0;
						temp_total <= "00000000000000000000";
						state <= WaitState;
						total <= temp_total;
					end if;
				end if;
			 
			 

			 when others =>
				  state <= WaitState;
				  
				  
		end case;
  end if;
end process;
end Comportamental_CaixaRegistradora;
