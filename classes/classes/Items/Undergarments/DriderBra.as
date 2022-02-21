/**
 * ...
 * @author Canadian Snas
 */
package classes.Items.Undergarments 
{
	import classes.Items.Undergarment;
	import classes.PerkLib;
	import classes.Player;

	public class DriderBra extends Undergarment
	{
		public static const TYPE_UPPERWEAR:int = 0;
		
		public function DriderBra() 
		{
			super("D. Bra", "Drider silk Bra", "Drider Bra", "Silky Drider-Weave Bra", TYPE_UPPERWEAR, 1200, "This pure-white, delicate-looking bra is made from silk, braided and molded by a skilled Manaweaver. While it’s light and comfortable, always cool on your assets, you can feel power pulsing through each strand of silk. A weblike design cups your assets, with a cutesy fly design in the center, over your nipples. \n\nType: Undergarment (upper)");
		}
		
		override public function playerEquip():Undergarment {
			game.player.createPerk(PerkLib.WizardsFocus, 0.1, 0, 0, 0);
			return super.playerEquip();
		}
		
		override public function playerRemove():Undergarment {
			while (game.player.hasPerk(PerkLib.WizardsFocus)) game.player.removePerk(PerkLib.WizardsFocus);
			return super.playerRemove();
		}
		
	}

}