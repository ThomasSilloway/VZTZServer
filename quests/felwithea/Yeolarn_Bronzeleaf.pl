sub EVENT_SPAWN {
	#:: Set up a 50 unit distance
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
	#:: Check for 18780 - A Tattered Note
	if (plugin::check_hasitem($client, 18780)) {
		$client->Message(15,"As you enter a darkly lit room, a stern, important looking High Elf greets you.  'Welcome to you. I am Yeolarn Bronzeleaf, Guild Master for the Clerics of Tunare here in Felwithe. Read the note in your inventory and when you are ready to begin your training, please hand me your note.'");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail, $name! We of Tunare are charged with protecting the Great Mother from the forces of Innoruuk. Even now, the evil minions of this foul deity are despoiling our great forest. Will you help us [protect the Mother]?");
	}
	if ($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		#:: Give item 51121 - Tradeskill Basics: Volume I
		quest::summonitem(51121);
	}
	if ($text=~/second book/i) {
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		#:: Give item 51122 - Tradeskill Basics: Volume II
		quest::summonitem(51122);
	}
	if ($text=~/protect the Mother/i) {
		quest::say("Just outside the gates of Felwithe, the forces of Innoruuk gather in the guise of decaying skeletons. Bring me four sets of bone chips as proof of your vigilance. I assure you, your faith shall not go unrewarded.");
	}
	if ($text=~/Initiate of tunare/i) {
		quest::say("The Teir'Dal behind the undead plague in our forest have discovered a means of creating a terrible undead called a Ghast. These Ghasts have been sighted in the Lesser Faydark and must be destroyed. Bring me four of the vile creatures hearts.");
	}
	if ($text=~/slay the necromancer/i) {
		quest::say("The Fier'Dal rangers that inhabit the Lesser Faydark have spotted a courier making deliveries to the Teir'Dal camp near Castle Mistmoore and to a necromancer that lingers near the ancient obelisk. We believe that the crates he carries are supplies needed for the creation of more Ghasts. Another shipment should be arriving soon. Seek out the necromancer at the obelisk and take his head then take the head of the courier and return them to me with the crate that the courier carries and your Initiate Symbol of Tunare.");
	}
	if ($text=~/warden of tunare/i) {
		quest::say("The crate that the you recovered from the Courier contained this black candlestick that radiates an aura of great magical power. I request that you deliver the candlestick to Lady Trilani who is studying with the High Men in Erudin. Perhaps she can divine the nature of the candlestick and offer aid in defeating its power. The remaining contents of the crate have been given to Crusader Swiftmoon to be delivered to a gnome in steamfont that is purchasing them on behalf of the Eldrich Collective. When you return be sure to present your Disciple Symbol to me with anything that Trilani may ask you to deliver.");
		#:: Give item 1598 - Black Stone Candlestick
		quest::summonitem(1598);
	}
}

sub EVENT_ITEM {
	#:: Turn in for 18780 -  A Tattered Note
	if (plugin::check_handin(\%itemcount, 18780 => 1)) {
		quest::say("Welcome, friend, to the Clerics of Tunare. I am Yeolarn Bronzeleaf, head of the guild and devout follower of Tunare. Here is your guild tunic - it will help to protect you against this world's evils. Once you are ready to begin your training please make sure that you see Terren Starwatcher, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		#:: Ding!
		quest::ding();
		#:: Give a small amount of xp
		quest::exp(100);
		#:: Give item 13590 - Faded Gold Training Tunic*
		quest::summonitem(13590);
		#:: Set faction
		quest::faction(226,100); 	#:: + Clerics of Tunare
		quest::faction(279,100); 	#:: + King Tearis Thex
		quest::faction(5001,75); 		#:: + Anti-mage
	}
	#:: Turn in for 13073 - Bone Chips x4
	if (plugin::check_handin(\%itemcount, 13073 => 4)) {
		quest::say("Praise Tunare! I knew you would be victorious. I reward you with this spell, and pray that it will help you in your fight against the unholy forces of Innoruk. When you are ready you will make a fine [Initiate of Tunare].");
		#:: Ding!
		quest::ding();
		#:: Give a small amount of xp
		quest::exp(2500);
		#:: Give item 15014 - Spell: Strike
		quest::summonitem(15014);
		#:: Set faction
		quest::faction(226,15); 		#:: + Clerics of Tunare
		quest::faction(279,15); 	#:: + King Tearis Thex
		quest::faction(5001,15); 		#:: + Anti-mage
	}
	#:: Turn in for 10199 - Putrescent Heart x4
	if (plugin::check_handin(\%itemcount, 10199 => 4)) {
		quest::say("Praise Tunare!! You have done well young Initiate. Here the symbol of your station within our faith. Return to me when you are ready to [slay the necromancer] that has been creating the undead.");
		#:: Ding!
		quest::ding();
		#:: Give a small amount of xp
		quest::exp(3250);
		#:: Give item 1570 - Initiate Symbol of Tunare
		quest::summonitem(1570);
		#:: Set faction
		quest::faction(226,15); 		#:: + Clerics of Tunare
		quest::faction(279,15); 	#:: + King Tearis Thex
		quest::faction(5001,15); 		#:: + Anti-mage
	}
	#:: Turn in for 1570, 12514, 19065, 12513 -  Initiate Symbol of Tunare, Larik Z`Vole's Head, Teir`Dal Couriers Head, Teir`Dal Crate
	if (plugin::check_handin(\%itemcount, 1570 => 1, 12514 => 1, 19065 => 1, 12513 => 1)) {
		quest::say("Praise Tunare! The Mother smiles on you this day Disciple Angelsyn! I present you with the symbol of your new station among the Priests of Tunare. Return to me when you are ready to become a [Warden of Tunare]?");
		#:: Ding!
		quest::ding();
		#:: Give a small amount of xp
		quest::exp(4000);
		#:: Give item 1571 - Disciple Symbol of Tunare
		quest::summonitem(1571);
		#:: Set faction
		quest::faction(226,15); 		#:: + Clerics of Tunare
		quest::faction(279,15); 	#:: + King Tearis Thex
		quest::faction(5001,15); 		#:: + Anti-mage
	}
	#:: Turn in for 1571, 1599 -  Disciple Symbol of Tunare, Powder of Unanimation
	if (plugin::check_handin(\%itemcount, 1571 => 1, 1599 => 1)) {
		quest::say("Praise Tunare!! I will have our sorcerers examine this power immediately to see if we can reproduce it in quantities enough to eliminate the undead plague. I award you the rank of Warden of Tunare, the All Mother smiles upon you, $name!");
		#:: Ding!
		quest::ding();
		#:: Give a small amount of xp
		quest::exp(5000);
		#:: Give item 1572 - Warden Symbol of Tunare
		quest::summonitem(1572);
		#:: Set faction
		quest::faction(226,15); 		#:: + Clerics of Tunare
		quest::faction(279,15); 	#:: + King Tearis Thex
		quest::faction(5001,15); 		#:: + Anti-mage
	}
	#:: Return unused items
	else {
		plugin::return_items(\%itemcount);
	}
}
