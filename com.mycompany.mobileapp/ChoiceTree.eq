
/*
 * ChoiceTree
 * Created by Eqela Studio 2.0b7.4
 */

public class ChoiceTree : SEScene
{
	Scenario tree;
	bool bypass=false;
	bool bypass1=false;
	SESprite bg;//small squarish option
	
	public void initialize(SEResourceCache rsc) {	
		base.initialize(rsc);
		double w = 0.75*get_scene_width();
		double h = 0.40*get_scene_height();
					
		add_entity(SESpriteEntity.for_color(Color.instance("white"), get_scene_width(), get_scene_height()));
		rsc.prepare_font("scene","Arial color=black outline-color=#ADD8E6  bold",0.05*get_scene_height());
		rsc.prepare_font("style","Arial color=black outline-color=#ADD8E6  bold",0.04*get_scene_height());	
		rsc.prepare_image("hero","player",0.60*get_scene_width(),0.25*get_scene_height());
		rsc.prepare_image("que","que",w,h);
		rsc.prepare_image("earth","earth",w,h);
		rsc.prepare_image("earthA","earthA",w,h);
		rsc.prepare_image("earthB", "earthB",w,h);
		rsc.prepare_image("dresser","dresser",w,h);
		rsc.prepare_image("surviveEarth","surviveEarth",w,h);
		rsc.prepare_image("flood","flood",w,h);
		rsc.prepare_image("drown","drown",w,h);
		rsc.prepare_image("upstairs","upstairs",w,h);
		rsc.prepare_image("elec","elec",w,h);
		rsc.prepare_image("fire","fire",w,h);
		rsc.prepare_image("firedoor","firedoor",w,h);
		rsc.prepare_image("fiery","fiery",w,h);
		rsc.prepare_image("car","car",w,h);
		rsc.prepare_image("volcano","volcano",w,h);
		rsc.prepare_image("post","post",w,h);
		rsc.prepare_image("glass","glass",w,h);
		rsc.prepare_image("tripped","tripped",w,h);
		rsc.prepare_image("bookcase","bookcase",w,h);
		rsc.prepare_image("sandbag","sandbag",w,h);
		rsc.prepare_image("caution","caution",w,h);
		rsc.prepare_image("window","window",w,h);
		rsc.prepare_image("upclose","upclose",w,h);
		rsc.prepare_image("erupt","erupt",w,h);
		rsc.prepare_image("mask","mask",w,h);
		rsc.prepare_image("ash","ash",w,h);
		rsc.prepare_image("food","food",w,h);
		rsc.prepare_image("pet","pet",w,h);
		rsc.prepare_image("radio","radio",w,h);
		rsc.prepare_image("bg","bg",get_scene_width(),get_scene_height());
		rsc.prepare_image("bg1","bg1",get_scene_width(),get_scene_height());
		rsc.prepare_image("bg2","bg2",get_scene_width(),get_scene_height());
		rsc.prepare_image("bg3","bg3",get_scene_width(),get_scene_height());
		rsc.prepare_image("bg4","bg4",get_scene_width(),get_scene_height());
		
		tree = new Scenario();
		buildTree();
		switch(Pick.mychoice) {
			case 1:{tree = tree.out1;}
			case 2:{tree = tree.out2;}
			case 3:{tree = tree.out3;}
			case 4:{tree = tree.out4;}
		}
		randomizer();
		printer();
	}


