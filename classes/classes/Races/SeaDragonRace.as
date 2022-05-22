package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;

public class SeaDragonRace extends Race{
	public static const SeaDragonEyeColors:/*String*/Array = ["orange","yellow","light green"];
	
	public function SeaDragonRace(id:int) {
		super("Sea Dragon", id);
		chimeraTier = 0;
		grandChimeraTier = 0;
	}
	
	public override function setup():void {
		addScores()
				.hornType(Horns.SEA_DRAGON, +1)
				.antennaeType(Antennae.SEA_DRAGON, +1)
				.earType(Ears.ORCA, +1)
				.tailType(Tail.ORCA, +1)
				.faceType(Face.ORCA, +1, -100)
				.tongueType(Tongue.DRACONIC, +1)
				.eyeType(Eyes.DRACONIC, +1)
				.eyeColor(ANY(SeaDragonEyeColors), +1)
				.hairType(Hair.PRISMATIC, +1)
				.legType(LowerBody.SEA_DRAGON, +1, -100)
				.armType(Arms.SEA_DRAGON, +1, -100)
				.rearType(RearBody.ORCA_BLOWHOLE, +1)
				.skinPlainOnly(+1)
				.skinBaseAdj("glossy", +1)
				.skinBasePattern(Skin.PATTERN_SEA_DRAGON_UNDERBODY, +1)
				.wingType(Wings.SEA_DRAGON, +4, -100)
				.customRequirement("body","not toned",
						function (body:BodyData):Boolean {
							return body.player.tone < 10;
						}, +1)
				.height(AT_LEAST(84), +1)
				.customRequirement("","big breasted female or futa; or big dragon cock",
						function (body:BodyData):Boolean {
							return body.hasVagina && body.player.biggestTitSize() > 19 ||
									body.player.dragonCocks() > 0
						},
						+1)
				.hasPerk(PerkLib.DragonWaterBreath, +1);
		
		addMutation(IMutationsLib.DraconicBonesIM);
		addMutation(IMutationsLib.WhaleFatIM);
		addMutation(IMutationsLib.DrakeLungsIM);
		
		buildTier(20,"sea dragon")
				.namesMaleFemaleTaur("sea dragon-boy", "sea dragon-girl","sea dragon-taur")
				.buffs({
					"str.mult": +2.00,
					"spe.mult": +1.00,
					"tou.mult": +1.00,
					"int.mult": +0.50
				})
				.withExtraBonuses([
					"+1 Armor / Magic Resistance"
				])
				.end();
		
		buildTier(30,"leviathan")
				.namesMaleFemaleTaur("leviathan-boy", "leviathan-girl","leviathan-taur")
				.buffs({
					"str.mult": +1.10,
					"spe.mult": +0.70,
					"tou.mult": +0.70,
					"int.mult": +0.50
				})
				.withExtraBonuses([
						"+5 Armor / Magic Resistance"
				])
				.end();
	}
	
	public static function isSeaDragonLike(body:BodyData):Boolean {
		return body.wingType == Wings.SEA_DRAGON || body.legType == LowerBody.SEA_DRAGON || body.armType == Arms.SEA_DRAGON;
	}
}
}
