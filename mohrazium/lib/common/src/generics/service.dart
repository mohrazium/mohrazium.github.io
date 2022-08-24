part of common.generics;

abstract class Service<I, M> {
  Future<M?> save(M model);
  Future<M?> findById(I id);
  Future<List<M?>> findAll();
  Future<bool> update(M model);
  Future<bool> delete(M model);
}
