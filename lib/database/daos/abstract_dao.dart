import 'package:floor/floor.dart';

abstract class AbstractDao<T> {
  @insert
  Future<int> insertItem(T item);

  @insert
  Future<List<int>> insertItems(List<T> items);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertOrReplace(T item);

  @update
  Future<int> updateItem(T item);

  @update
  Future<int> updateItems(List<T> items);

  @delete
  Future<int> deleteItem(T item);

  @delete
  Future<int> deleteItems(List<T> items);

}