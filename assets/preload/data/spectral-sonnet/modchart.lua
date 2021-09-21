function start (song)

end

function update (elapsed)

end

function beatHit (beat)

 if beat == 288 then 
        for i = 0, 3 do 
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 320, getActorAngle(i), 1.50, 'setDefaultX')
        end
	for i = 4, 7 do 
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 320, getActorAngle(i), 1.50, 'setDefaultX')
        end
    end
    if beat == 319 then 
        for i = 0, 3 do 
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 35, getActorAngle(i), 0.42, 'setDefaultX')
        end
	for i = 4, 7 do 
            tweenPosXAngle(i, _G['defaultStrum'..i..'X'] + 110, getActorAngle(i), 0.42, 'setDefaultX')
        end
    end
end

function stepHit (step)

end

function keyPressed (key)

end