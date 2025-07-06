# 🏠 Data Stream

This repository provides a clean, extendable, and production-ready implementation of an **Repository** pattern in Flutter. It features:

- ✅ Singleton architecture
- ✅ In-memory caching for API responses
- ✅ Functional error handling using `exception`
- ✅ Clean separation of concerns between request and response models
- ✅ Extensible structure for scaling your data layer
- ✅ Manual and automatic cache invalidation options

---

## 📦 Features

- **Singleton Instance**  
  Ensures a single, shared `DataRepository` instance throughout the app using a factory constructor and private internal constructor.

- **In-Memory Caching**  
  Reuses fetched API data without hitting the server again unless explicitly told to refresh.

- **Force Refresh Support**  
  Every API method includes an optional `forceRefresh` parameter to bypass the cache when needed.


---

👉 [Contribution Guide](CONTRIBUTING.md)

