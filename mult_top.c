#include <genlib.h>  
  
main()  
{  
int i;  
  
   GENLIB_DEF_LOFIG("mult_top");  
  
   GENLIB_LOCON("vdd",           IN,        "vdd");    
   GENLIB_LOCON("vss",           IN,        "vss");    
   GENLIB_LOCON("vdde",          IN,       "vdde");   
   GENLIB_LOCON("vsse",          IN,       "vsse");   
   GENLIB_LOCON("op1[7:0]",        IN,     "op1[7:0]");    
   GENLIB_LOCON("op2[7:0]",        IN,     "op2[7:0]");    
   GENLIB_LOCON("reset",         IN,      "reset");    
   GENLIB_LOCON("start",         IN,      "start");    
   GENLIB_LOCON("clk",            IN,         "clk");    
   GENLIB_LOCON("ready",        OUT,      "ready");    
   GENLIB_LOCON("rezultat[15:0]",    OUT,  "rezultat[15:0]");    
     
                              
   GENLIB_LOINS ("pvsse_sp", "p36", "clki", "vdde", "vdd", "vsse", "vss", 0);  
   GENLIB_LOINS ("pvdde_sp", "p37", "clki", "vdde", "vdd", "vsse", "vss", 0);  
   GENLIB_LOINS ("pvddeck_sp", "p38", "clock", "clki", "vdde", "vdd", "vsse", "vss",0); 
   GENLIB_LOINS ("pvssi_sp", "p39", "clki", "vdde", "vdd", "vsse", "vss", 0);  
   GENLIB_LOINS ("pvddi_sp", "p40", "clki", "vdde", "vdd", "vsse", "vss", 0);  
  
   for (i = 0; i < 8; i++)  
    GENLIB_LOINS("pi_sp", GENLIB_NAME("p%d", i),   
          GENLIB_NAME("op1[%d]", i), GENLIB_NAME("op1op1[%d]", i),   
         "clki", "vdde", "vdd", "vsse", "vss", 0);  
  
   for (i = 0; i < 8; i++)  
    GENLIB_LOINS("pi_sp", GENLIB_NAME("p%d", i + 8),   
          GENLIB_NAME("op2[%d]", i), GENLIB_NAME("op2op2[%d]", i),   
         "clki", "vdde", "vdd", "vsse", "vss", 0);  
  
   for (i = 0; i < 16; i++)  
    GENLIB_LOINS("po_sp", GENLIB_NAME("p%d", i + 16),   
          GENLIB_NAME("rezultatrezultat[%d]", i), GENLIB_NAME("rezultat[%d]", i),  
         "clki", "vdde", "vdd", "vsse", "vss", 0);  
  
  
   GENLIB_LOINS("pi_sp", "p32",  
         "start", "startstart",  
         "clki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("pi_sp", "p33",  
         "reset", "resetreset",  
         "clki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("pck_sp", "p34",  
         "clk",  
         "clki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("po_sp", "p35",  
         "readyready", "ready",  
         "clki", "vdde", "vdd", "vsse", "vss", 0);  
     
   GENLIB_LOINS("mult", "mult",  
   	     "clock", "resetreset",
  	     "op1op1[7:0]", "op2op2[7:0]", 
         "startstart",
   	     "rezultatrezultat[15:0]",
         "readyready", 
         "vdd", "vss", 0);  
  
   GENLIB_SAVE_LOFIG();  
   exit(0);   
}  
