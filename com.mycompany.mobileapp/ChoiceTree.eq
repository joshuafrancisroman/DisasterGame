
/*
 * ChoiceTree
 * Created by Eqela Studio 2.0b7.4
 */

public class ChoiceTree : SEScene
{
	Scenario tree;
	
	public void initialize(SEResourceCache rsc) {	
		base.initialize(rsc);
		double w = 0.60*get_scene_width();
		double h = 0.40*get_scene_height();

		
		add_entity(SESpriteEntity.for_color(Color.instance("white"), get_scene_width(), get_scene_height()));
		rsc.prepare_font("scene","arial bold color=black",50);
		rsc.prepare_font("style","arial bold color=black",40);	
		rsc.prepare_image("hero","player",0.60*get_scene_width(),0.25*get_scene_height());
		rsc.prepare_image("que","que",w,h);
		rsc.prepare_image("earth","earth",w,h);
		rsc.prepare_image("earthA","earthA",w,h);
		rsc.prepare_image("earthB", "earthB",w,h);
		rsc.prepare_image("dresser","dresser",w,h);
		rsc.prepare_image("surviveEarth","surviveEarth",w,h);
		tree = new Scenario();
		buildTree();
		randomizer();
		printer();
	}


	public void buildTree(){
		tree = createNode("que"," Pick your Disaster!","Earthquakes","Floods","Tornadoes","House Fires"); 
		tree.out1 = createNode("earth",  "You're on your car when disaster happens.","Stay put and wait for the shaking to stop.","Keep your foot on the gas until the shaking stops.","Calmly drive towards your house. ","Hastily, get out of the car.");
		tree.out1.out1 = createNode("earthA", "The earthquake stopped. What now?", "Open the radio and check for damaged roads and structures", "Go out and jump to that pretty hole" , "Drive to your home" , "Kneel and face the sunset");
		tree.out1.out3 = createNode("earthB", "You got home but then there was an aftershock.", "Get under that sturdy dresser. ","Stay close to the shelf and windows.", "Run outside as fast as you can." ,"Stand strong and will yourself to be strong."); 
		tree.out1.out1.out3 = tree.out1.out3;
		tree.out1.out1.out1 = ending("surviveEarth","You are a survivor! ");
		//tree.out2 = new Scenario();
		//tree.out3 = new Scenario();
		//tree.out4 = new Scenario();


		

	}

	

	public void on_pointer_press(SEPointerInfo pi) {
		Scenario passer;
		if(pi.is_inside(tree.choice1.get_x(),tree.choice1.get_y(),tree.choice1.get_width(),tree.choice1.get_height())) {
			passer = tree.out1;
		}
		
		if(pi.is_inside(tree.choice2.get_x(),tree.choice2.get_y(),tree.choice2.get_width(),tree.choice2.get_height())) {
			passer = tree.out2;
		}

		if(pi.is_inside(tree.choice3.get_x(),tree.choice3.get_y(),tree.choice3.get_width(),tree.choice3.get_height())) {
			passer = tree.out3;
		}

		if(pi.is_inside(tree.choice4.get_x(),tree.choice4.get_y(),tree.choice4.get_width(),tree.choice4.get_height())) {
			passer = tree.out4;
		}
		
		
		tree.remove();
		tree = passer;
		if(passer!=null && passer.status==2) {
			printer();
			switch_scene(new Victory());
		}
		else{
			if(tree==null) {
				switch_scene(new GameOver());
			}
			else {
				MainScene.score++;
				randomizer();
				printer();
			}
		}
	}



	public Scenario createNode(String Pic, String Scene ,String Choice1, String Choice2, String Choice3, String Choice4) {
		var v = new Scenario();
		v.pic = add_sprite_for_image(SEImage.for_resource(Pic));
		v.scene = add_sprite_for_text(Scene,"scene");
		v.choice1 = add_sprite_for_text(Choice1,"style");
		v.choice2 = add_sprite_for_text(Choice2,"style");
		v.choice3 = add_sprite_for_text(Choice3,"style");
		v.choice4 = add_sprite_for_text(Choice4,"style");
		v.hide();
		return (v);
		
	}

	public Scenario ending(String Pic, String ending) {
		var v = new Scenario();
		v.pic = add_sprite_for_image(SEImage.for_resource(Pic));
		v.scene = add_sprite_for_text(ending,"style");
		v.choice1 = add_sprite_for_text("","style");
		v.choice2 = add_sprite_for_text("","style");
		v.choice3 = add_sprite_for_text("","style");
		v.choice4 = add_sprite_for_text("","style");
		v.status = 2;
		v.hide();
		return(v);
		
	}
	
	public void printer() {
		tree.pic.move(0.5*get_scene_width()-0.5*tree.pic.get_width(),0.1*get_scene_height());
		tree.scene.move(0.5*get_scene_width()-0.5*tree.scene.get_width(),0.5*get_scene_height());
		tree.choice1.move(0.5*get_scene_width()-0.5*tree.choice1.get_width(),0.6*get_scene_height());
		tree.choice2.move(0.5*get_scene_width()-0.5*tree.choice2.get_width(),0.7*get_scene_height());
		tree.choice3.move(0.5*get_scene_width()-0.5*tree.choice3.get_width(),0.8*get_scene_height());
		tree.choice4.move(0.5*get_scene_width()-0.5*tree.choice4.get_width(),0.9*get_scene_height());
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

		tree.out1 = (Scenario) outArr.get(0);
		tree.out2 = (Scenario) outArr.get(1);
		tree.out3 = (Scenario) outArr.get(2);
		tree.out4 = (Scenario) outArr.get(3);
	}
}

