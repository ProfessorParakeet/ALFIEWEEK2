function start (song)

end

function update (elapsed)

end

function beatHit (beat)

    if beat == 160 then 

	strumLine2Visible = false
    end
    if beat == 191 then 


	strumLine2Visible = true

	strumLine1Visible = false


    end
    if beat == 224 then

	strumLine1Visible = true
	end


end