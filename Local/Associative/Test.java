public class Test {

	public String message;
	public double point;
	public int group;
	public boolean passed;

	public Test (String message, int group, double point) {
		this.message = message;
		this.group = group;
		this.point = point;
		passed = false;
	}
}