	public void buildTree(){
		tree = createNode("que","Pick your Disaster","Earthquakes","Floods","Volcanic Eruption","House Fires","bg"); 
		tree.out1 = createNode("earth",  "You're on your car when disaster happens.","Stay put and wait for the shaking to stop.","Keep your foot on the gas until the shaking stops.","Calmly drive towards your house. ","Hastily, get out of the car.","bg1");
		tree.out1.out1 = createNode("earthA", "The earthquake stopped. What now?", "Open the radio and check for damaged roads and structures", "Go out and jump to that pretty hole" , "Drive to your home" , "Kneel and face the sunset","bg1");
		tree.out1.out2 = badending("car","You got in a car accident, always keep calm.","bg1");
		tree.out1.out3 = createNode("earthB", "You got home but then there was an aftershock.", "Get under that sturdy dresser. ","Stay close to the shelf and windows.", "Run outside as fast as you can." ,"Stand strong and will yourself to be strong.","bg1"); 
		tree.out1.out4 = badending("post","There may be falling objects/structures after/during an earthquake.","bg1");
		tree.out1.out3.out4 = badending("bookcase","Get under sturdy objects.","bg1");
		tree.out1.out1.out3 = tree.out1.out3;
		tree.out1.out3.out2 = badending("glass","Do not go near fragile and unstable objects during an earthquake.","bg1");
		tree.out1.out3.out3 = badending("tripped", "You fell/tripped.'It is usually safer to stay put' - Dr.Arthur Bradley","bg1");
		tree.out1.out1.out1 = ending("surviveEarth","Tune to emergency radio and be wary of structures that may have been damaged","bg1");
		tree.out1.out3.out1 = ending("dresser","That damn sturdy dresser!","bg1");


		tree.out2 = createNode("flood", "You live near the river, Green Warning is reported via PAGASA.","Prepare the sandbags, Hold your fort!", "Bring all your stuff upstairs.","Sleep and hope the flood won't come.","Swim with the fishes","bg2");
		tree.out2.out1 = ending("sandbag","The sandbags will block the water from entering!","bg2");
		tree.out2.out3 = badending("drown","You drowned while you we're sleeping.","bg2");
		tree.out2.out2 = createNode("upstairs","After 5 mins you are still not finished but some water has entered.","Keep putting your things upstairs.", "Stay upstairs and wait for the rain to pass.", "Turn off all utilities and stay upstairs." ,"Go outside and assess the problem.","bg2");
		tree.out2.out2.out3 = ending("caution","Closing all utilities is important because there could be live wires","bg2");
		tree.out2.out2.out1 = badending("elec","You got electrocuted because there is a live current!","bg2");
		tree.out2.out2.out4 = tree.out2.out2.out1;
		tree.out2.out2.out2 = ending("surviveEarth","Staying upstairs is the right choice when water comes inside","bg2");
	
		
		tree.out3 = createNode("volcano","You live near an active volcano, what will you prepare","Prepare gas masks and face cloths","Batteries and flashlights ","Matches and candles","All of the above and put in an accessible place","bg3");
		tree.out3.out1 = tree.out3.out2 = tree.out3.out3 = tree.out3.out4 = createNode("erupt","The volcano erupted without prior notice","Cover your nose and mouth with a damp cloth","Close all the windows","Go towards the restricted zone area","Watch the erupting volcano up-close","bg3");
		tree.out3.out1.out3 = tree.out3.out1.out4 = badending("upclose","Don't be this guy","bg3");
		tree.out3.out1.out1 = ending("mask","Volcanic ash can irritate the respiratory system","bg3");
		tree.out3.out1.out2 = createNode("ash","You are still indoors during the ashfall.","Listen to the radio for updates","Wait for the ashfall to stop, then scoop the ash from the roof.","Cover your food with containers.","Put your dog indoors.","bg3");
		tree.out3.out1.out2.out1 = ending("radio","Listening to the radio during an emergency is good","bg3");
		tree.out3.out1.out2.out2 = ending("ash","The ash could cause the roof to collapse","bg3");
		tree.out3.out1.out2.out3 = ending("food","Covering the food will avoid ash contamination","bg3");
		tree.out3.out1.out2.out4 = ending("pet","Animals should also not breathe ash","bg3");

		
		tree.out4 = createNode("fire","You woke up and there is smoke around your room.","While crouching,try to go outside the windows","While crouching, try to go outside the door","Pack your valuables before escaping.","Panic! Scream! Shout!","bg4");
		tree.out4.out1 = ending("window", "Doors are not the only means of escape!","bg4");
		tree.out4.out2 = createNode("firedoor","You are infront of the door, what will you do?","Open the door and run towards the exit", "Check the door for heat or smoke" , "Go back to the window" , "Give up","bg4");
		tree.out4.out2.out3 = tree.out4.out1;
		tree.out4.out2.out1 = badending("firedoor", "There was a raging fire on the other side","bg4");
		tree.out4.out2.out2 = createNode("firedoor","The doorknob was warm and smoke was coming from the door","Open the door","Find another escape route","Go outside the window","Give up","bg4");
		tree.out4.out2.out2.out1 = tree.out4.out2.out1;
		tree.out4.out2.out2.out2 = badending("fiery","You took much time searching that you are now surrounded by flames","bg4");
		tree.out4.out2.out2.out3 = tree.out4.out1;		

		

	}

