
/*
 * Scenario
 * Created by Eqela Studio 2.0b7.4
 */

public class Scenario
{
    public Scenario out1;
	public Scenario out2;
	public Scenario out3;
	public Scenario out4;
	public SESprite pic;
	public SESprite scene;
	public SESprite choice1;
	public SESprite choice2;
	public SESprite choice3;
	public SESprite choice4;

	public Scenario() {
		out1 = out2 = out3 = out4 = null;
		pic = choice1 = choice2 = choice3 = choice4 = scene  = null;
	}

	public bool isEmpty() {
		return (scene == null);
	}
	

	public SESprite getChoice(Scenario tree,int n) {
		var Arr = Array.create();
		Arr.append(tree.choice1);
		Arr.append(tree.choice2);
		Arr.append(tree.choice3);
		Arr.append(tree.choice4);
		return ( ((SESprite) Arr.get(n) ) );
	}

	public static Scenario instantiate1(Scenario input) {
		var v = new Scenario();
		v.out1 = new Scenario();
		v.out1 = input;
		return (v);
	}


}
