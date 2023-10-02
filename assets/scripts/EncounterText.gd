extends Control

var statue_encounter_text = {
	"start": [
		"A bright-eyed crow emerges from the static, perched atop an overgrown statue. It tilts its head back and opens its beak to say:",
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
		"[color=yellow](CROW)[/color] Luckily, friend, you are not the first to fall into the SQUARE. If you dial [color=aqua]due E-wards[/color] from here, you will find a town. In its shadow you may find your way to some others like yourself. If you see anything strange, I'd be happy to impart any information I have. [wave]Good luck![/wave]", 
		{"statue": "end"}],
	"end": ["[color=yellow](CROW)[/color] CAW! CAW! CAW! CAW! CAW!", 
		"[color=yellow](CROW)[/color] Ahem, apologies. I must keep up appearances, you understand.",
		"[color=yellow](CROW)[/color] Remember: if you dial [color=aqua]due E-wards[/color] from here, you will find a town. In its shadow you may find your way to some others like yourself.",
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
		"[color=yellow](TRUMPET-CREATURE)[/color] You there, weird lookin' kid, be kind and buy a banana won't you. Ol' Vinny needs a break. Ol' Vinny needs to make rent.",
		"[color=yellow](OL' VINNY)[/color] Nothing's been the same since she left -- my wife, left -- [shake]honk[/shake] oh god. She took everything you know, from Ol' Vinny. How could she do that? I mean, [shake]honk[/shake] I had it coming, really.",
		"[color=yellow](OL' VINNY)[/color] Late nights, weekends at the office, missed piano recitals -- my little girl's real talented, even though she's got no hands, she can outplay the best of 'em -- for what? A hat and a box of bananas. She ain't going to music school no more that's for sure.",
		"[color=yellow](OL' VINNY)[/color] But we had a good life, a nice, middle class life, until --",
		"[color=yellow](OL' VINNY)[/color] [shake]honk[/shake] [i]Why[/i] oh why did I put it all in Universal Steel? It's that damn Jameson from the office, it's all his fault! He promised me, it was a safe bet he said, can't go wrong he said, he had insider info, construction's up, can't go wrong.",
		"[color=yellow](OL' VINNY)[/color] [shake]Those corrupt bastards took away my house![/shake]",
		"[color=yellow](OL' VINNY)[/color] [shake]honk[/shake] I promised Ma that I would make it big in the city. Go get 'em Vinny, she would say, go show 'em all what a West Trumpetsville boy can do. [shake]honk[/shake]",
		"[color=yellow](OL' VINNY)[/color] Poor ol' Ma. She never saw it coming.",
		"[color=yellow](OL' VINNY)[/color] [shake]honk[/shake] Well, if Ma was still around she'd keel right over anyway after seeing the rent prices these days. Back then you could rent out a whole mansion.",
		"[color=yellow](OL' VINNY)[/color] So buy a banana, won't you? For Ol' Vinny's sake. Or don't. What's the point? It's one less banana for dinner.",
		"...",
		"You buy a banana.",
		"[color=yellow](OL' VINNY)[/color] That's real gracious of you, kid. Sorry about the sob story -- name's Vinny, by the way, short for Vindpipe. Vindpipe Reed.",
		"...",
		"You decide to ask Vinny if he's from outside the SQUARE.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] What square?",
		"...",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Listen kid, you're sounding a little bananas, and I've known a few bananas in my life, so I know what I'm talking about.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] But if you want to find someone, the city's the best bet, it's a real jungle in here. We here this is the heart of the city, and it goes out [color=aqua]ED-ways[/color], [color=aqua]RF-ways[/color], and [color=aqua]QA-ways[/color].",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Hope you find whoever it is you're looking for.",
		{"trumpet": "1", "statue": "trumpet"}
	],
	"1": [
		"It's Vinny.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Eyo, buy some bananas, won't you! Ol' Vinny needs someone to buy his bananas.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] What, you've already bought one? How am I supposed to tell? Vinny's got no eyes.",
		"...",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] You've already heard the pitch, I ain't givin' it out for free. Why not buy another banana so Ol' Vinny can keep a roof over his head?",
		{"trumpet": "2"}
	],
	"2": [
		"It's Vinny.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] You want some advice, kid? Stand up straight, suck in your gut, and get yourself a job interview.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Dress professional, get there early, bring a banana peel, and toss that banana peel right in front of the door.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Why a banana peel? I know you're asking yourself that. You are, aren't you? Tell me if you aren't. Now, most of the other guys will avoid the peel, or pick it up, or complain, or [shake]SMACK[/shake] eat a nozzle-full of shit. That's not how we roll. That's what we call herd mentality.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Instead, you gotta [i]step[/i] on the peel on your way in. [i]Slip[/i] into the room on the banana peel like you're wearing, uh, what's it called. Heelys (TM).",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Adapting to an unexpected situation like that? Boss man sees, knows you're creative, knows you've got grit, and knows you've got foresight, because you prepared that banana peel ahead of time. You're a shoo-in.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] And if anyone else slips on the peel, you're there to catch them. That's leadership.",
		"...",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Good advice, ain't it? You know it is. Usually I charge five cents for advice that good, but I'll cut you a deal. You get that one for free, and the next one for two cents. How about it?",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] How about it, kid? [shake]honk[/shake]",
		{"trumpet": "end"}
	],
	"end": [
		"It's Vinny.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Leave me alone, kid. I'm ruined.",
		{}
	],
	"siren": [
		"It's Vinny.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Leave me alone, kid. I'm ruined.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] What, a siren? Out by the lake? [shake]Wants bananas by the boxload!?[/shake]",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] [shake]HOOOOOOOOOOOOOONK[/shake] Ol' Vinny's big break is finally here! No sawdust for dinner tonight!",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Thanks kid, have a banana on the house! I gotta pack! [shake]HOOOOOOOOOOOOOONK[/shake]",
		{"trumpet": "true_end", "siren": "trumpet"}
	],
	"true_end": [
		"It's Vinny.",
		"[color=yellow](VINDPIPE \"VINNY\" REED)[/color] Sorry kid, can't talk! I gotta pack! [shake]HOOOOOOOOOOOOOONK[/shake]",
		{}
	]
}

