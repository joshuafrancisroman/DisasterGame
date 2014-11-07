
/*
 * Victory
 * Created by Eqela Studio 2.0b7.4
 */

public class Victory : SEScene
{
	SESprite gameover;
	SESprite score;
	String scorenum;
	public void initialize(SEResourceCache rsc) {

		base.initialize(rsc);
		add_entity(SESpriteEntity.for_color(Color.instance("white"), get_scene_width(), get_scene_height()));
		rsc.prepare_font("myfont", "arial bold color=black",0.07*get_scene_height());
		gameover = add_sprite_for_text("Congratulations","myfont");
		gameover.move(0.5*get_scene_width()-0.5*gameover.get_width(),0.5*get_scene_height()-0.5*gameover.get_height());
		//ChoiceTree.tree.scene.move(0.5*get_scene_width()-0.5*gameover.get_width(),0.5*get_scene_height()-0.5*gameover.get_height());
		//ChoiceTree.victoryTag.move(0,0);
		score = add_sprite_for_text("","myfont");
		scorenum = "Score = %d".printf().add(Primitive.for_integer(MainScene.score)).to_string();
		score.set_text(scorenum);
		score.move(0,0.9*get_scene_height());
	}
	public void on_pointer_press(SEPointerInfo pi) {
		
		gameover=null;
		score=null;
		MainScene.score=0;
		scorenum=null;
		SESprite.remove(score);
		SESprite.remove(gameover);
		switch_scene(new MainScene());
	}
}
