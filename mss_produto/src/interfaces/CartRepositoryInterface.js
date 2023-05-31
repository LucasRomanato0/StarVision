class ICartRepository {
  add({ id, qtd }) {
    throw new Error("Method 'add' must be implemented");
  }
}

module.exports = ICartRepository;
