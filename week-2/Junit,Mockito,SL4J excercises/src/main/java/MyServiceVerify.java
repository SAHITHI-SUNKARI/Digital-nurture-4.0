public class MyServiceVerify {
    private ExternalApi api;

    public MyServiceVerify(ExternalApi api) {
        this.api = api;
    }

    public String fetchData() {
        return api.getData();
    }
}
