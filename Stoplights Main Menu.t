%%% John Diefenbaker Secondary School
%%% TEJ3MI
%%% Anton Concheiro


%%% SUBPROGRAMS %%%

%% Interruptable delay %%
procedure Interr_Delay (Delay : nat2)

    var Count : nat2
    
    Count := 0
    
    loop
	exit when hasch or Count > Delay - 1
	delay (1)
	Count := Count + 1
    end loop

end Interr_Delay

%% Parallel put %%
procedure Parallel_Output (RedEW, YellowEW, GreenEW, RedNS, YellowNS, GreenNS, WalkEW, WalkNS, StopWalk : boolean)

    const EWR := 32
    const EWY := 8
    const EWG := 64
    const NSR := 128
    const NSY := 16
    const NSG := 4
    const WEW := 1
    const WNS := 2
    const SW := 3

    var ParallelValue : nat1
    
    ParallelValue := 0

    if RedEW then
	ParallelValue := ParallelValue + EWR
    end if
    if YellowEW then
	ParallelValue := ParallelValue + EWY
    end if
    if GreenEW then
	ParallelValue := ParallelValue + EWG
    end if
    if RedNS then
	ParallelValue := ParallelValue + NSR
    end if
    if YellowNS then
	ParallelValue := ParallelValue + NSY
    end if
    if GreenNS then
	ParallelValue := ParallelValue + NSG
    end if
    if WalkEW then
	ParallelValue := ParallelValue + WEW
    end if
    if WalkNS then
	ParallelValue := ParallelValue + WNS
    end if
    if StopWalk then
	ParallelValue := ParallelValue + SW
    end if
    
    parallelput(ParallelValue)
    
end Parallel_Output

%% Regular Intersection %%
procedure Regular_Instersection

    const T := true
    const F := false

	% Parallel_Output (EWR, EWY, EWG, NSR, NSY, NSG, WEW, WNS, SW)

    loop
	
	Parallel_Output (F, F, T, T, F, F, F, F, F)    
	Interr_Delay(8000)
	Parallel_Output (F, T, F, T, F, F, F, F, F)
	Interr_Delay(1600)
	Parallel_Output (T, F, F, T, F, F, F, F, F)
	Interr_Delay(4000)
	Parallel_Output (T, F, F, F, F, T, F, F, F)
	Interr_Delay(8000)
	Parallel_Output (T, F, F, F, T, F, F, F, F)
	Interr_Delay(1600)
	Parallel_Output (T, F, F, T, F, F, F, F, F)
	Interr_Delay(4000)
	
	if hasch then
	    parallelput(0)
	    exit
	end if
	    
    end loop
    
end Regular_Instersection

%% Regular Intersection + Crosswalk %%
procedure Regular_Instersection_Crosswalk

    const T := true
    const F := false

	% Parallel_Output (EWR, EWY, EWG, NSR, NSY, NSG, WEW, WNS, SW)
	
    loop
	
	Parallel_Output (F, F, T, T, F, F, T, F, F)    
	Interr_Delay(8000)
	Parallel_Output (F, T, F, T, F, F, F, F, T)
	Interr_Delay(1600)
	Parallel_Output (T, F, F, T, F, F, F, F, T)
	Interr_Delay(4000)
	Parallel_Output (T, F, F, F, F, T, F, T, F)
	Interr_Delay(8000)
	Parallel_Output (T, F, F, F, T, F, F, F, T)
	Interr_Delay(1600)
	Parallel_Output (T, F, F, T, F, F, F, F, T)
	Interr_Delay(4000)
    
	if hasch then
	    parallelput(0)
	    exit
	end if
	
    end loop
    
end Regular_Instersection_Crosswalk

%% Regular Intersection + Crosswalk + Advance Green %%
procedure Regular_Instersection_Crosswalk_AG

    const T := true
    const F := false
    
	%Parallel_Output (EWR, EWY, EWG, NSR, NSY, NSG, WEW, WNS, SW)
	
    loop
	
	Parallel_Output (F, F, T, T, F, F, T, F, F)    
	Interr_Delay(8000)
	Parallel_Output (F, T, F, T, F, F, F, F, T)
	Interr_Delay(1600)
	Parallel_Output (T, F, F, T, F, F, F, F, T)
	Interr_Delay(4000)
    
	for countag : 1..4
	    Parallel_Output (T, F, F, F, F, T, F, F, T)
	    Interr_Delay(500)
	    Parallel_Output (T, F, F, F, F, F, F, F, T)
	    Interr_Delay(500)
	end for
    
	Parallel_Output (T, F, F, F, F, T, F, T, F)
	Interr_Delay(8000)
	Parallel_Output (T, F, F, F, T, F, F, F, T)
	Interr_Delay(1600)
	Parallel_Output (T, F, F, T, F, F, F, F, T)
	Interr_Delay(4000)
	for countag : 1..4
	    Parallel_Output (F, F, T, T, F, F, F, F, T)    
	    Interr_Delay(500)
	    Parallel_Output (F, F, F, T, F, F, F, F, T)    
	    Interr_Delay(500)
	end for
	
	if hasch then
	    parallelput(0)
	    exit
	end if
	
    end loop

