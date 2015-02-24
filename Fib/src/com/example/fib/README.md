# Fib

Fibonacci implementation for FPGA with [Synthesijer](http://synthesijer.sourceforge.net/). It can calculate fib(42) with 191 cycles (3.8us with 50MHz clock).

- Top.v: top level Verilog HDL. Calls Main.v and shows the result to LED
- Main.v/Main.java: Calls Fib.v
- Fib.v/Fib.java: Calculates fib(42)