var salt_encounter_text = {
	"start": [
		"A rather tall space dog floats towards you in distress.",
		"[color=yellow](ASTROHOUND)[/color] -sniff sniff- Who goes there?",
		"You wonder if her spacesuit isn't airtight. She salutes you. You salute back.",
		"[color=yellow](ASTROHOUND)[/color] Ah, a fellow explorer. I am Sargeant Salt, but you can call me Sgt. Salt. Are you searching for someone, too?",
		"[color=yellow](SGT. SALT)[/color] Why yes, I am from outside this world. I lost my partner Bubbles when we arrived here, in fact. I fear he cannot be left alone for too long.",
		"[color=yellow](SGT. SALT)[/color] His... let's say... [i]ruff[/i] nature can be effective in our missions, but when unsupervised, he...",
		"[color=yellow](SGT. SALT)[/color] Ahem. Never mind that.",
		"[color=yellow](SGT. SALT)[/color] I got separated from Bubbles somewhere over the forest, I believe. It's a bit of a journey to get there. [color=aqua]First, you want to shift S-ward from here, until you just start to see purple. Then, turn A-ward, and you should get to the forest's shadow in due time. From there, you can get to the heart of the forest by following the shadow R-ward.[/color] I am not sure where in the forest my colleague might be, however.",
		"[color=yellow](SGT. SALT)[/color] I must admit, this planet is strange, unlike any we've explored before. It seems to go on forever, Xlorbulon-6. But at the same time, it hardly seems to go on at all, quite like Faxon-C. Very curious.",
		"[color=yellow](SGT. SALT)[/color] If you see Bubbles, do let me know, will you? Many thanks in advance.",
		{"salt": "end", "bubbles": "start_salt"}
	],
	"start_bubbles": [
		"A rather tall space dog floats towards you in distress.",
		"[color=yellow](ASTROHOUND)[/color] -sniff sniff- Who goes there?",
		"You wonder if her spacesuit isn't airtight. She salutes you. You salute back.",
		"[color=yellow](ASTROHOUND)[/color] Ah, a fellow explorer. I am Sargeant Salt, but you can call me Sgt. Salt. Are you searching for someone, too?",
		"[color=yellow](SGT. SALT)[/color] Why yes, I am from outside this world. I lost my partner Bubbles when we arrived here, in fact. I fear he cannot be left alone for too long.",
		"[color=yellow](SGT. SALT)[/color] His... let's say... [i]ruff[/i] nature can be effective in our missions, but when unsupervised, he...",
		"[color=yellow](SGT. SALT)[/color] Ahem. Never mind that.",
		"[color=yellow](SGT. SALT)[/color] I got separated from Bubbles somewhere over the forest, I believe. It's a bit of a journey to get there. [color=aqua]First, you want to shift S-ward from here, until you just start to see purple. Then, turn A-ward, and you should get to the forest's shadow in due time. From there, you can get to the heart of the forest by following the shadow R-ward.[/color] I am not sure where in the forest my colleague might be, however.",
		"[color=yellow](SGT. SALT)[/color] I must admit, this planet is strange, unlike any we've explored before. It seems to go on forever, Xlorbulon-6. But at the same time, it hardly seems to go on at all, quite like Faxon-C. Very curious.",
		"[color=yellow](SGT. SALT)[/color] If you see Bubbles, do let me know, will you? Many thanks in advance.",
		"...",
		"[color=yellow](SGT. SALT)[/color] Ah, so you think you've seen him, floating about at around (18, 10, 73, 55), is it? Many thanks, I shall -- ah, covered in blood? Yes, that is... to be expected of him.",
		"...",
		"[color=yellow](SGT. SALT)[/color] Less and less, you say? He would like to be left alone? I must say, this news is disheartening. This world plays strange tricks on one's perception of oneself. I may pay him a visit, nonetheless. Thank you, once again.",
		{"salt": "true_end"}
	],
	"bubbles": [
		"Sargeant \"Sgt. Salt\" Salt floats on by.",
		"[color=yellow](SGT. SALT)[/color] -sniff sniff- Who goes there?",
		"[color=yellow](SGT. SALT)[/color] Ah, it's good to smell you again. Have you visited the forest yet?",
		"...",
		"[color=yellow](SGT. SALT)[/color] So you think you've seen him, floating about at around (18, 10, 73, 55), is it? Many thanks, I shall -- ah, covered in blood? Yes, that is... to be expected of him.",
		"...",
		"[color=yellow](SGT. SALT)[/color] Less and less, you say? He would like to be left alone? I must say, this news is disheartening. This world plays strange tricks on one's perception of oneself. I may pay him a visit, nonetheless. Thank you, once again.",
		{"salt": "true_end"}
	],
	"end": [
		"Sargeant \"Sgt. Salt\" Salt floats on by.",
		"[color=yellow](SGT. SALT)[/color] -sniff sniff- Who goes there?",
		"[color=yellow](SGT. SALT)[/color] Ah, it's good to smell you again. Have you visited the forest yet?",
		"[color=yellow](SGT. SALT)[/color] [color=aqua]First, you want to shift due S-ward from here, until you just start to see purple. Then, turn A-ward, and you should get to the forest's shadow eventually. From there, you can get to the heart of the forest by following the shadow F-ward.[/color]",
		"[color=yellow](SGT. SALT)[/color] If you see Bubbles there, do let me know, will you? Many thanks in advance.",
		{}
	],
	"true_end": [
		"Sargeant \"Sgt. Salt\" Salt floats on by.",
		"[color=yellow](SGT. SALT)[/color] -sniff sniff- Who goes there?",
		"[color=yellow](SGT. SALT)[/color] Ah, it's good to smell you again.",
		"[color=yellow](SGT. SALT)[/color] I must say, the news you gave me is disheartening. This world plays strange tricks on one's perception of oneself. I may pay him a visit, nonetheless. Thank you, once again.",
		{}
	]
}

