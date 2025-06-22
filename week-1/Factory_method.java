package pack1;

public class Factory_method {
	 public static void main(String[] args) {
	        PatternFactory factory = new PatternFactory();

	        Pattern_Interface p1 = factory.getPattern("Dog");
	        p1.speak();  // Output: Dog says: Bark!

	        Pattern_Interface p2 = factory.getPattern("Cat");
	        p2.speak();  // Output: Cat says: Meow!
	    }

}
