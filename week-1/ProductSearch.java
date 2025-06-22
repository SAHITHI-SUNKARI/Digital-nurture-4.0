package pack1;
import java.util.*;

public class ProductSearch {
    public static List<String> searchProducts(String[] products, String query) {
        List<String> result = new ArrayList<>();
        for (String product : products) {
            if (product.toLowerCase().contains(query.toLowerCase())) {
                result.add(product);
            }
        }
        return result;
    }

    public static void main(String[] args) {
        String[] products = {"Laptop", "Smartphone", "Smartwatch", "Charger"};
        String query = "smart";
        List<String> results = searchProducts(products, query);
        System.out.println("Search Results: " + results);
    }
}

