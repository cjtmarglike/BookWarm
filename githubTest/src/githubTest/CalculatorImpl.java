package githubTest;

public class CalculatorImpl implements Calculator {

	@Override
	public double add(double first, double second) {
		System.out.println("즐거운 덧셈공부");
		return first+second;
	}

	@Override
	public double div(double first, double second) {
		// TODO Auto-generated method stub
		
		return first/second;
	}

	@Override
	public double min(double first, double second) {
		//test
		return first-second;
	}

	@Override
	public double mul(double first, double second) {
		// TODO Auto-generated method stub
		
		return first * second;
	}

	@Override
	public double mod(double first, double second) {
		return first%second;
	}

}
