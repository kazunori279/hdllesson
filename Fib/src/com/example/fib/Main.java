package com.example.fib;
import synthesijer.rt.*;

@synthesijerhdl
public class Main{
	
  private final Fib fib = new Fib();

  @auto
  public int result(){
    return fib.result;
  }

  @auto
  public void main(){
    fib.run();
  }
  
}
