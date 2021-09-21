local background = nil

local poggers = false
local swaying = false
local move = false

local swayingForce = 3;
local waitForBeat = false
local waitForTween = false

function start(song) 
    hudX = getHuxX()
    hudY = getHudY()
    
end

function setDefault(id)
	move = true
	swayingForce = 0
	_G['defaultStrum'..id..'X'] = getActorX(id)
	print('angle 0')
	setActorAngle(0,id)
end

function fadeOutAndGo() 
	move = false
	for i = 4, 7 do
		tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 275,getActorAngle(i) + 360, 0.6, 'setDefault')
	end
end

function fadeInAndGo()
	move = false
	for i = 4, 7 do
		tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 0,getActorAngle(i) - 360, 0.6, 'setDefault')
	end
end

function resetTween()
	waitForTween = false
end 

function update (elapsed) 
	-- sway
	if swaying and move then
		--print(currentBeat)
		local currentBeat = (swayingForce/1000)*(bpm/150)
		if curBeat % 4 == 0 and not waitForBeat then
			waitForBeat = true
			waitForTween = true
			poggers = not poggers
			if poggers then
                                 tweenPosXAngle(0, getActorX(0) - 120 + 64 * math.sin(currentBeat * math.pi) ,360, 0.2, 'resetTween')
				 tweenPosXAngle(1, getActorX(1) - 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				 tweenPosXAngle(2, getActorX(2) + 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				 tweenPosXAngle(3, getActorX(3) + 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
	
				 tweenPosXAngle(4, getActorX(4) - 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
			     	 tweenPosXAngle(5, getActorX(5) - 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				 tweenPosXAngle(6, getActorX(6) + 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				 tweenPosXAngle(7, getActorX(7) + 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)



			else
                                tweenPosXAngle(0, getActorX(0) + 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2, 'resetTween')
				tweenPosXAngle(1, getActorX(1) + 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(2, getActorX(2) - 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(3, getActorX(3) - 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
	
				tweenPosXAngle(4, getActorX(4) + 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(5, getActorX(5) + 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(6, getActorX(6) - 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(7, getActorX(7) - 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)


			end
		elseif not waitForTween then
			swayingForce = swayingForce + 7;
			for i = 0, 7  do
				setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin(currentBeat * math.pi),i)
			end
		end
	end
end

function beatHit (beat)

    if beat == 2 then
    background = makeSprite('black','black',true)
    setActorAlpha(0,background)
    setActorX(600,background)
    setActorY(600,background)
    setActorScale(10,background) 
    strumLine1Visible = false
    for i = 4, 7 do 
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 280, getActorAngle(i), 1.50, 'setDefaultX')
        end
    end
  
    
    if beat == 240 then
    fadeOutAndGo()
    swaying = true
    end

    if beat == 279 then
    fadeInAndGo()
    swaying = false
    end
  
    if beat == 524 then
    showOnlyStrums = true
    end
end

function stepHit (step)

end

function keyPressed (key)

end