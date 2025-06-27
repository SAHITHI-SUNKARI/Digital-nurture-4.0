import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;

public class MathOperationsTest {

    private MathOperations mathOps;

    @Before
    public void setUp() {
        System.out.println("Setting up MathOperations instance...");
        mathOps = new MathOperations();
    }

    @After
    public void tearDown() {
        System.out.println("Cleaning up after test...");
        mathOps = null;
    }

    @Test
    public void testAddition() {
        // Arrange: Done in setUp()

        // Act
        int result = mathOps.add(2, 3);

        // Assert
        assertEquals(5, result);
        System.out.println("testAddition passed");
    }

    @Test
    public void testSubtraction() {
        // Arrange: Done in setUp()

        // Act
        int result = mathOps.subtract(5, 3);

        // Assert
        assertEquals(2, result);
        System.out.println("testSubtraction passed");
    }
}

