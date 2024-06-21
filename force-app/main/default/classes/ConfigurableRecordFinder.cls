public class ConfigurableRecordFinder {
	class ConfigurableRecordFinderException extends Exception {
	}

	private IDatabase database;

	public ConfigurableRecordFinder(IDatabase database) {
		if (database == null) {
			throw new ConfigurableRecordFinderException(
				'Instance of IDatabase is required.'
			);
		}

		this.database = database;
	}

	public Integer getTotalPopulation(List<String> cities) {
		Integer result = 0;

		for (String city : cities) {
			result += this.database.getPopulation(city);
		}

		return result;
	}
}