end Regular_Instersection_Crosswalk_AG

%% Light Show 1 %%
procedure Light_Show_1

    const T := true
    const F := false
    
    var firstred, firstyellow, firstgreen : int := 0
    var allights : int
    
	% Parallel_Output (EWR, EWY, EWG, NSR, NSY, NSG, WEW, WNS, SW)

    loop
    
	allights := 0
    
	randint(firstred,0,1)
	firstred := firstred * 96
	firstred := firstred + 32
	parallelput(firstred)
	Interr_Delay(500)
	randint(firstyellow,0,1)
	firstyellow := firstyellow * 8
	firstyellow := firstyellow + 8
	parallelput(firstyellow + firstred)
	Interr_Delay(500)
	randint(firstgreen,0,1)
	firstgreen := firstgreen * 60
	firstgreen := firstgreen + 4
	parallelput(firstgreen + firstyellow + firstred)
	allights := firstred + firstyellow + firstgreen
	Interr_Delay(500)
	if firstred = 128 then
	    parallelput(allights + 32)
	    allights := allights + 32
	else
	    parallelput(allights + 128)
	    allights := allights + 128
	end if
	Interr_Delay(500)
	if firstyellow = 16 then
	    parallelput(allights + 8)
	    allights := allights + 8
	else
	    parallelput(allights + 16)
	    allights := allights + 16
	end if
	Interr_Delay(500)
	if firstgreen = 64 then
	    parallelput(allights + 4)
	    allights := allights + 4
	else
	    parallelput(allights + 64)
	    allights := allights + 64
	end if
	Interr_Delay(500)
	Parallel_Output (T, T, T, T, T, T, T, F, F)
	Interr_Delay(500)
	Parallel_Output (T, T, T, T, T, T, F, T, F)
	Interr_Delay(500)
	Parallel_Output (T, T, T, T, T, T, F, F, T)
	Interr_Delay(500)
	Parallel_Output (T, T, T, T, T, T, F, F, F)
	Interr_Delay(500)
	Parallel_Output (F, T, T, F, T, T, F, F, F)
	Interr_Delay(500)
	Parallel_Output (F, F, T, F, F, T, F, F, F)
	Interr_Delay(500)
	Parallel_Output (F, F, F, F, F, F, F, F, F)
	Interr_Delay(500)
	if hasch then
	    parallelput(0)
	    exit
	end if
    
    end loop
    
end Light_Show_1

%% Light Show 2 %%
procedure Light_Show_2

    const T := true
    const F := false

    var timels : nat2
    
	% Parallel_Output (EWR, EWY, EWG, NSR, NSY, NSG, WEW, WNS, SW)

    loop
	
	timels := 1000
    
	loop
    
	    Parallel_Output (T, F, F, F, F, F, F, F, F)    
	    Interr_Delay(timels)
	    Parallel_Output (F, T, F, F, F, F, F, F, F)
	    Interr_Delay(timels)
	    Parallel_Output (F, F, T, F, F, F, F, F, F)
	    Interr_Delay(timels)
	    Parallel_Output (F, F, F, F, F, F, F, T, F)
	    Interr_Delay(timels)
	    Parallel_Output (F, F, F, F, F, T, F, F, F)
	    Interr_Delay(timels)
	    Parallel_Output (F, F, F, F, T, F, F, F, F)
	    Interr_Delay(timels)
	    Parallel_Output (F, F, F, T, F, F, F, F, F)
	    Interr_Delay(timels)
	    Parallel_Output (F, F, F, F, F, F, T, F, F)
	    Interr_Delay(timels)
	    Parallel_Output (F, F, F, F, F, F, F, F, T)
	    Interr_Delay(timels)
    
	    timels := timels - 100

	    exit when timels = 100 or hasch
    
	end loop
	
	if hasch then
	    parallelput(0)
	    exit
	end if
	
	loop
    
	    Parallel_Output (T, F, F, F, F, F, F, F, F)    
	    Interr_Delay(timels)
	    Parallel_Output (F, T, F, F, F, F, F, F, F)
	    Interr_Delay(timels)
	    Parallel_Output (F, F, T, F, F, F, F, F, F)
	    Interr_Delay(timels)
	    Parallel_Output (F, F, F, F, F, F, F, T, F)
	    Interr_Delay(timels)
	    Parallel_Output (F, F, F, F, F, T, F, F, F)
	    Interr_Delay(timels)
	    Parallel_Output (F, F, F, F, T, F, F, F, F)
	    Interr_Delay(timels)
	    Parallel_Output (F, F, F, T, F, F, F, F, F)
	    Interr_Delay(timels)
	    Parallel_Output (F, F, F, F, F, F, T, F, F)
	    Interr_Delay(timels)
	    Parallel_Output (F, F, F, F, F, F, F, F, T)
	    Interr_Delay(timels)
    
	    timels := timels + 100
	    
	    exit when timels = 1000 or hasch
    
	end loop
    
	if hasch then
	    parallelput(0)
	    exit
	end if
    
    end loop
    
