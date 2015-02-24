package com.example.fib;

public class Fib {

	public int result;
	
	private int fib(int n) {
		int cur = 0, next = 1;
		for (int i = 0; i < n; ++i) {
			int tmp = cur;
			cur = next;
			next += tmp;
		}
		return cur;
	}

	public void run() {
		result = fib(42);
	}
	
	/*
	public static void main(String[] args) {
		Fib fib = new Fib();
		fib.run();
		System.out.println(fib.result);
	}
	*/
}
