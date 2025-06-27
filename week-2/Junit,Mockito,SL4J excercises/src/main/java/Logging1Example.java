import org.slf4j.Logger; 
import org.slf4j.LoggerFactory; 
 
public class Logging1Example { 
    private static final Logger logger = LoggerFactory.getLogger(Logging1Example.class); 
 
    public static void main(String[] args) { 
        logger.error("This is an error message"); 
        logger.warn("This is a warning message"); 
    } 
} 
