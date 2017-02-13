package com.neomandi.prototype;

public class CachedObject implements Cacheable 
{
	 private java.util.Date dateofExpiration = null;
     private Object identifier = null;	    
	 public Object object = null;
	
	@SuppressWarnings("static-access")
	public CachedObject(Object obj, Object id, int minutesToLive)
    {
      this.object = obj;
      this.identifier = id;
      // minutesToLive of 0 means it lives on indefinitely.
      if (minutesToLive != 0)
      {
        dateofExpiration = new java.util.Date();
        java.util.Calendar cal = java.util.Calendar.getInstance();
        cal.setTime(dateofExpiration);
        cal.add(cal.MINUTE, minutesToLive);
        dateofExpiration = cal.getTime();
      }
    }
    // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    public boolean isExpired()
    {
        // Remember if the minutes to live is zero then it lives forever!
        if (dateofExpiration != null)
        {
          // date of expiration is compared.
          if (dateofExpiration.before(new java.util.Date()))
          {
            System.out.println("CachedResultSet.isExpired:  Expired from Cache! EXPIRE TIME: " + dateofExpiration.toString() + " CURRENT TIME: " +
(new java.util.Date()).toString());
            return true;
          }
          else
          {
            System.out.println("CachedResultSet.isExpired:  Expired not from Cache!");
            return false;
          }
        }
        else // This means it lives forever!
          return false;
    }

    public Object getIdentifier()
    {
      return identifier;
    }
}
 class CacheManager {
	  /* This is the HashMap that contains all objects in the cache. */
	  @SuppressWarnings("rawtypes")
	private static java.util.HashMap cacheHashMap = new java.util.HashMap();
	    static
	    {
	        try
	        {
	            /* Create background thread, which will be responsible for
	purging expired items. */
	            Thread threadCleanerUpper = new Thread(
	            new Runnable()
	            {
	              /*  The default time the thread should sleep between scans.
	                  The sleep method takes in a millisecond value so 5000 = 5
	Seconds.
	              */
	              int milliSecondSleepTime = 5000;
	              @SuppressWarnings("rawtypes")
				public void run()
	              {
	                try
	                {
	                  /* Sets up an infinite loop.  The thread will continue
	looping forever. */
	                  while (true)
	                  {
	                    java.util.Set keySet = cacheHashMap.keySet();
	                    java.util.Iterator keys = keySet.iterator();
	                    while(keys.hasNext())
	                    {
	                      Object key = keys.next();
	                      Cacheable value = (Cacheable)cacheHashMap.get(key);
	                      if (value.isExpired())
	                      {
	                        cacheHashMap.remove(key);
	                        System.out.println("ThreadCleanerUpper Running.	Found an Expired Object in the Cache.");
	                      }
	                    }
	                    Thread.sleep(this.milliSecondSleepTime);
	                  }
	                }
	                catch (Exception e)
	                {
	                    e.printStackTrace();
	                }
	                return;
	              } 
	            }); 
	            threadCleanerUpper.setPriority(Thread.MIN_PRIORITY);
	            threadCleanerUpper.start();
	        }
	        catch(Exception e)
	        {
	              System.out.println("CacheManager.Static Block: " + e);
	        }}
	    
	  public CacheManager()
	  {
	  }
	  @SuppressWarnings("unchecked")
	public static void putCache(Cacheable object)
	  {
	    // Remember if the HashMap previously contains a mapping for the key,	the old value
	    // will be replaced.  This is valid functioning.
	    cacheHashMap.put(object.getIdentifier(), object);
	  }
	  public static Cacheable getCache(Object identifier)
	  {
	    //synchronized (lock)  // UNCOMMENT LINE XXX
	    //{                    // UNCOMMENT LINE XXX
	      Cacheable object = (Cacheable)cacheHashMap.get(identifier);
	    // The code to create the object would be placed here.
	    //}                    // UNCOMMENT LINE XXX
	    if (object == null)
	      return null;
	    if (object.isExpired())
	    {
	      cacheHashMap.remove(identifier);
	      return null;
	    }
	    else
	    {
	      return object;
	    }
	  }
	}
