-------------------------------------
LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
------------------------------------
ENTITY detector_de_string_abc_tb IS
END detector_de_string_abc_tb;
----------------------------------
ARCHITECTURE testbench OF detector_de_string_abc_tb IS 

	SIGNAL clk	: std_logic; -- clock (relogio)
	SIGNAL rst	: std_logic; -- reset
	SIGNAL entrada	: IN td_logic_vector (1 DOWNTO 0);
	SIGNAL saida	: std_logic;
	
	COMPONENT detector_de_string_abc 
	PORT (
		clk	: IN std_logic; -- clock (relogio)
		rst	: IN std_logic; -- reset
		entrada	: IN td_logic_vector (1 DOWNTO 0);
		saida	: OUT std_logic
	);
	END COMPONENT;
		
BEGIN 
	
	i1: detector_de_string_abc
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
		entrada <= '0';
		wait for 20 ns;
		entrada <= '1';
		wait for 20 ns;
		entrada <= '0';
		wait for 20 ns;
		entrada <= '0';
		wait for 20 ns;
		entrada <= '1';
		wait for 20 ns;
	END PROCESS;
END testbench;
