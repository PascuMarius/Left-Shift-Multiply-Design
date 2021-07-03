-----------------------------------------------------------------------------------------
-- Universitatea Transilvania din Brasov
-- Proiect     : Tehnici de proiectare VLSI
-- Autor       : Pascu Marius
-- Data        : 05.01.2021
-----------------------------------------------------------------------------------------
-- Descriere   : multiplicator. Acesta este modulul in care sunt instantiate cele doua componente 
-----------------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY Mult IS
PORT (
    clk       : IN  std_logic;
    reset     : IN  std_logic;
    op1       : IN  std_logic_vector(7 DOWNTO 0); 
    op2       : IN  std_logic_vector(7 DOWNTO 0); 
    start     : IN  std_logic;
    rezultat  : OUT std_logic_vector(15 DOWNTO 0);
    ready     : OUT  std_logic
);
END Mult;

ARCHITECTURE Mult OF Mult IS  
    COMPONENT date   
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
    END COMPONENT;  
 
    COMPONENT control  
        PORT ( 
            clk            : IN  std_logic;
            reset          : IN  std_logic;
            --FSM inputs
            start          : IN  std_logic;
            zero_op1       : IN  std_logic;
            --FSM outputs
            ld_op1         : OUT std_logic;
            ld_op2         : OUT std_logic;
            shift_op1      : OUT std_logic;
			shift_rezultat : OUT std_logic;
            clr_rezultat   : OUT std_logic;
            ld_rezultat    : OUT std_logic;
            ld_r           : OUT std_logic;
            ready          : OUT std_logic
        );     
     END COMPONENT;  

-- signals to connect date/control  
SIGNAL ld_op1, ld_op2, shift_op1, shift_rezultat, clr_rezultat, ld_rezultat, ld_r, zero_op1 : std_logic;   
 
BEGIN  
      
  i_date: date 
  PORT MAP( 
        clk            => clk, 
        reset          => reset, 
        op1            => op1,  
        op2            => op2,  
        ld_op1         => ld_op1,  
        ld_op2         => ld_op2,  
        shift_op1      => shift_op1,
		shift_rezultat => shift_rezultat,
        clr_rezultat   => clr_rezultat, 
        ld_rezultat    => ld_rezultat,  
        ld_r           => ld_r,  
        zero_op1       => zero_op1,
        rezultat       => rezultat
   ); 
   
  i_ctrl: control 
    PORT MAP( 
        clk            => clk, 
        reset          => reset, 
        start          => start,  
        zero_op1       => zero_op1,  
        ld_op1         => ld_op1,  
        ld_op2         => ld_op2,  
        shift_op1      => shift_op1,
		shift_rezultat => shift_rezultat,
        clr_rezultat   => clr_rezultat, 
        ld_rezultat    => ld_rezultat, 
        ld_r           => ld_r,
        ready          => ready
   ); 
   
 END Mult; 
 