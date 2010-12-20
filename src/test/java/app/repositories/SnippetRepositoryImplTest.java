package app.repositories;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.junit.Test;

import app.models.Snippet;

public class SnippetRepositoryImplTest {

    @Test public void fakeTest() {
  		assertNotNull("put something real.", new SnippetRepositoryImpl(null));
  	}
    
    @Test
    public void testFindbyTag() {
        System.out.println("findbyTag");
        String tag = "a";
        EntityManager e = null;
        SnippetRepository instance = new SnippetRepositoryImpl(e);
        List expResult = new ArrayList<Snippet>();
        expResult = instance.findbyTag(tag);
        //List result = new ArrayList<Snippet>();
        //result.add(instance.findbyTag(tag));
        //assertEquals(expResult, result);
    }
}

