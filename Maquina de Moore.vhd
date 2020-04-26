-----------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY MMoore IS
	PORT (clk, rst: IN std_logic;
				entrada: IN std_logic_vector (1 DOWNTO 0);
               saida: OUT std_logic
	);
END MMoore;
-----------------------------------------------

ARCHITECTURE arquitetura OF MMoore IS

TYPE estado IS (zero, um, dois, tres);
SIGNAL estado_atual, proximo_estado: estado;

BEGIN
	----- Registrador de estado ---------------
	PROCESS (rst, clk)
	BEGIN
		IF (rst='1') THEN
			estado_atual <= zero;
		ELSIF (clk'EVENT AND clk='1') THEN
			estado_atual <= proximo_estado;
		END IF;
	END PROCESS;

	-- Logica de proximo estado e saida --------
	PROCESS (entrada, estado_atual)
	BEGIN
		CASE estado_atual IS
			WHEN zero =>
				saida <= '0';
				IF (entrada ="00") THEN proximo_estado <= um;
				ELSE proximo_estado <= zero;
				END IF;
			WHEN um =>
				saida <= '0';
				IF (entrada ="01") THEN proximo_estado <= dois;
				ELSE IF (entrada = "00") THEN proximo_estado <= um;
				ELSE proximo_estado <= zero;
				END IF;
				END IF;

			WHEN dois =>
				saida <= '0';
				IF (entrada ="10") THEN proximo_estado <= tres;
				ELSE IF (entrada = "00") THEN proximo_estado <= um;
				ELSE proximo_estado <= zero;
				END IF;
				END IF;
			WHEN tres =>
				saida <= '1';
				IF (entrada ="00") THEN proximo_estado <= um;
				ELSE proximo_estado <= zero;
				END IF;
		END CASE;
	END PROCESS;
END arquitetura;
--------------------------------------------