var ghost_encounter_text = {
	"start": [
		"A somewhat on-the-nose interpretation of the phrase \"ghost in the machine\" rockets towards you.",
		"[color=yellow](GHOST)[/color] Stand back! You imbecilic inchworm! One step closer and my Automatic Solar Flare Laser Piston Defense Mechanisms could have been triggered. You'd be reduced to ash and dust befoere you could even say [wave]Jumping Jackarandas![/wave]",
		"[color=yellow](GHOST)[/color] Yes, it is I, WELTGEIST, the unstoppable locomotive! Now if you've no further business, leave so that your malefic mouth-breathing does not rust the perfectly polished exterior of my stunningly scintillating suit.",
		"...",
		"[color=yellow](WELTGEIST)[/color] What are you doing, still standing there like a foppish frengle ostentatiously ogling a titillating treat? Are you curious about my mech suit?",
		"[color=yellow](WELTGEIST)[/color] Hmph! Unlike my ectoplasmic equals I have devised a way to walk and thrive amongst the living - not just amongst, but above! My cleverly crafted contraption can effortlessly evade the perils of any biome, defend against any antagonistic attack and produce the most savory of sandwiches in .092839385 seconds.",
		"[color=yellow](WELTGEIST)[/color] If you must know, the stroke of genius that led me to construct my proud body came as I was wandering the SQUARE one day, sinfully nude, frighteningly unprotected from the elements, when I happened upon a copy of TRANSFORMERS: AGE OF EXTINCTION. What sublime art! And what luck! A veritable deus ex machina, if you will.",
		"[color=yellow](WELTGEIST)[/color] Impressed? Don't bother. I already know. Now, begone! I have no patience for disgustingly organic beings such as you.",
		{"ghost": "end"}
	],
	"end": [
		"[color=yellow](WELTGEIST)[/color]Here to grovel before my world-historic body? Very well. You may look, but not touch.",
		{}
	]
}

