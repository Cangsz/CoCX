/**
 * ...
 * @author Ormael
 */
package classes.Scenes.Dungeons.RiverDungeon 
{

import classes.*;
import classes.internals.*;
import classes.CoC;
import classes.GlobalFlags.kFLAGS;
import classes.Scenes.SceneLib;

public class DarknessElemental extends Monster
	{
		public function baseElementalAttack():void {
			outputText(""+(flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 4?"Blackened doppelganger":"The darkness elemental")+" envelops its fists within inky shadows before throwing a punch toward you.");
			var damage:Number = inte + wis;
			if (player.hasPerk(PerkLib.DarknessAffinity) || player.hasPerk(PerkLib.FireShadowAffinity)) damage *= 0.3;
			if (player.hasPerk(PerkLib.LightningAffinity)) damage *= 3;
			damage *= ((flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] + 1) * 2);
			damage = Math.round(damage);
			//Dodge
			if (damage <= 0 || (player.getEvasionRoll())) outputText(" You slide underneath the surprise punch!");
			else
			{
				if (hasStatusEffect(StatusEffects.Provoke)) damage = Math.round(damage * statusEffectv2(StatusEffects.Provoke));
				outputText(" It hits you square in the chest. ");
				damage = player.takeDarknessDamage(damage, true);
			}
		}
		
		public function fluffyOfPunches():void {
			outputText(""+(flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 4?"Blackened doppelganger":"The darkness elemental")+" wraps its fists in wicks of darkness before zeroing in for a flurry of punches.");
			var damage:Number = inte + wis;
			if (player.hasPerk(PerkLib.DarknessAffinity) || player.hasPerk(PerkLib.FireShadowAffinity)) damage *= 0.3;
			if (player.hasPerk(PerkLib.LightningAffinity)) damage *= 3;
			damage *= ((flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] + 1) * 1.5);
			damage = Math.round(damage);
			//Dodge
			if (damage <= 0 || (player.getEvasionRoll())) outputText(" You slide underneath it avoiding all punches!");
			else
			{
				if (hasStatusEffect(StatusEffects.Provoke)) damage = Math.round(damage * statusEffectv2(StatusEffects.Provoke));
				outputText(" The strikes connect, hitting you directly in the chest. ");
				damage = player.takeDarknessDamage(damage, true);
				damage = player.takeDarknessDamage(damage, true);
			}
		}
		
		public function subbossSpecial():void {
			outputText("Blackened doppelganger concentrates, coalescing nearby ambient darkness into crescent-shaped shards before hurling them toward you with a flick of his wrist.");
			if (player.getEvasionRoll()) outputText(" You slide underneath the barrage!");
			else {
				var damage:Number = inte + wis;
				if (player.hasPerk(PerkLib.DarknessAffinity) || player.hasPerk(PerkLib.FireShadowAffinity)) damage *= 0.3;
				if (player.hasPerk(PerkLib.LightningAffinity)) damage *= 3;
				damage *= 3.75;
				damage = Math.round(damage);
				if (hasStatusEffect(StatusEffects.Provoke)) damage = Math.round(damage * statusEffectv2(StatusEffects.Provoke));
				outputText(" The darkness shards connect with your body. ");
				damage = player.takeDarknessDamage(damage, true);
				damage = player.takeDarknessDamage(damage, true);
				damage = player.takeDarknessDamage(damage, true);
				damage = player.takeDarknessDamage(damage, true);
				damage = player.takeDarknessDamage(damage, true);
				damage = player.takeDarknessDamage(damage, true);
				damage = player.takeDarknessDamage(damage, true);
				damage = player.takeDarknessDamage(damage, true);
			}
		}
		
		override protected function performCombatAction():void
		{
			if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 4) {
				if (hasStatusEffect(StatusEffects.Provoke)) {
					var choiceP1:Number = rand(5);
					if (choiceP1 == 0) fluffyOfPunches();
					if (choiceP1 == 1) baseElementalAttack();
					if (choiceP1 > 1) subbossSpecial();
				}
				else {
					var choice11:Number = rand(6);
					if (choice11 < 2) fluffyOfPunches();
					if (choice11 == 2 || choice11 == 3) baseElementalAttack();
					if (choice11 > 3) subbossSpecial();
				}
			}
			else {
				if (hasStatusEffect(StatusEffects.Provoke)) {
					var choiceP:Number = rand(5);
					if (choiceP < 4) fluffyOfPunches();
					if (choiceP == 4) baseElementalAttack();
				}
				else {
					var choice1:Number = rand(6);
					if (choice1 < 3) fluffyOfPunches();
					if (choice1 == 3 || choice1 == 4) baseElementalAttack();
					if (choice1 == 5) eAttack();
				}
			}
		}
		
		override public function defeated(hpVictory:Boolean):void
		{
			if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 4) SceneLib.dungeons.riverdungeon.defeatDarknessElementalSubBoss();
			else cleanupAfterCombat();
		}
		
		override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void
		{
			if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 4) SceneLib.dungeons.riverdungeon.defeatedByDarknessElementalSubBoss();
			else SceneLib.dungeons.riverdungeon.defeatedByDarknessElemental();
		}
		
		public function DarknessElemental() 
		{
			if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 0) {
				this.short = "darkness elemental";
				this.imageName = "darkness elemental";
				this.long = "You're currently fighting darkness elemental. It's a four feet tall body of darkness shaped into a humanoid form. It's using bare fists to fight.";
				this.tallness = 48;
				initStrTouSpeInte(44, 64, 104, 220);
				initWisLibSensCor(220, 20, 110, 0);
				this.weaponAttack = 24;
				this.armorDef = 24;
				this.armorMDef = 130;
				this.level = 26;
				this.bonusHP = 1500;
				this.additionalXP = 185;
			}
			else if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 1) {
				this.short = "darkness elemental";
				this.imageName = "darkness elemental";
				this.long = "You're currently fighting darkness elemental. It's a four foot, three inch tall body of darkness shaped into a humanoid form. It's using bare fists to fight.";
				this.tallness = 51;
				initStrTouSpeInte(50, 70, 110, 250);
				initWisLibSensCor(250, 20, 130, 0);
				this.weaponAttack = 28;
				this.armorDef = 28;
				this.armorMDef = 150;
				this.level = 28;
				this.bonusHP = 1700;
				this.additionalXP = 215;
			}
			else if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 2) {
				this.short = "darkness elemental";
				this.imageName = "darkness elemental";
				this.long = "You're currently fighting darkness elemental. It's a four and half foot tall body of darkness shaped into a humanoid form. It's using bare fists to fight.";
				this.tallness = 54;
				initStrTouSpeInte(56, 76, 116, 280);
				initWisLibSensCor(280, 20, 150, 0);
				this.weaponAttack = 32;
				this.armorDef = 32;
				this.armorMDef = 170;
				this.level = 30;
				this.bonusHP = 1900;
				this.additionalXP = 245;
			}
			else if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 3) {
				this.short = "darkness elemental";
				this.imageName = "darkness elemental";
				this.long = "You're currently fighting darkness elemental. It's four foot, nine inch tall body of darkness shaped into a humanoid form. It's using bare fists to fight.";
				this.tallness = 57;
				initStrTouSpeInte(62, 82, 122, 310);
				initWisLibSensCor(310, 20, 170, 0);
				this.weaponAttack = 36;
				this.armorDef = 36;
				this.armorMDef = 190;
				this.level = 32;
				this.bonusHP = 2100;
				this.additionalXP = 275;
			}
			else if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 4) {
				this.short = "unique darkness elemental";
				this.imageName = "unique darkness elemental";
				this.long = "You're currently fighting unique darkness elemental. It's a nine foot tall creature that looks exactly like you. Its body is wrapped in an darkness cloak, almost completely concealing its form as it using its bare fists to fight.";
				this.tallness = 108;
				initStrTouSpeInte(92, 120, 198, 460);
				initWisLibSensCor(460, 30, 254, 0);
				this.weaponAttack = 44;
				this.armorDef = 50;
				this.armorMDef = 250;
				this.level = 37;
				this.bonusHP = 3150;
				this.additionalXP = 600;
			}
			this.a = "the ";
			this.plural = false;
			this.lustVuln = 0.01;
			this.createBreastRow(0, 1);
			initGenderless();
			this.weaponName = "fists";
			this.weaponVerb = "smash";
			this.armorName = "skin of the darkness";
			this.createPerk(PerkLib.EnemyElementalType, 0, 0, 0, 0);
			this.createPerk(PerkLib.DarknessNature, 0, 0, 0, 0);
			if (flags[kFLAGS.RIVER_DUNGEON_ELEMENTAL_MIXER] == 4) {
				this.createPerk(PerkLib.EnemyHugeType, 0, 0, 0, 0);
				this.createPerk(PerkLib.EnemyChampionType, 0, 0, 0, 0);
				this.drop = new WeightedDrop()
					.add(useables.ELCRYST, 3)
					.add(useables.LELSHARD, 1);
			}
			else {
				this.createPerk(PerkLib.EnemyEliteType, 0, 0, 0, 0);
				this.drop = new WeightedDrop()
					.add(useables.ELSHARD, 3)
					.add(useables.LELSHARD, 1);
			}
			checkMonster();
		}
		
	}

}