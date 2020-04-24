----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY MMealy IS
PORT (
	clk		: IN std_logic; -- clock (relogio)
	rst		: IN std_logic; -- reset
	entrada		: IN std_logic_vector (1 DOWNTO 0);
	saida		: OUT std_logic
);
END MMealy;
-----------------------------------------------

ARCHITECTURE rtl OF MMealy IS

type tipo_estados is (ZERO, UM, DOIS);

signal estado_atual, proximo_estado : tipo_estados;

BEGIN

-- Processo 1: registrador de estado
PROCESS(clk, rst)
BEGIN
	IF (rst = '1') THEN                     -- reset assincrono ativo em '1'
		estado_atual <= ZERO;            -- estado inicial PAR
	ELSIF (clk'EVENT AND clk = '1') THEN    -- na borda de subida do relogio
		estado_atual <= proximo_estado; -- estado atual eh atualizado com o proximo estado
	END IF;
END PROCESS;

-- Processo 2: logica de proximo estado
PROCESS(estado_atual, entrada)
BEGIN
-- a = 00
-- b = 01
-- c = 10
-- d = 11
   CASE estado_atual IS
      WHEN ZERO =>
         CASE entrada IS
            WHEN "00" 	=> proximo_estado <= UM;
				WHEN "01" 	=> proximo_estado <= ZERO;
				WHEN "10" 	=> proximo_estado <= ZERO;
            WHEN "11" 	=> proximo_estado <= ZERO;
         END CASE;
      WHEN UM =>
         CASE entrada IS
            WHEN "00" 	=> proximo_estado <= UM;
				WHEN "01" 	=> proximo_estado <= DOIS;
				WHEN "10" 	=> proximo_estado <= ZERO;
            WHEN "11" 	=> proximo_estado <= ZERO;
				END CASE;
	  WHEN DOIS =>
		 CASE entrada IS
			WHEN "00" 	=> proximo_estado <= UM;
			WHEN "01" 	=> proximo_estado <= ZERO;
			WHEN "10" 	=> proximo_estado <= ZERO;
         WHEN "11" 	=> proximo_estado <= ZERO;
       END CASE;
    END CASE;
END PROCESS;

-- Processo 3: logica de saida
PROCESS(estado_atual, proximo_estado, entrada)
BEGIN
   CASE estado_atual IS
      WHEN ZERO =>
          CASE entrada IS
             WHEN "00" 	=> saida <= '0';
             WHEN "01" => saida <= '0';
				 WHEN "10" 	=> saida <= '0';
             WHEN "11" => saida <= '0';
          END CASE;
      WHEN UM =>
          CASE entrada IS
             WHEN "00" 	=> saida <= '0';
             WHEN "01" => saida <= '0';
				 WHEN "10" 	=> saida <= '0';
             WHEN "11" => saida <= '0';
			END CASE;
	  WHEN DOIS =>
			CASE entrada IS
			 WHEN "00" 	=> saida <= '0';
             WHEN "01" => saida <= '0';
				 WHEN "10" 	=> saida <= '1';
             WHEN "11" => saida <= '0';
          END CASE;
    END CASE;
END PROCESS;
		
END rtl;
-----------------------------------------------
