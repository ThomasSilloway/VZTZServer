sub EVENT_SAY {
	
	$charid = 0;
	$corpse = 0;
	$charid = $client->CharacterID();
	$x = $client->GetX();
	$y = $client->GetY();
	$z = $client->GetZ();
	$corpse = quest::getplayerburiedcorpsecount($charid);
	
	if($text=~/Hail/i) {
		$client->Message(4, "The priest stares into your soul with cold eyes, its voice entering your mind. We keep all that has been lost. In times past, nothing be returned once it was mine. Time have changed. The bodies, your [" . quest::saylink("bodies") . "], that were lost to you can now be returned.");
		
		if ($ulevel < 50 && quest::is_content_flag_enabled('n00b_test'))
		{
			quest::level(50);
			quest::scribespells(50);
			quest::traindiscs(50);
			$client->Message(4, "To gear up command: ".quest::saylink("#gearup").", to find your way to the Arena use command: ".quest::saylink("#peqzone arena")."");
		}
	}
	
	if($text=~/bodies/i && $corpse == 0) {
		$client->Message(13, "The voice booms angrily in your mind, Be gone from this place. You waste my time!");
		$corpse = 0;
		$charid = 0;
	}
	
	if($text=~/bodies/i && $corpse > 0) {
		quest::summonburiedplayercorpse($charid, $x, $y, $z, 0);
		$corpse = 0;
		$charid = 0;
	}
 }