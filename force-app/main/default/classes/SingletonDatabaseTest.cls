@IsTest
public class SingletonDatabaseTest {
	@IsTest
	static void isSingletonTest() {
		SingletonDatabase db1 = SingletonDatabase.instance;
		SingletonDatabase db2 = SingletonDatabase.instance;

		Assert.areEqual(db1, db2, 'These are no equal instances.');
		Assert.areEqual(
			1,
			SingletonDatabase.count,
			'Did not create only one instance.'
		);
	}

	@IsTest
	static void singletonTotalPopulationTest() {
		Assert.areEqual(
			33200000 + 17400000,
			new SingletonRecordFinder()
				.getTotalPopulation(new List<String>{ 'Tokyo', 'Mexico City' }),
			'Total number of population is not correct.'
		);
	}

	@IsTest
	static void singletonDependencyInjectionTest() {
		Assert.areEqual(
			20000,
			new ConfigurableRecordFinder(new DummyDatabase())
				.getTotalPopulation(new List<String>{ 'Tokyo', 'Mexico City' }),
			'Total number of population is not correct.'
		);
	}

	class DummyDatabase implements IDatabase {
		public Integer getPopulation(String city) {
			return 10000;
		}
	}
}
