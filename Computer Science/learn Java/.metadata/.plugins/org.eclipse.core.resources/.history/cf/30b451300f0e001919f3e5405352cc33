package hiLow;
import java.util.Scanner;
public class HilLo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// Create a number for user to guess
		Scanner scan = new Scanner(System.in);
		int theNumber = (int)(Math.random()*100 +1);
		// System.out.println( theNumber );
		int guess = 0;
		while(guess != theNumber) {
			System.out.println("Guess a number between 1 and 100:");
			guess = scan.nextInt();
			if (guess < theNumber)
				System.out.println(guess + " is too low. Try again.");
			else if (guess > theNumber)
				System.out.println(guess + " is too high. Try again.");
			else
				System.out.println(guess + " is correct. You win!");
			//System.out.println( "You entered " + guess + "." );
		} // end of while loop
		
	}

}
