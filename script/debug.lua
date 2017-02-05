
addHotkey('c', true, false, false, 'toggleClsnDraw()')
addHotkey('d', true, false, false, 'toggleDebugDraw()')
addHotkey('s', true, false, false, 'changeSpeed()')
addHotkey('l', true, false, false, 'toggleStatusDraw()')
addHotkey('1', true, false, false, 'toggleAI(1)')
addHotkey('2', true, false, false, 'toggleAI(2)')
addHotkey('3', true, false, false, 'toggleAI(3)')
addHotkey('4', true, false, false, 'toggleAI(4)')
addHotkey('F1', false, false, false, 'kill(2);kill(4)')
addHotkey('F1', true, false, false, 'kill(1);kill(3)')
addHotkey('F2', false, false, false, 'kill(1,1);kill(2,1);kill(3,1);kill(4,1)')
addHotkey('F2', true, false, false, 'kill(1,1);kill(3,1)')
addHotkey('F2', false, false, true, 'kill(2,1);kill(4,1)')
addHotkey('F3', false, false, false, 'powMax(1);powMax(2)')
addHotkey('F4', false, false, false, 'roundReset()')
addHotkey('F4', false, false, true, 'reload()')
addHotkey('F5', false, false, false, 'setTime(0)')
addHotkey(
  'SPACE', false, false, false,
  'full(1);full(2);full(3);full(4);setTime(getRoundTime())')
addHotkey('PAUSE', false, false, false, 'togglePause()')
addHotkey('SCROLLLOCK', false, false, false, 'step()')
addHotkey('i', true, false, false, 'stand(1);stand(2);stand(3);stand(4)')


speed = 1.0

function changeSpeed()
  if speed >= 4 then
    speed = 0.25
  else
    speed = speed*2.0
  end
  setAccel(speed)
end

function toggleAI(p)
  local oldid = id()
  if player(p) then
    if ailevel() > 0 then
      setAILevel(0)
    else
      setAILevel(8)
    end
    playerid(oldid)
  end
end

function kill(p, ...)
  local oldid = id()
  if player(p) then
    local n = ...
    if not n then n = 0 end
    setLife(n)
    playerid(oldid)
  end
end

function powMax(p)
  local oldid = id()
  if player(p) then
    setPower(powermax())
    playerid(oldid)
  end
end

function full(p)
  local oldid = id()
  if player(p) then
    setLife(lifemax())
    setPower(powermax())
    playerid(oldid)
  end
end

function stand(p)
  local oldid = id()
  if player(p) then
    selfState(0)
    playerid(oldid)
  end
end

function info()
  puts(
    string.format(
      'name:%s state:%d>%d %s move:%s physics:%s',
      name(), prevstateno(), stateno(), statetype(), movetype(), physics()))
  puts(
    string.format(
      'anim:%d %d elem:%d %d pos:%.3f,%.3f vel:%.3f,%.3f',
      anim(), animtime(), animelemno(0), animelemtime(animelemno(0)),
      posX(), posY(), velX(), velY()))
end

function status(p)
  local oldid = id()
  if not player(p) then return false end
  ret =
    string.format(
      'STA:%s%s%s%6d(%d) ANI:%6d(%d)%2d LIF:%5d POW:%5d TIM:%d',
      statetype(), movetype(), physics(), stateno(), stateOwner(),
      anim(), animOwner(), animelemno(0), life(), power(), time())
  playerid(oldid)
  return ret;
end

