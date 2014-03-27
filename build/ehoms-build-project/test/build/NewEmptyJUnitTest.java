/*
 * NewEmptyJUnitTest.java
 * JUnit based test
 *
 * Created on September 12, 2013, 9:32 AM
 */

package build;

import com.rameses.util.Encoder;
import junit.framework.*;

/**
 *
 * @author arnel
 */
public class NewEmptyJUnitTest extends TestCase {
    
    public NewEmptyJUnitTest(String testName) {
        super(testName);
    }

    protected void setUp() throws Exception {
    }

    protected void tearDown() throws Exception {
    }
    
  
    public void testHello() {
        System.out.println(Encoder.MD5.encode("Etr@cs07", "sa"));
    }   

}
