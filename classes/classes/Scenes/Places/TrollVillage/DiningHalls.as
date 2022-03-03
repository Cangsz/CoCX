/**
 * @Author Pyromania
 * Coded in by Jtecx, Jan/Feb 2022
 */

package classes.Scenes.Places.TrollVillage {
import classes.Scenes.SceneLib;
import classes.Scenes.Places.TrollVillage;

public class DiningHalls extends TrollVillageAbstractContent{
    public function DiningHalls():void {
    }

    public function GrabABite2Eat():void{
        clearOutput();
        menu();
        outputText("You walk toward the large hut, the smell of food is enticing as you draw closer to it.\n\n");
        if (rand(10) == 1) {
            outputText("You notice a hooded troll ");
            if (TrollVillage.KaljiUnlocked) outputText("that you recognize him as Kal'ji");
            outputText("walking with a fairly burly looking troll, something about the bigger troll’s expression catches your attention. He’s squirming and looks extremely uncomfortable. You wonder why he’s so upset but you don’t think twice about it.\n");
        }
        outputText("You breach the halls and there are several trolls around, talking to each other and eating some food.\n\n");
        outputText("You are approached by a busgirl, \"Is there something you wanted to eat? A small donation of 8 gems is all we ask for to eat here\" She asks as she points you to the menu. \"Once you’ve ordered you may take a seat.\"\n\n");
        outputText("You glance over to the menu, considering your options.\n\n");

        addButton(0, "Fig Juice", FigJuice);
        addButton(1, "Hunter's Stew", HuntStew);
        addButton(2,"Gardener's Salad", GardenSalad);
        addButton(14, "Leave", LeaveTheHalls);

        function LeaveTheHalls():void{
            clearOutput();
            outputText("You decide you are not hungry, you apologize to the waitress as you take your leave\n");
            doNext(SceneLib.trollVillage.EnterTheVillage);
        }

        function FigJuice():void{
            clearOutput();
            outputText("You order a cup of Fig Juice and take your seat once your order has been recorded.\n\n");
            ZenjiPaysorPC();
            outputText("You sit down patiently as you take in your surroundings. ");
            if (TrollVillage.ZenjiFollowing) outputText(" Zenji sits beside you, \"You know, my mother grows de best figs here. It’s been some time since I had any fig juice.\"\n");
            outputText("\nSoon enough your juice arrives, you hold the polished wooden cup in your palms, it’s a rather large serving. You take a sip, the fig’s normally tart flavor is balanced by some sweetness. ");
            if (TrollVillage.ZenjiFollowing) outputText("You pass the juice to Zenji, he takes a large sip. \"Ah, dat’s de good stuff…\" He sighs as he gives you the rest of the juice.\n\n");
            doNext(RandomChatter);
        }

        function HuntStew():void{
            clearOutput();
            outputText("You order the Hunter’s stew and take your seat once your order has been recorded.\n\n");
            ZenjiPaysorPC();
            outputText("You sit down patiently as you take in your surroundings. ");
            if (TrollVillage.ZenjiFollowing) outputText("Zenji sits beside you, \"I’ve been on a few hunts before, de meat tastes better de sooner you eat it.\"\n");
            outputText("\nSoon enough your food arrives, you look at the polished wooden plate, upon its surface is some cooked meat with some brown sauce over it, the sauce smells sweet and savory. You pick up your fork and cut into the meat, it’s tender enough to cut with just your fork. The meat is very juicy and savory, with hints of sweetness and saltiness. ");
            if (TrollVillage.ZenjiFollowing) outputText("You pass your fork to Zenji as he takes a large bite, \"De Hunter’s stew were always my favorite ta eat when Fatha gave me some gems ta spend here.\" He states as he passes the fork back to you.\n\n");
            doNext(RandomChatter);
        }

        function GardenSalad():void{
            clearOutput();
            outputText("You order the Gardener’s Salad and take your seat once your order has been recorded.\n\n");
            ZenjiPaysorPC();
            outputText("You sit down patiently as you take in your surroundings. ");
            if (TrollVillage.ZenjiFollowing) outputText("Zenji sits beside you, \"Motha said ta always eat ya greens ta grow big and strong… Father really took dat to de next level…\"\n");
            outputText("\nSoon enough your salad arrives, you look down at the polished wooden plate, upon its surface are several greens and a few fruits and vegetables. You’re given a side of dressing to coat your salad in. The dressing smells sweet, salty, and slightly cheesy. You dig your fork into the salad after coating your food in the dressing. You take a bite, the salad is nice on its own, but the dressing gives it the added flavor it needs. ");
            if (TrollVillage.ZenjiFollowing) outputText("You pass your fork to Zenji as he takes a forkful of salad, \"Fatha would sometimes finish all of de sauce and leave de rest of de salad ta mom,\" Zenji chuckles softly, \"She would get so mad dat he didn’t finish de salad.\" He says as he passes the fork back to you.\n\n");
            doNext(RandomChatter);
        }

        function ZenjiPaysorPC():void{  //So I don't have to copy/paste this....
            if (TrollVillage.ZenjiFollowing){
                outputText("Zenji forks over 8 gems, \"I gotcha covered, [name]\"\n\n");
            }
            else{
                outputText("You pass 8 gems toward the busgirl.");
            }
        }

    }

    private function RandomChatter():void{
        menu();
        clearOutput();
        outputText("You overhear some trolls talking around you as you eat your food.\n\n");
        switch(rand(6)){
            case 0:
                outputText("\"Didja hear? Yenza has her eyes on someone again… phew… after what happened to Zenji I don’t want ta know what she’s gonna do.\"\n" +
                        "\n" +
                        "\"If Jabala didn’t step in I dunno what Yenza would be doing wit him now.\"\n");
                break;
            case 1:
                outputText("\"De elders are talking about charging more ta eat here! Can ye believe it? Clothes cost enough as it is!\"\n" +
                        "\n" +
                        "\"You are just poor as dirt. That’s why I pay for you to eat here with me.\"\n");
                break;
            case 2:
                outputText("\"Oh, you like my new haircut? Yeah, I got into a mess while hunting, it was best to just get it cut again.\"\n" +
                        "\n" +
                        "\"Just shave your head, I heard it’s a new trend for huntresses like you\"\n");
                break;
            case 3:
                outputText(" \"Did you see how big Halkano is getting? Jabala is one lucky lady for having someone big and good with their hands around like that.\"\n" +
                        "\n" +
                        "\"How much now?\"\n" +
                        "\"He’s like 700 pounds!\"\n");
                break;
            case 4:
                outputText("\"There’s no flavor in dis hunt today… Ugh, we’re running out of salt these days…\"\n" +
                        "\n" +
                        "\"Maybe if you ate something else once in a while you’d liven your palette.\"\n");
                break;
            case 5:
                if (silly()) outputText("\"I used ta be a hunter like ya, then I took an arrow to the knee.\"\n" +
                        "\n" +
                        "\"He hablado con el consejo, puedo matarte por decir eso.\"\n");
                break;
            default:
                outputText("");
                break;
        }
        outputText("Once you’ve finished your food you look around, there’s plenty of other trolls around, you consider if you want to talk to anyone.\n");
        var menuItems:Array = [];
        menuItems.push("Waitress", SceneLib.trollVillage.kuru.KuruDining, "Talk to " + TrollVillage.KuruUnlocked?"Kuru":"the Waitress");
        menuItems.push("Halkano", (rand(4) == 1? SceneLib.trollVillage.halkano.TalksWithHalkano:"ignore"), "Talk to Halkano");
        menuItems.push("Jabala", (rand(4) == 1? SceneLib.trollVillage.jabala.JabalaDining:"ignore"), "Talk to Jabala");
        menuItems.push("Yenza", ((rand(4) == 1 && TrollVillage.YenzaUnlocked == 0|| (TrollVillage.YenzaUnlocked && !TrollVillage.ZenjiFollowing))? SceneLib.trollVillage.yenza.YenzaChecks:"ignore"), "Talk to Yenza");
        menuItems.push("Elder(M)", (rand(4) == 1? SceneLib.trollVillage.kalji.TalkWithKalji:"ignore"), "Talk to Kalji");
        menuItems.push("Elder(F)", (rand(4) == 1? SceneLib.trollVillage.yubi.TalkWithYubi:"ignore"), "Talk to Yubi");
        menuGen(menuItems, 0, LeaveTheHalls2, false);

        function LeaveTheHalls2():void{
            outputText("You decide that you’ve spent enough time in the dining hall and take your leave.\n");
            doNext(SceneLib.trollVillage.EnterTheVillage);
        }
    }
}
}
