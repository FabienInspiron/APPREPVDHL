library IEEE;
use IEEE.numeric_bit.all;

ARCHITECTURE add_16_testbench OF testbench IS
-- décldéclare le composant à utiliser

COMPONENT comp_add_16_test IS
	PORT (	
			Tinput0 : IN unsigned ( 15 downto 0);
		  	Tinput1 : IN unsigned ( 15 downto 0);
		  	Tcarin  : IN bit; 
		  	Toutput : OUT unsigned ( 15 downto 0);
		  	Tcar    : OUT bit
		  );
END COMPONENT;

SIGNAL Sinput0 : unsigned  ( 15 downto 0);
SIGNAL Sinput1 : unsigned  ( 15 downto 0);
SIGNAL Scarin : bit;
SIGNAL Soutput : unsigned  ( 15 downto 0);
SIGNAL Scarout : bit;

FOR dut : comp_add_16_test USE ENTITY
	work.add_16(architecture_add16) PORT MAP
	(input0 => Tinput0, input1 => Tinput1, carin => Tcarin,output => Toutput, carout => Tcar);

BEGIN
	-- instanciation de composants
	dut : comp_add_16_test
	PORT MAP(Sinput0, Sinput1, Scarin, Soutput,Scarout);

PROCESS
	BEGIN
	Sinput0  <= "0000000000000001";
	Sinput1 <= "0000000000000000";
	Scarin  <= '0';
	WAIT FOR 50 ns;
	
	ASSERT Soutput = "0000000000000001" REPORT "Erreur1" SEVERITY error;
	ASSERT Scarout = '0' 				REPORT "Erreur2" SEVERITY error;
		
	Sinput0  <= "0000000000000001";
	Sinput1 <= "0000000000000000";
	Scarin  <= '1';
	WAIT FOR 50 ns;
	
	ASSERT Soutput = "0000000000000010" REPORT "Erreur3" SEVERITY error;
	ASSERT Scarout = '0' 				REPORT "Erreur4" SEVERITY error;
		
	Sinput0  <= "1111111111111111";
	Sinput1 <= "0000000000000000";
	Scarin  <= '1';
	WAIT FOR 50 ns;
	
	ASSERT Soutput = "0000000000000000" REPORT "Erreur5" SEVERITY error;
	ASSERT Scarout = '1' 				REPORT "Erreur6" SEVERITY error;	
		
	WAIT;
END PROCESS;

END add_16_testbench;