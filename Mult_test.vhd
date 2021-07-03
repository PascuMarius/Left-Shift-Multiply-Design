-----------------------------------------------------------------------------------------
-- Universitatea Transilvania din Brasov
-- Proiect     : Tehnici de proiectare VLSI
-- Autor       : Pascu Marius
-- Data        : 05.01.2021
-----------------------------------------------------------------------------------------
-- Descriere   : TEST. Acesta este modulul care genereaza semnalele pentru testarea multiplicatorului
-----------------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY Mult_test IS
GENERIC (per : time := 20 ns);
END Mult_test;

ARCHITECTURE Mult_test OF Mult_test IS
COMPONENT Mult
  PORT ( 
    clk       : IN  std_logic;
    reset     : IN  std_logic;
    op1       : IN  std_logic_vector(7 DOWNTO 0); 
    op2       : IN  std_logic_vector(7 DOWNTO 0); 
    start     : IN  std_logic;
    rezultat  : OUT std_logic_vector(15 DOWNTO 0);
    ready     : OUT  std_logic
  );
END COMPONENT;

  SIGNAL clk      : std_logic := '1';
  SIGNAL reset    : std_logic;
  SIGNAL start    : std_logic;

  SIGNAL op1      : std_logic_vector(7 DOWNTO 0);
  SIGNAL op2      : std_logic_vector(7 DOWNTO 0);

  SIGNAL rezultat : std_logic_vector(15 DOWNTO 0);
  SIGNAL ready    : std_logic;

  
BEGIN
  clk   <= NOT clk AFTER per/2;
  reset <= '1', '0' AFTER 2*per;
  start <= '0', '1' AFTER 5*per, '0' AFTER 6*per, '1' AFTER 25*per, '0' AFTER 26*per;
  op1   <= "00000011", "01001001" AFTER 15*per;
  op2   <= "00000010", "00000010" AFTER 15*per;

  dut: Mult
  PORT MAP( 
        clk         => clk, 
        reset       => reset, 
        op1         => op1,  
        op2         => op2,  
        start       => start,
        rezultat    => rezultat,     
        ready       => ready
   ); 
    
END Mult_test;