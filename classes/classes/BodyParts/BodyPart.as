/**
 * Created by aimozg on 25.04.2017.
 */
package classes.BodyParts {
import classes.CoC_Settings;
import classes.Creature;
import classes.internals.SimpleJsonable;
import classes.internals.Utils;

public class BodyPart extends SimpleJsonable {
	include "../../../includes/appearanceDefs.as";

	protected var _type:int = 0;
	public function restore(keepColor:Boolean = true):void {
		type = 0;
	}
	protected var creature:Creature;
	public function BodyPart(creature:Creature,publicPrimitives:Array) {
		addPublicPrimitives(publicPrimitives);
		addPublicPrimitives(["type"]);
		this.creature       = creature;
	}
	public function get type():int {return _type;}
	public function set type(value:int):void {_type = value;}

	public function isAny(...args:Array):Boolean {
		for each (var i_type:int in args) if (type == i_type) return true;
		return false;
	}
	public function isNeither(...args:Array):Boolean {
		for each (var i_type:int in args) if (type == i_type) return false;
		return true;
	}
	/**
	 * Should be implemented in subclasses.
	 */
	public function descriptionFull():String {
		CoC_Settings.errorAMC("BodyPart","describe");
		return "something";
	}
	public function setProps(p:Object):void {
		copyObjectEx(this, p, myPublicPrimitives);
	}

	public function setAllProps(p:Object, keepTone:Boolean = true):void {
		restore(keepTone);
		setProps(p);
	}
}
}
