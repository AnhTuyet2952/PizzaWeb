package Database;

import java.util.ArrayList;

public interface DAOInterface<T> {
	public ArrayList<T>selectAll();
	public T selectById(String id);
	public int insert(T t);
	public int insertAll(ArrayList<T>list);
	public int delete(T t);
	public int deleteAll(ArrayList<T>arr);
	public int update(T t);

}