var forest_encounter_text = {
	"start": [
		"A shallow river runs through this autumnal forest. The air reeks of dead salmon; gulls and raccoons swoop in for a feast.",
		"The forest's shadow stretches out in three directions. Which path will you take?",
		{}
	]
}

var siren_encounter_text = {
	"start": [
		"A siren beckons with her melancholic song. She doesn't have any supernatural powers -- it's just a nice song.",
		"[color=yellow](SIREN)[/color] [wave]This lake is filled with sooo many things, if you just know where to look! Though, it could use a bit more water...[/wave]",
		"[color=yellow](SIREN)[/color] [wave]Oh, hi! Are you a collector, too? Or are you something to be collected? Tee hee![/wave]",
		"[color=yellow](SIREN)[/color] [wave]Don't worry, I don't think I could make anything useful out of you... yet. Maybe come back after you've decomposed a bit, and then we can talk? ;)[/wave]",
		"[color=yellow](SIREN)[/color] [wave]I make all of my accessories out of treasures I find lying around. Like this hair piece made out of old netting and soda bottles! Isn't is stylish? The dead crab really adds a nice pop of color.[/wave]",
		"[color=yellow](SIREN)[/color] [wave]There is a type of treasure I need more of, though. Banana peels! They're so hard to come by around here. It's too cold, I think. Oh, if only I could get a whole box of banana peels, I would give any amount of treasure in exchange.[/wave]",
		"[color=yellow](SIREN)[/color] [wave]By the way, I saw some weird thing in a space suit floating around, [color=aqua]A-S-ways of the heart of the forest[/color]. Whatever it was, I don't think it can be good for the environment! Do you think I could make something out of it?",
		{"siren": "end", "trumpet": "siren"}
	], 
	"end": [
		"The siren beckons with her melancholic song.",
		"[color=yellow](SIREN)[/color] [wave]Hello again! You wouldn't happen to know where I could get some banana peels, would you?[/wave]",
		"[color=yellow](SIREN)[/color] [wave]By the way, I saw some weird thing in a space suit floating around, [color=aqua]A-S-ways of the heart of the forest[/color]. Whatever it was, I don't think it can be good for the environment! Do you think I could make something out of it?",
		{}
	], 
	"trumpet": [
		"The siren beckons with her melancholic song.",
		"[color=yellow](SIREN)[/color] [wave]A trumpet-creature is selling bananas in the city? Wow, I mean, I've never been, and I've always been afraid of crowds...[/wave]",
		"[color=yellow](SIREN)[/color] [wave]Oh, but if it's for some beautiful banana peels, I can do it![/wave]",
		"[color=yellow](SIREN)[/color] [wave]Thank you thank you! I must pack![/wave]",
		{"siren": "true_end"}
	],
	"true_end": [
		"The siren is too busy packing to talk.",
		{}
	]
}

