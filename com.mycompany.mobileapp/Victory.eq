
/*
 * Victory
 * Created by Eqela Studio 2.0b7.4
 */

public class Victory : SEScene
{
	SESprite gameover;
	SESprite score;
	SESprite link1;
	SESprite link2;
	SESprite source;
	String scorenum;
	
	public void initialize(SEResourceCache rsc) {

		base.initialize(rsc);
		add_entity(SESpriteEntity.for_color(Color.instance("white"), get_scene_width(), get_scene_height()));
		rsc.prepare_font("myfont", "arial bold color=black",0.07*get_scene_height());
		rsc.prepare_font("link","arial bold color=black",0.02*get_scene_height());
		gameover = add_sprite_for_text("Congratulations","myfont");
		gameover.move(0.5*get_scene_width()-0.5*gameover.get_width(),0.5*get_scene_height()-0.5*gameover.get_height());
		score = add_sprite_for_text("","myfont");
		scorenum = "Score = %d".printf().add(Primitive.for_integer(MainScene.score)).to_string();
		score.set_text(scorenum);
		score.move(0,0.9*get_scene_height());
		source = add_sprite_for_text("Sources:","myfont");
		source.move(0,0.55*get_scene_height());
		link1 = add_sprite_for_text("http://lifehacker.com/5976362/the-complete-guide-to-what-to-do-before-during-and-after-a-disaster#earthquakes","link");
		link1.move(0,0.75*get_scene_height());
		link2 = add_sprite_for_text("http://www.phivolcs.dost.gov.ph/index.php?option=com_content&view=article&id=313:phivolcs-awareness-and-preparedness-materials&catid=66","link");
		link2.move(0,0.7*get_scene_height());	
	}
	public void on_pointer_press(SEPointerInfo pi) {
		
		gameover=null;
		score=null;
		MainScene.score=0;
		scorenum=null;
		SESprite.remove(source);
		SESprite.remove(link1);
		SESprite.remove(link2);
		SESprite.remove(score);
		SESprite.remove(gameover);
		switch_scene(new MainScene());
	}
}
