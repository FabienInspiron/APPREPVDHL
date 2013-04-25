library IEEE;
use IEEE.numeric_bit.all;

ARCHITECTURE adder_tb OF testbench IS

	COMPONENT half_adder IS
		PORT (	i1, i2: IN bit;
				s,c: 	OUT bit);
	END COMPONENT;
	
	SIGNAL  si1: bit;
	SIGNAL  si2: bit;
	
	SIGNAL 	Ss : bit;
	SIGNAL 	Sc : bit;
	
	FOR dut : half_adder USE ENTITY
		work.halfAdder(archi_half) PORT MAP 
		(A=>i1,B=>i2,S=>s,Cy=>c);

	BEGIN
	
		dut : half_adder
		PORT MAP(si1, si2, Ss, Sc);
	
	PROCESS
	BEGIN
		si1 <= '0';
		si2 <= '0';
			
		WAIT FOR 50 ns;
		ASSERT Ss = '0'	REPORT "Erreur1"	SEVERITY error;
		ASSERT Sc = '0'	REPORT "Erreur2"	SEVERITY error;
		
		si1 <= '1';
		si2 <= '0';
			
		WAIT FOR 50 ns;
		ASSERT Ss = '1'	REPORT "Erreur1"	SEVERITY error;
		ASSERT Sc = '0'	REPORT "Erreur2"	SEVERITY error;
		
		si1 <= '1';
		si2 <= '1';
			
		WAIT FOR 50 ns;
		ASSERT Ss = '0'	REPORT "Erreur1"	SEVERITY error;
		ASSERT Sc = '1'	REPORT "Erreur2"	SEVERITY error;
			
		WAIT;
	END PROCESS;
	
END adder_tb;