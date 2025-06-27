import org.junit.Test;
import static org.junit.Assert.*;

public class AssertionsTest {

    @Test
    public void testAssertions() {

        // Assert equals
        System.out.println("Asserting that 2 + 3 equals 5");
        assertEquals(5, 2 + 3);

        // Assert true
        System.out.println("Asserting that 5 > 3 is true");
        assertTrue(5 > 3);

        // Assert false
        System.out.println("Asserting that 5 < 3 is false");
        assertFalse(5 < 3);

        // Assert null
        System.out.println("Asserting that null is null");
        assertNull(null);

        // Assert not null
        System.out.println("Asserting that new Object() is not null");
        assertNotNull(new Object());

        System.out.println("All assertions passed successfully.");
    }
}
