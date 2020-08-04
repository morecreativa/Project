import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.sun.tools.javac.util.List;

public class BookSale {
    public static int nthLowestSelling(int[] sales, int n) {
        throw new UnsupportedOperationException("Waiting to be implemented.");
        Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        for(int x : sales){
            if(map.get(sales[x])==null) map.put(sales[x],1);
            else map.put(sales[x],map.get(sales[x])+1);
        }
        Iterator it=sortByValue(map).iterator();
        int temp=1;
        while(it.hasNext()){
            int temp=(int)it.next();
            if(temp==n) return map.get(temp);
            ++temp;
        }
        return -1;
    }
    
    public static List sortByValue(final Map map){
        List<String> list=new ArrayList();
        list.addAll(map.keySet());
        
        Collection.sort(list,new Compartor(){
            public int compare(Object o1,Object o2){
                Object v1=map.get(o1);
                Object v2=map.get(o2);
                
                return ((Comparable)v2).compareTo(v1);
            }
        });
        
        Collection.reverse(list);
        return list;
    }
    
    public static void main(String[] args) {
        int x = nthLowestSelling(new int[] { 5, 4, 3, 2, 1, 5, 4, 3, 2, 5, 4, 3, 5, 4, 5 }, 2);
        System.out.println(x);
    }
}