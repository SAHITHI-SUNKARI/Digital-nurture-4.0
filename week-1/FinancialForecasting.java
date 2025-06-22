package pack1;
import java.util.*;

		public class FinancialForecasting {
		    public static double predictNextMonthRevenue(List<Double> revenues) {
		        double sum = 0;
		        for (double rev : revenues) {
		            sum += rev;
		        }
		        return sum / revenues.size(); // Simple average-based forecast
		    }

		    public static void main(String[] args) {
		        List<Double> revenues = Arrays.asList(10000.0, 12000.0, 11000.0, 13000.0);
		        double forecast = predictNextMonthRevenue(revenues);
		        System.out.println("Predicted next month revenue: " + forecast);
		    }
		}

