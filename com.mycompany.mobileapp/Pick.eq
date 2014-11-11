
/*
 * Pick
 * Created by Eqela Studio 2.0b7.4
 */

public class Pick : SEScene
{
	public static int mychoice=0;
	SESprite bg1;
	SESprite bg2;
	SESprite bg3;
	SESprite bg4;
	public void initialize(SEResourceCache rsc) {
		base.initialize(rsc);
		add_entity(SESpriteEntity.for_color(Color.instance("white"), get_scene_width(), get_scene_height()));	
		rsc.prepare_image("bg1","bg1",0.5*get_scene_width(),0.5*get_scene_height());
		
		rsc.prepare_image("bg3","bg3",0.5*get_scene_width(),0.5*get_scene_height());
		
		rsc.prepare_image("bg2","bg2",0.5*get_scene_width(),0.5*get_scene_height());
		
		rsc.prepare_image("bg4","bg4",0.5*get_scene_width(),0.5*get_scene_height());
		bg1 = add_sprite_for_image(SEImage.for_resource("bg1"));
		bg2 = add_sprite_for_image(SEImage.for_resource("bg2"));
		bg3 = add_sprite_for_image(SEImage.for_resource("bg3"));
		bg4 = add_sprite_for_image(SEImage.for_resource("bg4"));
		bg1.move(0,0);
		bg2.move(0.5*get_scene_width(),0);
		bg3.move(0,0.5*get_scene_height());
		bg4.move(0.5*get_scene_width(),0.5*get_scene_height());
		base.initialize(rsc);
	}

	
	public void on_pointer_press(SEPointerInfo pi) {
		
		if(pi.is_inside(0,0,0.5*get_scene_width(),0.5*get_scene_height())) {
			mychoice = 1;
		}
		
		else if(pi.is_inside(0,0.5*get_scene_height(),0.5*get_scene_width(),get_scene_height())){
			mychoice = 3;
		}

		else if(pi.is_inside(0.5*get_scene_width(),0.5*get_scene_height(),get_scene_width(),get_scene_height())) {
			mychoice = 4;
		}

		else if(pi.is_inside(0.5*get_scene_width(),0,get_scene_width(),get_scene_height())) {
			mychoice = 2;
	
		}
		SESprite.remove(bg1);
		SESprite.remove(bg2);
		SESprite.remove(bg3);
		SESprite.remove(bg4);
		switch_scene(new ChoiceTree());
	}
		
}
