local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'dialogue-2');
		dofile('scriptstrum.lua');
	end
end


local allowEndShit = false

function onEndSong()
	function onNextDialogue(count)
		if count == 25 then
			playMusic('none', 1, true);
		end
	end

 if not allowEndShit and isStoryMode and not seenCutscene then
  setProperty('inCutscene', true);
  startDialogue('dialogue2', 'dialogue-2'); 
  allowEndShit = true;
  return Function_Stop;
 end

 return Function_Continue;
end