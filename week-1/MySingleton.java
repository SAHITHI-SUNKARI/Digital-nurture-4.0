package pack1;

public class MySingleton {
	
	    private static MySingleton instance;

	    private MySingleton() {
	        System.out.println("Singleton instance created.");
	    }
	 public static MySingleton getInstance() {
	        if (instance == null) {
	            instance = new MySingleton();
	        }
	        return instance;
	    }

	    public void showMessage() {
	        System.out.println("Hello from Singleton!");
	    }

	 public static void main(String[] args) {
	     MySingleton obj1 = MySingleton.getInstance();
	     obj1.showMessage();

	     MySingleton obj2 = MySingleton.getInstance();

	     System.out.println("Are both objects the same? " + (obj1 == obj2));  // true
	 }
	 }


