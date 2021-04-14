package com.rodgers.calcengine;
// calc engine will be used to perform a variety of mathematical operations
public class Main {

    public static void main(String[] args) {
    	// value1 and value2 will be the two values used to perform a operation
    	double[] leftVals = {100.0d, 25.0d, 225.0d, 11.0d};
    	double[] rightVals = {50.0d, 92.0d, 17.0d, 3.0d};
    	char[] opCodes = {'d', 'a', 'm', 'd'};
    	double[] results = new double[opCodes.length];

		for (int i = 0; i < opCodes.length; i++) {
			switch (opCodes[i]) {
				case 'a':
					results[i] = leftVals[i] + rightVals[i];
					break;
				case 's':
					results[i] = leftVals[i] - rightVals[i];
					break;
				case 'm':
					results[i] = leftVals[i] * rightVals[i];
					break;
				case 'd':
					results[i] = leftVals[i] != 0 ? leftVals[i] / rightVals[i] : 0.0d;
					break;
				default:
					System.out.println("Inavlid opCode: " + opCodes);
					results[i] = 0.0d;
					break;
			}
		}
		for (double currentResult : results)
    	System.out.println(currentResult);

    }
}
