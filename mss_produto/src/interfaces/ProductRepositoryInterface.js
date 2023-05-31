class IProductRepository {
  store(product) {
    throw new Error("Method 'store' must be implemented");
  }

  getById(id) {
    throw new Error("Method 'getById' must be implemented");
  }

  getAll() {
    throw new Error("Method 'getAll' must be implemented");
  }

  update(product) {
    throw new Error("Method 'update' must be implemented");
  }

  delete(id) {
    throw new Error("Method 'delete' must be implemented");
  }
}

module.exports = IProductRepository;
