### Example of the Singleton Design Pattern

This example of the Singleton Design Pattern pattern was develop using Salesforce Apex language, but I've originally learned about this pattern in C#, so a few things changed, mainly the methods and syntax available.

For some components, it makes sense to have only one in the system, for example a database access object. We want to prevent multiple calls to the constructor and we want everyone to have the same instance. This can be solved using the Singleton Design Pattern, which makes the constructor private and forces users to use a static instance instead.

### Problems

The Singleton pattern's testability can be compromised due to its dependency on external systems like databases or files. This dependency means tests could fail inconsistently due to changes in these external systems, which are outside of the test's control. For instance, if a test expects specific data from a database, but the data changes during the test's execution, the test may fail. Similarly, if a test reads from or writes to a file and the file's content changes, the test could also fail. This inconsistency in testing results poses challenges in ensuring reliable and repeatable test outcomes.

### Singleton With Dependency Injection

The Singleton with Dependency Injection technique is a solution designed to address the constant connection to a live database when working with singleton patterns. Singleton patterns typically involve creating one instance of a class that is shared and used throughout an application, such as a connection to a database. However, this can lead to issues, such as when you want to run tests without affecting the live database.

By implementing Dependency Injection, we can inject a "dummy" or "mock" database class instead of connecting to the actual database. This allows for testing isolated from the real database, which can be beneficial for the integrity of the live data and the speed of testing, as it avoids the overhead of establishing a real database connection.

However, this approach may not make much sense when used with platforms like Salesforce. Salesforce tests do write to the database, but the platform always performs a rollback at the end of each test. This means that any changes made during the test are reversed, ensuring that the database remains in its original state after testing. This rollback feature reduces the necessity of using a dummy database class for testing in Salesforce.

### Monostate

The Monostate pattern is a unique approach to addressing the Singleton design pattern's limitations. Unlike the Singleton pattern, which restricts object instantiation by making the constructor private and providing a single global access point, the Monostate pattern allows developers to create as many instances of a class as they like. However, the catch is that all these instances share the same state.

This is achieved by making all the class properties static. In programming, a static property belongs to the class itself, not any specific object instance. Therefore, even though multiple objects may be created, they all share the same static properties. If you modify a static property in one instance, it affects all other instances.

Therefore, with the Monostate pattern, even though multiple object instances can be created, they all behave as if there is only one instance, because they share the same state. This allows the developers to maintain the illusion of a single instance, while avoiding some of the drawbacks associated with Singleton.

If you're interested in the [udemy course](https://www.udemy.com/course/design-patterns-csharp-dotnet) by [Dmitri Nesteruk](https://www.udemy.com/user/dmitrinesteruk/).