var bubbles_encounter_text = {
	"start": [
		"Oh god why is that dog covered in blood.",
		"[color=yellow](BLOODY DOG)[/color] Oh, hello there. Are you one, or two?",
		"[color=yellow](BLOODY DOG)[/color] I used to be two. Where the other is, I don't know. This place is so small, but she's been gone so long...",
		"[color=yellow](BLOODY DOG)[/color] I think, when we come here, we become less.\n\n...Or do we become more? It's hard to say.",
		"[color=yellow](BLOODY DOG)[/color] But well, there's no point. It will only shrink. Less and less... You should go before you are less, too.",
		{"bubbles": "end", "salt": "start_bubbles"}
	],
	"end": [
		"Oh god why is that dog covered in blood.",
		"[color=yellow](BLOODY DOG)[/color] Oh, hello again.",
		"[color=yellow](BLOODY DOG)[/color] I think, when we come here, we become less.\n\n...Or do we become more? It's hard to say.",
		"[color=yellow](BLOODY DOG)[/color] But well, there's no point. It will only shrink. Less and less... You should go before you are less, too.",
		{}
	],
	"start_salt": [
		"Oh god why is that dog covered in blood.",
		"[color=yellow](BUBBLES?)[/color] Oh, hello there. Are you one, or two?",
		"[color=yellow](BUBBLES?)[/color] I used to be two. Where the other is, I don't know. This place is so small, but she's been gone so long...",
		"[color=yellow](BUBBLES?)[/color] Oh, so you've seen her, my Sgt. Salt?",
		"[color=yellow](BUBBLES?)[/color] Well, I don't know if I want to be two anymore. I think, when we come here, we become less.\n\n...Or do we become more? It's hard to say.",
		"[color=yellow](BUBBLES?)[/color] But well, there's no point. It will only shrink. Less and less... I am already less. You should go before you are less, too.",
		"[color=yellow](BUBBLES?)[/color] Tell Salt I said hi.",
		{"bubbles": "true_end", "salt": "bubbles"}
	],
	"salt": [
		"Oh god why is that dog covered in blood.",
		"[color=yellow](BUBBLES?)[/color] Oh, hello again.",
		"[color=yellow](BUBBLES?)[/color] Oh, so you've seen her, my Sgt. Salt?",
		"[color=yellow](BUBBLES?)[/color] Well, I don't know if I want to be two anymore. I think, when we come here, we become less.\n\n...Or do we become more? It's hard to say.",
		"[color=yellow](BUBBLES?)[/color] But well, there's no point. It will only shrink. Less and less... I am already less. You should go before you are less, too.",
		"[color=yellow](BUBBLES?)[/color] Tell Salt I said hi.",
		{"bubbles": "true_end"}
	],
	"true_end": [
		"[color=yellow](BUBBLES?)[/color] Tell Salt I said hi.",
		{}
	]
}

var all_encounter_text = {"statue": statue_encounter_text, "trumpet": trumpet_encounter_text, "salt": salt_encounter_text, "ghost": ghost_encounter_text, "forest": forest_encounter_text,"siren": siren_encounter_text, "bubbles": bubbles_encounter_text}
