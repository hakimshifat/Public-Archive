
### Complimentary Metal Oxide Semiconductor


### Operation Characteristics of logic circuits

Dc Supply Voltage
- TTL +5V
- CMOS -> +5V, 3.3V, 2.5V, 1.8V
### Input and Output logic for CMOS

V<sub>IL</sub> -> Low Input -> Max voltage -> 0
V<sub>IH</sub> -> High Input -> Min Voltage -> 1


V<sub>OL</sub> -> Low Output -> Max Voltage -> 0
V<sub>OH</sub> -> High Output -> Min Voltage -> 1

### Noise Immunity

Ability of a logic circuit to tolerate a certain amount of unwanted voltage fluctuation on its inputs without changing its state.

### Noise Margin
A Measure of a circuits noise immunity

- V<sub>NH</sub>(HIGH-level) Noise Margin = V<sub>OH</sub> - V<sub>IH</sub> 
- V<sub>NL</sub>(LOW-level) Noise Margin =  V<sub>IL</sub>- V<sub>OL</sub> 

### Power Dissipation
A logic gate draws power from dc source.
When a gate is in *HIGH* state, an amount of current *I<sub>CCH</sub>*  is Drawn.
When a gate is in *LOW* state, an amount of current *I<sub>CCL</sub>*  is Drawn.

Given that,
			I<sub>CCH</sub> = 1.5 mA
			 V<sub>CC</sub> = 5V
		Power Dissipation = I<sub>CCH</sub> x V<sub>CC</sub>
						= 1.5 x g
						= 7.5 mW
When Gate is Pulsed -> Output switches back and forth between *HIGH* and *LOW*

IF *duty cycle* is 50% and the output is HIGH half time and LOW the other half time, The Average Current Supply Icc = (Icch + Iccl) / 2
Then, Power dissipation = Icc x Vcc

### Propagation Delay Time
- When a signal is passed via a logic gate, it experiences a time delay
- The change in output level always occurs a short time later than the change in input level
- t<sub>PHL</sub> -> Delay when changing from HIGH to Low
- t<sub>PLH</sub> -> Delay when changing from LOW to HIGH

### Speed Power Product
SPP = Propagation delay x Power dissipation

### Loading and Fan-Out

Output of one gate is connected to multiple gates as input
![](../attachments/Pasted%20image%2020250518015009.png)
A Load is created on the *Driving Gate* -> Loading
There is a limit to the number of load can be connected to the driving gate. This limit is called *fan-out* of the gate.

### MOSFET
![](../attachments/Pasted%20image%2020250518091631.png)

n-channel MOSFET -> Gate > Source -> Saturation -> Less Resistance ->
				Gate-Source Volatage = 0 -> Cutoff -> Maximum Resistance ->


![](../attachments/Pasted%20image%2020250518091959.png)

n-channel (Drain e always 5V)

G -> +5V -> Saturation -> Less Resistance -> Closed Circuit
G -> 0V -> Cutoff ->  Resistance -> Open Circuit


![](../attachments/Pasted%20image%2020250518092142.png)
p-channel(Source e always 5V dite hbe)


G -> 0V -> Saturation -> Less Resistance -> Closed Circuit
G -> 5V -> Cutoff ->  Resistance -> Open Circuit

