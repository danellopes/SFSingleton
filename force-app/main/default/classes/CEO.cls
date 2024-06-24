public class CEO {
	private static String pName;
	private static Integer pAge;

	public String name {
		get {
			return pName;
		}
		set {
			pName = value;
		}
	}

	public Integer age {
		get {
			return pAge;
		}
		set {
			pAge = value;
		}
	}

	public override String toString() {
		return 'Name: ' + pName + ' Age: ' + String.valueOf(pAge);
	}
}
