-------------------------------------
LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
------------------------------------
ENTITY MMealy_tb IS
END MMealy_tb;
----------------------------------
ARCHITECTURE testbench OF MMealy_tb IS 

	SIGNAL clk	: std_logic; -- clock (relogio)
	SIGNAL rst	: std_logic; -- reset
	SIGNAL entrada	: std_logic_vector (1 DOWNTO 0);
	SIGNAL saida	: std_logic;
	
	COMPONENT MMealy 
	PORT (
		clk	: IN std_logic; -- clock (relogio)
		rst	: IN std_logic; -- reset
		entrada	: IN std_logic_vector (1 DOWNTO 0);
		saida	: OUT std_logic
	);
	END COMPONENT;
		
BEGIN 
	
	i1: MMealy 
	PORT MAP (
		clk => clk,
		rst => rst,
		entrada => entrada,
		saida => saida
	);
		
	clock: PROCESS
	BEGIN 
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
	END PROCESS;
				
	reset: PROCESS
	BEGIN
		rst <= '1';
		wait for 20 ns;
		rst <= '0';
		wait;  
	END PROCESS;
				
	entrada1: PROCESS
	BEGIN 
		entrada <= "00";
		wait for 20 ns;
		entrada <= "01";
		wait for 20 ns;
		entrada <= "10";
		wait for 20 ns;

		entrada <= "01";
		wait for 20 ns;
		entrada <= "10";
		wait for 20 ns;
		entrada <= "10";
		wait for 20 ns;

		entrada <= "01";
		wait for 20 ns;
        entrada <= "11";
        wait for 20 ns;
        entrada <= "10";
		wait for 20 ns;

        entrada <= "10";
		wait for 20 ns;
        entrada <= "11";
		wait for 20 ns;
        entrada <= "00";
		wait for 20 ns;
	END PROCESS;
END testbench;
