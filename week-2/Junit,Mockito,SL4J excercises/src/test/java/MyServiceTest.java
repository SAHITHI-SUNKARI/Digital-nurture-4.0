import static org.mockito.Mockito.*;
import static org.junit.Assert.*;
import org.junit.Test;
import org.mockito.Mockito;

public class MyServiceTest {

    @Test
    public void testFetchDataWithMockApi() {
        // Arrange - Mock the ExternalApi
        ExternalApi mockApi = Mockito.mock(ExternalApi.class);

        // Stub getData() method
        when(mockApi.getData()).thenReturn("Mock Data");

        // Act - Inject mock and call method
        MyService service = new MyService(mockApi);
        String result = service.fetchData();

        // Assert
        assertEquals("Mock Data", result);
        System.out.println("Mocked API returned: " + result);
    }
}