	public void on_pointer_press(SEPointerInfo pi) {
		
		if(pi.is_inside(tree.choice1.get_x(),tree.choice1.get_y(),tree.choice1.get_width(),tree.choice1.get_height())) {
			
			bg = add_sprite_for_color(Color.instance("#ADD8E6"),0.03*get_scene_width(),0.05*get_scene_height());
			bg.move(0.2*get_scene_width(),tree.choice1.get_y());
			
		}
		
		else if(pi.is_inside(tree.choice2.get_x(),tree.choice2.get_y(),tree.choice2.get_width(),tree.choice2.get_height())) {
			bg = add_sprite_for_color(Color.instance("#ADD8E6"),0.03*get_scene_width(),0.05*get_scene_height());
			bg.move(0.2*get_scene_width(),tree.choice2.get_y());
		
		}

		else if(pi.is_inside(tree.choice3.get_x(),tree.choice3.get_y(),tree.choice3.get_width(),tree.choice3.get_height())) {
			bg = add_sprite_for_color(Color.instance("#ADD8E6"),0.03*get_scene_width(),0.05*get_scene_height());
			bg.move(0.2*get_scene_width(),tree.choice3.get_y());
		}

		else if(pi.is_inside(tree.choice4.get_x(),tree.choice4.get_y(),tree.choice4.get_width(),tree.choice4.get_height())) {
			bg = add_sprite_for_color(Color.instance("#ADD8E6"),0.03*get_scene_width(),0.05*get_scene_height());
			bg.move(0.2*get_scene_width(),tree.choice4.get_y());
	
		}
	}

	public void on_pointer_release(SEPointerInfo pi) {
		Scenario passer;
		SESprite.remove(bg);
		if(bypass) {
			tree.remove();
			switch_scene(new Victory());
		}
		else if(bypass1) {
			tree.remove();
			switch_scene(new GameOver());
		}
		else if(pi.is_inside(tree.choice1.get_x(),tree.choice1.get_y(),tree.choice1.get_width(),tree.choice1.get_height())) {
			passer = tree.out1;
			doIterate(passer);
		}
		
		else if(pi.is_inside(tree.choice2.get_x(),tree.choice2.get_y(),tree.choice2.get_width(),tree.choice2.get_height())) {
			passer = tree.out2;
			doIterate(passer);
		}

		else if(pi.is_inside(tree.choice3.get_x(),tree.choice3.get_y(),tree.choice3.get_width(),tree.choice3.get_height())) {
			passer = tree.out3;
			doIterate(passer);
		}

		else if(pi.is_inside(tree.choice4.get_x(),tree.choice4.get_y(),tree.choice4.get_width(),tree.choice4.get_height())) {
			passer = tree.out4;
			doIterate(passer);
		}		
				
	}

	public void doIterate(Scenario passer) {
		
		tree.remove();
		tree = passer;
		if(passer!=null && passer.status==2) {
			MainScene.score++;
			printer();
			bypass=true;
		}
		else if(passer!=null && passer.status==0) {
			printer();
			bypass1=true;
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

	public Scenario createNode(String Pic, String Scene ,String Choice1, String Choice2, String Choice3, String Choice4, String back) {
		var v = new Scenario();
		v.bg = add_sprite_for_image(SEImage.for_resource(back));
		v.pic = add_sprite_for_image(SEImage.for_resource(Pic));
		v.scene = add_sprite_for_text(Scene,"scene");
		v.choice1 = add_sprite_for_text(Choice1,"style");
		v.choice2 = add_sprite_for_text(Choice2,"style");
		v.choice3 = add_sprite_for_text(Choice3,"style");
		v.choice4 = add_sprite_for_text(Choice4,"style");
		v.hide();
		return (v);
		
	}

	public Scenario ending(String Pic, String ending, String back) {
		var v = new Scenario();
		v.bg = add_sprite_for_image(SEImage.for_resource(back));
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

	
	public Scenario badending(String Pic, String ending, String back) {
		var v = new Scenario();
		v.bg = add_sprite_for_image(SEImage.for_resource(back));
		v.pic = add_sprite_for_image(SEImage.for_resource(Pic));
		v.scene = add_sprite_for_text(ending,"style");
		v.choice1 = add_sprite_for_text("","style");
		v.choice2 = add_sprite_for_text("","style");
		v.choice3 = add_sprite_for_text("","style");
		v.choice4 = add_sprite_for_text("","style");
		v.status = 0;
		v.hide();
		return(v);
		
	}
	
	public void printer() {
		tree.bg.move(0,0);
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

