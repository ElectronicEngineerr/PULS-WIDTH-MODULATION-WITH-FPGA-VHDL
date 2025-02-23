
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity pwm_generator is
	generic (
				c_clkfreq : integer := 100_000_000;
				c_pwmfreq : integer := 1000
	);		
	port    (
				clk 			: in std_logic;
				duty_cycle_1 	: in std_logic_vector(6 downto 0);
				duty_cycle_2 	: in std_logic_vector(6 downto 0);
				duty_cycle_3 	: in std_logic_vector(6 downto 0);

				pwm_out1 		: out std_logic;
				pwm_out2 		: out std_logic;
				pwm_out3 		: out std_logic


	);
end pwm_generator;


architecture Behavioral of pwm_generator is

-- constant declerations
constant c_timerlim : integer := c_clkfreq/c_pwmfreq;

-- signal declerations 

signal   high_time1  : integer range 0 to c_timerlim := c_timerlim/2; -- %50 pwm
signal   high_time2  : integer range 0 to c_timerlim := c_timerlim/2; -- %50 pwm
signal   high_time3  : integer range 0 to c_timerlim := c_timerlim/2; -- %50 pwm
signal   timer1      : integer range 0 to c_timerlim := 0;
signal   timer2      : integer range 0 to c_timerlim := 0;
signal   timer3      : integer range 0 to c_timerlim := 0;


begin

	high_time1 <= (c_timerlim/100)*to_integer(unsigned(duty_cycle_1));
	high_time2 <= (c_timerlim/100)*to_integer(unsigned(duty_cycle_2));
	high_time3 <= (c_timerlim/100)*to_integer(unsigned(duty_cycle_3));

process (clk)
	begin	
			if(rising_edge(clk)) then				
					if (timer1 = c_timerlim - 1) then					
							timer1 <= 0;
								
 					elsif (timer1 < high_time1) then
							pwm_out1 <= '1';	
							timer1 <= timer1 + 1;
					else
							pwm_out1 <= '0';
							timer1 <= timer1 + 1;
					end if;			
			end if;
end process;

process (clk)
	begin	
			if(rising_edge(clk)) then				
					if (timer2 = c_timerlim - 1) then					
							timer2 <= 0;
								
 					elsif (timer2 < high_time2) then
							pwm_out2 <= '1';	
							timer2 <= timer2 + 1;
					else
							pwm_out2 <= '0';
							timer2 <= timer2 + 1;
					end if;			
			end if;
end process;


process (clk)
	begin	
			if(rising_edge(clk)) then				
					if (timer3 = c_timerlim - 1) then					
							timer3 <= 0;
								
 					elsif (timer3 < high_time3) then
							pwm_out3 <= '1';	
							timer3 <= timer3 + 1;
					else
							pwm_out3 <= '0';
							timer3 <= timer3 + 1;
					end if;			
			end if;
end process;

end Behavioral;
