import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorTest {

    @Test
    public void testAddition() {
        Calculator calc = new Calculator();
        int result = calc.add(2, 3);
        System.out.println("Inside testAddition(): Result is " + result);
        assertEquals(5, result);
    }
}



