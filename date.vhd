-----------------------------------------------------------------------------------------
-- Universitatea Transilvania din Brasov
-- Proiect     : Tehnici de proiectare VLSI
-- Autor       : Pascu Marius
-- Data        : 05.01.2021
-----------------------------------------------------------------------------------------
-- Descriere   : date. Acesta este modulul care descrie comportamental calea de date
-----------------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;
use ieee.numeric_std.all;


ENTITY date IS
PORT ( 
    clk            : IN  std_logic;
    reset          : IN  std_logic;
    op1            : IN  std_logic_vector(7 DOWNTO 0); 
    op2            : IN  std_logic_vector(7 DOWNTO 0); 
    ld_op1         : IN  std_logic;
    ld_op2         : IN  std_logic;
    shift_op1      : IN  std_logic;
	shift_rezultat : IN  std_logic;
    clr_rezultat   : IN  std_logic;
    ld_rezultat    : IN  std_logic;
    ld_r           : IN  std_logic;
    zero_op1       : OUT std_logic;
    rezultat       : OUT std_logic_vector(15 DOWNTO 0)
);
END date;

ARCHITECTURE date OF date IS
  SIGNAL reg_op1     : std_logic_vector(7 DOWNTO 0);
  SIGNAL reg_op2     : std_logic_vector(7 DOWNTO 0);
  SIGNAL reg_rezultat: std_logic_vector(15 DOWNTO 0);
  SIGNAL reg_r       : std_logic_vector(15 DOWNTO 0);
  SIGNAL reg_cont    : std_logic_vector(3 DOWNTO 0);
BEGIN



--reg op1
PROCESS(clk)
  BEGIN
    IF (clk'EVENT AND clk = '1') THEN
      IF (reset = '1') THEN 
        reg_op1 <= (others => '0');
      ELSIF (ld_op1 = '1') THEN
        reg_op1 <= op1;
		reg_cont <= (others => '0');
	  ELSIF (shift_op1 = '1') THEN
        reg_op1 <= reg_op1( 6 downto 0 ) & '0';
		reg_cont <= reg_cont + '1';
      END IF;
    END IF;    
END PROCESS;

zero_op1 <= '1' WHEN reg_cont = "1000" else '0';

--reg op2
PROCESS(clk)
  BEGIN
    IF (clk'EVENT AND clk = '1') THEN
      IF (reset = '1') THEN 
        reg_op2 <= (others => '0');
      ELSIF (ld_op2 = '1') THEN
        reg_op2 <= op2;
      END IF;
    END IF;    
END PROCESS;

--reg rezultat
PROCESS(clk)
  BEGIN
    IF (clk'EVENT AND clk = '1') THEN
      IF (reset = '1') THEN 
        reg_rezultat <= (others => '0');
      ELSIF (clr_rezultat = '1') THEN
        reg_rezultat <= (others => '0');
	ELSIF (shift_rezultat = '1') THEN
		reg_rezultat <= reg_rezultat( 14 downto 0 ) & '0';
	  END IF;	
      IF (ld_rezultat = '1' AND reg_op1(7) = '1') THEN
        reg_rezultat <= reg_rezultat +  ("0000" & reg_op2) ;
      END IF;
    END IF;    
END PROCESS;

--reg R
PROCESS(clk)
  BEGIN
    IF (clk'EVENT AND clk = '1') THEN
      IF (reset = '1') THEN 
        reg_r <= (others => '0');
      ELSIF (ld_r = '1') THEN
        reg_r <= reg_rezultat;
      END IF;
    END IF;    
END PROCESS;
rezultat <= reg_r;

END date;