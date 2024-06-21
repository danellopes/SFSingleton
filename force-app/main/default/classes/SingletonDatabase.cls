public class SingletonDatabase implements IDatabase {
  public static SingletonDatabase instance = new SingletonDatabase();
  private static Integer instanceCount;
  public static Integer count = instanceCount;
  private Map<String, Integer> capitals = new Map<String, Integer>();

  private SingletonDatabase() {
    if (instanceCount == null) {
      instanceCount = 0;
    }

    instanceCount++;
    System.debug('Initializing database');

    this.capitals = new Map<String, Integer>{
      'Tokyo' => 33200000,
      'New York' => 17800000,
      'Sao Paulo' => 17700000,
      'Mexico City' => 17400000,
      'Osaka' => 16425000,
      'Manila' => 14750000,
      'Mumbai' => 14350000,
      'Delhi' => 14300000,
      'Jakarta' => 14250000
    };
  }

  public Integer getPopulation(String city) {
    return this.capitals.get(city);
  }
}
