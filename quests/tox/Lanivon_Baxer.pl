# Al'Kabor's Research - Ring of the Messenger
#
if(quest::is_the_ruins_of_kunark_enabled()){
	sub EVENT_SAY { 
	  if ($text=~/hail/i) {
	    quest::say("Greetings, $name. Safe travels to you.");
	  }
	}
	
	sub EVENT_ITEM {
	  if (plugin::check_handin(\%itemcount, 6069 => 1)) {
	    quest::say("Excellent work! Thank you for delivering this to me. I will get it to the High Council as soon as possible. Take this Ring of the Messenger as an insignia of your service to the city.");
	    quest::exp(85000);
	    quest::summonitem(1573);
	  }
	  else {
	    plugin::return_items(\%itemcount);
	  }
	}
}
# EOF zone: tox ID: 38064 NPC: Lanivon_Baxer

