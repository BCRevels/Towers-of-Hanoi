HAI 1.3

OBTW
Code for pile borrowed from https://esolangs.org/wiki/LOLCODE
All other code written by Brandon Revels
TLDR

BTW Define stack (AKA pile) data structure
O HAI IM pile
	I HAS A length ITZ 0
	I HAS A max ITZ -1
	
	HOW IZ I pushin YR item
		DIFFRINT ME'Z max AN BIGGR OF ME'Z max AN ME'Z length, O RLY?
			YA RLY, ME HAS A SRS ME'Z length ITZ item, ME'Z max R SUM OF ME'Z max AN 1
			NO WAI, ME'Z SRS ME'Z length R item
		OIC
		ME'Z length R SUM OF ME'Z length AN 1
	IF U SAY SO
	
	HOW IZ I popin
		DIFFRINT ME'Z length AN 0, O RLY?
		YA RLY
			ME'Z length R DIFF OF ME'Z length AN 1
			I HAS A item ITZ ME'Z SRS ME'Z length
			ME'Z SRS ME'Z length R NOOB
			FOUND YR item
		OIC
	IF U SAY SO
	
	HOW IZ I gettinLen
		FOUND YR ME'Z length
	IF U SAY SO
KTHX

BTW Define POW function
HOW IZ I POW YR NUM AN YR RAISE
	I HAS A COUNT ITZ RAISE
	I HAS A PROD ITZ 1
	IM IN YR POWAH
		BOTH SAEM COUNT AN 0, O RLY?
		YA RLY
    		GTFO
		NO WAI
    		PROD R PRODUKT OF PROD AN NUM
    		COUNT R DIFF OF COUNT AN 1
		OIC
	IM OUTTA YR POWAH
	FOUND YR PROD
IF U SAY SO

BTW Define move_disk
HOW IZ I move_disk YR SRC AN YR DEST AN YR FROM AN YR TO
	I HAS A home_top ITZ A NUMBR
	I HAS A center_top ITZ A NUMBR
	BOTH SAEM 0 AN SRC IZ gettinLen MKAY, O RLY?
	YA RLY
		home_top R 0
	NO WAI
		home_top R SRC IZ popin MKAY
	OIC
	BOTH SAEM 0 AN DEST IZ gettinLen MKAY, O RLY?
	YA RLY
		center_top R 0
	NO WAI
		center_top R DEST IZ popin MKAY
	OIC

	BOTH SAEM home_top AN FAIL, O RLY?
	YA RLY
		VISIBLE SMOOSH center_top " P1" MKAY
		SRC IZ pushin YR center_top MKAY
		VISIBLE "Print to from center_top"
	MEBBE BOTH SAEM center_top AN FAIL
		VISIBLE SMOOSH home_top " P2" MKAY
		DEST IZ pushin YR home_top MKAY
		VISIBLE "Print from to home_top"
	MEBBE DIFFRINT home_top AN SMALLR OF home_top AN center_top
		VISIBLE SMOOSH home_top " " center_top " P3" MKAY
		SRC IZ pushin YR home_top MKAY
		SRC IZ pushin YR center_top MKAY
		VISIBLE "Print to from center_top 2"
	NO WAI
		VISIBLE SMOOSH center_top " " home_top " P4" MKAY
		DEST IZ pushin YR center_top MKAY
		DEST IZ pushin YR home_top MKAY
		VISIBLE "Print from to home_top 2"
	OIC
IF U SAY SO

BTW Define solve function
HOW IZ I solve YR N AN YR SRC AN YR DEST AN YR AUX
	I HAS A STEPS ITZ 1
	STEPS R I IZ POW YR 2 AN YR N MKAY
	I HAS A ITER ITZ STEPS

	I HAS A home ITZ 1
	I HAS A center ITZ 2
	I HAS A end ITZ 3

	IM IN YR INIT NERFIN YR ITER WILE BOTH SAEM ITER AN BIGGR OF ITER AN 1
		SRC IZ pushin YR MAEK ITER A NUMBR MKAY
	IM OUTTA YR INIT

	ITER R 1
	IM IN YR RUN UPPIN YR ITER WILE BOTH SAEM ITER AN SMALLR OF ITER AN STEPS
		BOTH SAEM 0 AN MOD OF ITER AN 3, O RLY?
		YA RLY
			VISIBLE "ONE" 
			I IZ move_disk YR aux AN YR dest AN YR end AN YR center MKAY
		MEBBE BOTH SAEM 1 AN MOD OF ITER AN 3
			VISIBLE "TWO" 
			I IZ move_disk YR src AN YR dest AN YR home AN YR center MKAY
		MEBBE BOTH SAEM 2 AN MOD OF ITER AN 3
			VISIBLE "THREE" 
			I IZ move_disk YR src AN YR aux AN YR home AN YR end MKAY
		OIC
	IM OUTTA YR RUN
IF U SAY SO

BTW Begin Main Section
I HAS A X ITZ 3
I HAS A src ITZ LIEK A pile
I HAS A dest ITZ LIEK A pile
I HAS A aux ITZ LIEK A pile

I IZ solve YR X AN YR src AN YR dest AN YR aux MKAY

BTW  stack IZ pushin YR "testvalue" MKAY
BTW  VISIBLE stack IZ popin MKAY

BTW End Program
KTHXBYE