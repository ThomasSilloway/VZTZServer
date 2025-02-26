#Zone: Steamfont Mountains
#Short Name: steamfont
#Zone ID: 56
#
#NPC Name: Forpar Fizfla
#NPC ID: 56130
#Quest Status: finished

if(quest::is_the_ruins_of_kunark_enabled()){
	sub EVENT_SAY { 
		if ($text=~/Hail/i) {
			quest::say("Get out you pesky $race! I don't need any $race germs! Out, ye filthy beast!");
		}
		if ($text=~/mystical instrument/i) {
			quest::say("I have made many mystical instruments in the past. Each one seemed to be better then the last. I have always had a dream of building the world's best lute, but I have yet to find someone brave enough to gather the [components] needed to make the instrument.");
		}
		if ($text=~/components/i) {
			quest::say("To make a mystical lute I will first need to make several pieces. If you bring me the backbone of an ancient fishman, a strong tentacle from one of the long lost amalgyms, and a petrified skull of a lycanthrope I may be able to create the head and neck of the instrument. If you go out and gather these things, make sure to bring me the note I gave you or I might forget who you are. I am getting quite old, you know.");
			quest::summonitem(20380); #Forpar's Note to Himself
		}
		if ($text=~/next pieces/i) {
			quest::say("The next pieces are a little harder to come by than the last set. To make the body of an instrument that will last for ages to come, I need something very special. The scales of a big red dragon and the scales of a big white dragon will make it unbreakable, as well as giving it a unique look. Some metal bits will allow me to hold the body together. Please, if you gather up these things, bring them to me as soon as possible. I have not felt this good in years!");
		}
	}
	
	sub EVENT_ITEM {
		#Note to Forpar Fizfla
		if ($itemcount{20378} == 1) {
			quest::say("So you know Vedico! How is the lass? If Vedico would give you the time of day, you must be something special. What can I do for you? I hope you have not come to have me make another [mystical instrument].");
		}
		#Forpar's Note to Himself, Kedge Backbone, Petrified Werewolf Skull, Amygdalan Tendril
		elsif (($itemcount{20380} == 1) && ($itemcount{20524} == 1) && ($itemcount{20525} == 1) && ($itemcount{5520} == 1)) {
			quest::say("Wow! I didn't think a $race like you would be able to gather all of those things.");
			quest::emote("rambles around and works with small tools for a good ten minutes before handing you a very fine looking lute head.");
			quest::summonitem(20535); #Mystical Lute Head
			quest::say("Now, do you want to gather the next pieces for me?");
		}
		#White Dragon Scales, Red Dragon Scales, Metal Bits
		elsif (($itemcount{11602} == 1) && ($itemcount{11622} == 1) && ($itemcount{16905} == 1)) {
			quest::say("Wooooooo! You are doing a wonderful job, $name. I wish I could go out and gather these things myself.' Forpar sits back down at his desk and pulls several very strange looking tools out. Eventually he looks up at you and says, 'The body is done! Only one more piece to go!");
			quest::summonitem(20536); #Mystical Lute Body
		}
		#Mystical Lute Head, Mystical Lute Body, Undead Dragongut Strings
		elsif (($itemcount{20535} == 1) && ($itemcount{20536} == 1) && ($itemcount{20526} == 1)) {
			quest::say("Goodness! I can hardly contain myself! This will be my greatest creation ever!");
			quest::emote("sits down, slides the lute head into place and screws it together. After a few minutes, he begins to string the lute with the gut strings of the poison dragon. A wonderful sound fills the air as he strums the lute once and hands it to you.");
			quest::say("I hope you find a good use for that! I bet you could play it from the mountaintops and the people below would hear you. Thank you, $name, for making my lifelong dream come true!");
			quest::summonitem(20538); #Mystical Lute
		} else {
			plugin::return_items(\%itemcount);
		}
	}
}
#END of FILE Zone:steamfont  ID:56130 -- Forpar_Fizfla