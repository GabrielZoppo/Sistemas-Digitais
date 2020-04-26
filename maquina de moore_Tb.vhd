-------------------------------------
LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
------------------------------------
ENTITY MMoore_tb IS
END MMoore_tb;
----------------------------------
ARCHITECTURE testbench OF MMoore_tb IS 

	SIGNAL clk	: std_logic; -- clock (relogio)
	SIGNAL rst	: std_logic; -- reset
	SIGNAL entrada	: IN std_logic_vector (1 DOWNTO 0);
	SIGNAL saida	: std_logic;
	
	COMPONENT MMoore 
	PORT (
		clk	: IN std_logic; -- clock (relogio)
		rst	: IN std_logic; -- reset
		entrada	: IN std_logic_vector (1 DOWNTO 0);
		saida	: OUT std_logic
	);
	END COMPONENT;
		
BEGIN 
	
	i1: MMoore
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
		rst <= "01";
		wait for 20 ns;
		rst <= "00";
		wait;  
	END PROCESS;
				
	entrada1: PROCESS
	BEGIN 
		entrada <= "00";
		wait for 20 ns;
		entrada <= "01";
		wait for 20 ns;
		entrada <= "00";
		wait for 20 ns;
		entrada <= "00";
		wait for 20 ns;
		entrada <= "01";
		wait for 20 ns;
	END PROCESS;
END testbench;
