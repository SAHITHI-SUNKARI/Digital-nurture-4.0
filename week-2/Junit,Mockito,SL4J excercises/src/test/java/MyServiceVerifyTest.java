import static org.mockito.Mockito.*;
import org.junit.Test;
import org.mockito.Mockito;

public class MyServiceVerifyTest {

    @Test
    public void testVerifyInteraction() {
        // Arrange - Create mock
        ExternalApi mockApi = Mockito.mock(ExternalApi.class);

        // Act - Inject mock and call method
        MyService service = new MyService(mockApi);
        service.fetchData();

        // Assert/Verify - Ensure getData() was called
        verify(mockApi).getData();

        System.out.println("Verified that getData() was called.");
    }
}
