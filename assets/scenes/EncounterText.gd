extends Control

var statue_encounter_text = {
	"start": [
		"A bright-eyed crow emerges from the static. It tilts its head back and opens its beak to say:",
		"[color=yellow](CROW)[/color] CAW! CAW! CAW!",
		"[color=yellow](CROW)[/color] CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW!",
		"[color=yellow](CROW)[/color] CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW!",
		"[color=yellow](CROW)[/color] CAW! CAW! CAW! CAW! CAW! CAW! CAW! CAW! CA-  -cough cough-", 
		"[color=yellow](CROW)[/color] [wave]GREETINGS![/wave] What brings you to this space?",
		"[color=yellow](STATUE)[/color] ...",
		"[color=yellow](CROW)[/color] [i]Well of course they didn't have a choice. I'm simply being polite.[/i]\n\n...Excuse my companion here. We've been stuck here together so long, he's become a bit stiff.", 
		"[color=yellow](CROW)[/color] Anyway, I suspect you may not be familiar with how to tune this SQUARE; small though it may seem, its internal structure is immensely complex. We rarely move from here these days, but still we remember h--",
		"[color=yellow](STATUE)[/color] ...",
		"[color=yellow](CROW)[/color] Wha-",
		"[color=yellow](STATUE)[/color] ...",
		"[color=yellow](CROW)[/color] [i]Yes, of course I remember. [/i]I[i] remember. So perhaps you could not interrupt me?[/i]",
		"[color=yellow](CROW)[/color] The nature of the SQUARE's substrate is... somewhat unclear, even to those of us that have lived here for eons. Over the course of our many investigations we have discovered the existence of four mutually orthogonal, fundamental fields. Together, they span the SQUARE's known frequency-space.", 
		"[color=yellow](CROW)[/color] Yes, these four fields are permeated with vibrations, which through their mutual interference, gives rise to the great infinity of phenomena in the SQUARE's substrate. Of these, thankfully, most are GOOD VIBRATIONS.", 
		"[color=yellow](CROW)[/color] You can explore the SQUARE's phenomena by tuning into these vibrations, but, ah, it seems you are missing a few dials. Here, I have some extras to spare.\n\n[color=pink](Obtained new dials!)[/color]", 
		"Press [color=green]Q/A[/color], [color=green]W/S[/color], [color=green]E/D[/color], and [color=green]R/F[/color] to control your four dials.",
		"[color=yellow](CROW)[/color] Luckily, friend, you are not the first to fall into the SQUARE. If you dial [color=aqua]E-wards[/color] from here, you will find a town. In its shadow you may find your way to some others like yourself. If you see anything strange, I'd be happy to impart any information I have. [wave]Good luck![/wave]", 
		{"statue": "end"}],
	"end": ["[color=yellow](CROW)[/color] CAW! CAW! CAW! CAW! CAW!", 
		"[color=yellow](CROW)[/color] Ahem, apologies. I must keep up appearances, you understand.",
		"[color=yellow](CROW)[/color] Remember: if you dial [color=aqua]E-wards[/color] from here, you will find a town. In its shadow you may find your way to some others like yourself.",
		"[color=yellow](STATUE)[/color] ...", {}],
	"trumpet": [
		"[color=yellow](CROW)[/color] CAW! A trumpet-creature? Yes, they are quite common here, actually, some of the SQUARE's more industrious inhabitants.",
		"[color=yellow](STATUE)[/color] ...",
		"[color=yellow](CROW)[/color] [i]So what! Don't be so sensitive. I meant no such thing![/i]",
		"[color=yellow](CROW)[/color] Anyway, it seems you've stumbled upon a rather unfortunate specimen. A very SAD SACK. I do hope his [wave]trebels[/wave] end soon.",
		"[color=yellow](CROW)[/color] Ohoho. Just a little music joke to lighten the mood.",
		{"statue": "end"}],
	}

var trumpet_encounter_text = {
	"start": [
		"It's a trumpet-creature.",
		"[color=yellow](TRUMPET-CREATURE)[/color] [wave]Bananas! Eyo, buy some bananas! One banana! One cent each![/wave]",
		"[color=yellow](TRUMPET-CREATURE)[/color] You there, be kind and buy a banana, won't you. Ol' Vinny needs a break. Ol' Vinny needs to make rent.",
		"[color=yellow](OL' VINNY)[/color] Nothing's been the same since she left -- my wife, left -- [shake]honk[/shake] oh god. She took everything you know, from Ol' Vinny. How could she do that? I mean, [shake]honk[/shake] I had it coming, really.",
		"[color=yellow](OL' VINNY)[/color] Late nights, weekends at the office. Missed piano recitals -- my little girl's real talented, even though she's got no hands, she can outplay the best of 'em -- for what? A hat and a box of bananas. She ain't going to music school no more that's for sure.",
		"[color=yellow](OL' VINNY)[/color] We had a good life, a nice, peaceful life, until -- [shake]honk[/shake] [i]why[/i] did I have to put it all in Universal Steel? It's that damn Jameson at work, he promised me, it was a safe bet he said, can't go wrong he said, he had insider info, construction's up, can't go wrong.",
		"[color=yellow](OL' VINNY)[/color] [shake]Those corrupt bastards ruined my life![/shake]",
		"[color=yellow](OL' VINNY)[/color] I promised Ma that I would make it big in the city. Go get 'em Vinny, she would say, go show 'em all what a West Trumpetsville boy can do. [shake]honk[/shake]",
		"[color=yellow](OL' VINNY)[/color] Poor ol' Ma. She never saw it coming.",
		"[color=yellow](OL' VINNY)[/color] These rent prices, man oh man, I tell ya, if Ma was still around she'd keel right over anyway after seeing these prices, I tell you what.",
		"[color=yellow](OL' VINNY)[/color] So buy a banana, won't you? For Ol' Vinny's sake. Or don't. What's the point? It's one less banana for dinner.",
		"...",
		"You buy a banana.",
		"[color=yellow](OL' VINNY)[/color] That's real gracious of you. Sorry about the sob story -- name's Vinny, by the way, short for Vindpipe. Vindpipe Reed.",
		"...",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Am I from the outside world? Outside of where?",
		"...",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Listen, you're sounding a little bananas and I've known a few bananas in my life so I know what I'm talking about.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] But if you want to find someone, the city's the best bet, it's a real jungle in here. We here this is the heart of the city, and it goes out [color=aqua]ED-ways[/color], [color=aqua]RF-ways[/color], and [color=aqua]QA-ways[/color].",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Hope you find whoever it is you're looking for.",
		{"trumpet": "end", "statue": "trumpet"}
	],
	"end": [
		"It's Vinny.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Eyo, buy some bananas, won't you! Ol' Vinny needs someone to buy his bananas.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] What, you've already bought one? How am I supposed to tell? Vinny's got no eyes.",
		"...",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] You've already heard the pitch, I ain't givin' it out for free. Why not buy another banana so Ol' Vinny can keep a roof over his head?",
		{}
	]
}

var all_encounter_text = {"statue": statue_encounter_text, "trumpet": trumpet_encounter_text}
