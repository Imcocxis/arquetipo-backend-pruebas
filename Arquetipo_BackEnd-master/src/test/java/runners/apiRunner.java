package runners;

import com.intuit.karate.junit5.Karate;

public class apiRunner {
    @Karate.Test
    Karate testAll() {
        //Testear todas las features
        return Karate.run("classpath:features").relativeTo(getClass());
    }
}
