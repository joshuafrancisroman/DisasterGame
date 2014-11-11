
/*
 * MainScene
 * Created by Eqela Studio 2.0b7.4
 */

public class MainScene :SEScene
{
	SESprite start1;
	public static int score=0;
	
	public void initialize(SEResourceCache rsc) {
		base.initialize(rsc);
		add_entity(SESpriteEntity.for_color(Color.instance("white"), get_scene_width(), get_scene_height()));
		rsc.prepare_font("myfont", "arial bold color=black",0.07*get_scene_height());
		start1 = add_sprite_for_text("Start","myfont");
		start1.move(0.5*get_scene_width()-0.5*start1.get_width(),0.5*get_scene_height()-0.5*start1.get_height());
	}

	public void on_pointer_press(SEPointerInfo pi) {
		SESprite.remove(start1);
		add_entity(SESpriteEntity.for_color(Color.instance("white"), get_scene_width(), get_scene_height()));
		switch_scene(new Pick());
		
	}	

	
}
