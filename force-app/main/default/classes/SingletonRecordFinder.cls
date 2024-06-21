public class SingletonRecordFinder {
  public Integer getTotalPopulation(List<String> cities) {
    Integer result = 0;

    for (String city : cities) {
      result += SingletonDatabase.instance.getPopulation(city);
    }

    return result;
  }
}
