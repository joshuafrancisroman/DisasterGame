
/*
 * ChoiceTree
 * Created by Eqela Studio 2.0b7.4
 */

public class ChoiceTree : SEScene
{
	Scenario tree;
	
	public void initialize(SEResourceCache rsc) {
		base.initialize(rsc);
		add_entity(SESpriteEntity.for_color(Color.instance("white"), get_scene_width(), get_scene_height()));
		rsc.prepare_font("style","arial bold color=black",60);	
		rsc.prepare_image("hero","player",0.60*get_scene_width(),0.25*get_scene_height());
		tree = new Scenario();
		
		tree = buildTree();
		//randomizer();
		printer();
	}


	public void on_pointer_press(SEPointerInfo pi) {
		MainScene.score++;
		tree.out1 = new Scenario();
		if(tree.out1.isEmpty()) {
			switch_scene(new GameOver());
		}
		//randomizer();
		//printer();
	}

	public Scenario buildTree() {
		Scenario temp = new Scenario();
		temp.pic = add_sprite_for_image(SEImage.for_resource("hero"));
		temp.scene = add_sprite_for_text("WTHS","style");
		temp.choice1 = add_sprite_for_text("WTH1","style");
		temp.choice2 =add_sprite_for_text("WTH2","style");
		temp.choice3 = add_sprite_for_text("WTH3","style");
		temp.choice4 = add_sprite_for_text("WTh4","style");
		temp.out1 = new Scenario();
		temp.out2 = new Scenario();
		temp.out3 = new Scenario();
		temp.out4 = new Scenario();
		//temp = temp.out1;
		temp.out1.scene = add_sprite_for_text("not empty","style");
		temp.out1.pic = add_sprite_for_image(SEImage.for_resource("hero"));
		temp.out1.scene = add_sprite_for_text("WTHS","style");
		temp.out1.choice1 = add_sprite_for_text("WTH1","style");
		temp.out1.choice2 =add_sprite_for_text("WTH2","style");
		temp.out1.choice3 = add_sprite_for_text("WTH3","style");
		temp.out1.choice4 = add_sprite_for_text("WTh4","style");
		return (temp);
	}

	public void printer() {
		tree.pic.move(0.20*get_scene_width(),0.15*get_scene_height());
		tree.scene.move(0.25*get_scene_width(),0.4*get_scene_height());
		tree.choice1.move(0.3*get_scene_width(),0.5*get_scene_height());
		tree.choice2.move(0.3*get_scene_width(),0.6*get_scene_height());
		tree.choice3.move(0.3*get_scene_width(),0.7*get_scene_height());
		tree.choice4.move(0.3*get_scene_width(),0.8*get_scene_height());
	}

	
	public void randomizer() {//randomize
		int n;
		var choiceArr = Array.create();
		choiceArr.append(tree.choice1);
		choiceArr.append(tree.choice2);
		choiceArr.append(tree.choice3);
		choiceArr.append(tree.choice4);

		var outArr = Array.create();
		outArr.append(tree.out1);
		outArr.append(tree.out2);
		outArr.append(tree.out3);
		outArr.append(tree.out4);
		
		for(n = 0; n < outArr.count(); n++) {//randomizer swapping
			int random = Math.random(0,outArr.count());

			var outTemp = outArr.get(n); //generic data type
			outArr.set(n, outArr.get(random));//no immediate override in eqela array. need to use set. start from 0 index
			outArr.set(random, outTemp);

			var choiceTemp = choiceArr.get(n);
			choiceArr.set(n, choiceArr.get(random));
			choiceArr.set(random, choiceTemp);
		}

		tree.choice1 = (SESprite) choiceArr.get(0);
		tree.choice2 = (SESprite) choiceArr.get(1);
		tree.choice3 = (SESprite) choiceArr.get(2);
		tree.choice4 = (SESprite) choiceArr.get(3);
		tree.out1 =  new Scenario();
		tree.out1 = (Scenario) outArr.get(1);
		//tree.out2 =  new (Scenario) outArr.get(1);
		//tree.out3 =  new(Scenario) outArr.get(2);
		//tree.out4 =  new(Scenario) outArr.get(3);
	}
}
