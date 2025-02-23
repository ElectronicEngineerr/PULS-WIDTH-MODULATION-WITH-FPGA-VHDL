

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_pwm_generator is
	generic (
				c_clkfreq : integer := 100_000_000;
				c_pwmfreq : integer := 1000
	);	
end tb_pwm_generator;

architecture Behavioral of tb_pwm_generator is


component pwm_generator is
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
end component;

constant clock_period 	: time := 10 ns;		

signal clk 				: std_logic 				   := '0';
signal duty_cycle_1 	: std_logic_vector(6 downto 0) := (others => '0');
signal duty_cycle_2 	: std_logic_vector(6 downto 0) := (others => '0');
signal duty_cycle_3 	: std_logic_vector(6 downto 0) := (others => '0');
signal pwm_out1		 	: std_logic;
signal pwm_out2      	: std_logic;
signal pwm_out3      	: std_logic;
 

begin

DUT : pwm_generator
		generic map(
						c_clkfreq 		=> c_clkfreq,
						c_pwmfreq 		=> c_pwmfreq
		)
		port    map(
						clk       		=> clk,
						duty_cycle_1	=> duty_cycle_1,
						duty_cycle_2	=> duty_cycle_2,
						duty_cycle_3	=> duty_cycle_3,
						pwm_out1  		=> pwm_out1,
						pwm_out2 		=> pwm_out2,
						pwm_out3  		=> pwm_out3
		);


CLOCK_GENERATOR : process
	begin
				clk <= '0';
				wait for clock_period/2;
				clk <= '1';
				wait for clock_period/2;			
end process CLOCK_GENERATOR;

P_MAIN : process
	begin
	
				

end process P_MAIN;

					duty_cycle_1 <= "1000000";
					duty_cycle_2 <= "0100000";
					duty_cycle_3 <= "0010000";
					
end Behavioral;