end Light_Show_2

%% Light Show 3 %%
procedure Light_Show_3

    const T := true
    const F := false

	% Parallel_Output (EWR, EWY, EWG, NSR, NSY, NSG, WEW, WNS, SW)

    loop
	
	Parallel_Output (T, F, F, F, F, F, F, F, F)    
	Interr_Delay(300)
	Parallel_Output (F, T, F, F, F, F, F, F, F)
	Interr_Delay(300)
	Parallel_Output (F, F, T, F, F, F, F, F, F)
	Interr_Delay(500)
	Parallel_Output (F, F, T, T, F, F, F, F, F)
	Interr_Delay(300)
	Parallel_Output (F, F, T, F, T, F, F, F, F)
	Interr_Delay(300)
	Parallel_Output (F, F, T, F, F, T, F, F, F)
	Interr_Delay(500)
	Parallel_Output (T, F, T, F, F, T, F, F, F)
	Interr_Delay(300)
	Parallel_Output (F, T, T, F, F, T, F, F, F)
	Interr_Delay(500)
	Parallel_Output (F, T, T, T, F, T, F, F, F)
	Interr_Delay(300)
	Parallel_Output (F, T, T, F, T, T, F, F, F)
	Interr_Delay(500)
	Parallel_Output (T, T, T, F, T, T, F, F, F)
	Interr_Delay(500)
	Parallel_Output (T, T, T, T, T, T, F, F, F)
	Interr_Delay(500)
	Parallel_Output (T, T, T, T, T, T, F, F, T)
	Interr_Delay(500)
	Parallel_Output (T, T, T, T, T, T, T, F, F)
	Interr_Delay(500)
	Parallel_Output (T, T, T, T, T, T, F, T, F)
	Interr_Delay(500)
	Parallel_Output (T, T, T, T, T, T, T, F, F)
	Interr_Delay(500)
	Parallel_Output (T, T, T, T, T, T, F, T, F)
	Interr_Delay(500)
	Parallel_Output (F, T, T, F, T, T, F, F, F)
	Interr_Delay(400)
	Parallel_Output (F, F, T, F, F, T, F, F, F)
	Interr_Delay(400)
	Parallel_Output (F, F, F, F, F, F, F, F, F)
	Interr_Delay(400)

	if hasch then
	    parallelput(0)
	    exit
	end if
    
    end loop
    
end Light_Show_3

%% Flush keys %%
procedure Key_Flush
var Trash : string (1)
    loop
	exit when not hasch
	getch(Trash)
    end loop
end Key_Flush

%% Reg. Intersect %%
procedure Reg_Intersect

    var UserChoiceReg : string (1)

    cls

    loop
	locate (5, 25)
	put "Stoplights - Reg. Intersect Menu"
	locate (7, 25)
	put "1. Reg. Intersection"
	locate (8, 25)
	put "2. Reg. Intersection + Crosswalk"
	locate (9, 25)
	put "3. Reg. Intersection + Crosswalk + Advance Green"
	locate (11, 25)
	put "4. Main menu"
	locate (13, 31)
	put "Enter choice - " ..

	getch (UserChoiceReg)
	case UserChoiceReg of
	    label "1" : Regular_Instersection
	    label "2" : Regular_Instersection_Crosswalk
	    label "3" : Regular_Instersection_Crosswalk_AG
	    label "4" : exit
	    label : put "unknown"
	end case
	Key_Flush

	delay (1000)
	cls

    end loop

end Reg_Intersect

%% Light shows %%
procedure Light_Show (var UserChoiceLig : string (1))

    cls

    loop
	locate (5, 28)
	put "Stoplights - Lighshows Menu"
	locate (7, 31)
	put "1. Lightshow 1"
	locate (8, 31)
	put "2. Lightshow 2"
	locate (9, 31)
	put "3. Lightshow 3"
	locate (11, 31)
	put "4. Main menu"
	locate (13, 31)
	put "Enter choice - " ..

	getch (UserChoiceLig)
	case UserChoiceLig of
	    label "1" : Light_Show_1
	    label "2" : Light_Show_2
	    label "3" : Light_Show_3
	    label "4" : exit
	    label : put "unknown"
	end case
	Key_Flush

	delay (1000)
	cls

    end loop

end Light_Show


%%% MAIN PROGRAM %%%
var UserChoice : string (1)
var ChoiceLig : string (1)

loop

    locate (5, 30)
    put "Stoplights - Main Menu"
    locate (7, 31)
    put "1. Reg. Intersection"
    locate (8, 31)
    put "2. Light shows"
    locate (10, 31)
    put "3. Exit"
    locate (12, 33)
    put "Enter choice - " ..

    getch (UserChoice)
    case UserChoice of
	label "1" : Reg_Intersect
	label "2" : Light_Show (ChoiceLig)
	label "3" : exit
	label : put "unknown"
    end case
    Key_Flush
    
    delay (500)
    cls
end loop

cls
locate (11, 33)
put "Exiting program"
locate (13, 36)
put "Thank you"



