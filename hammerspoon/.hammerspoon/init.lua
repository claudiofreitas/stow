-- Use Cmd+\ to show 1Password everywhere except Visual Studio Code
--function activate_1password()
--  local client = hs.application.frontmostApplication()
--  if client:title() == 'Code' then
--    hs.eventtap.keyStroke({"cmd"}, "f11")
--  else
--    hs.eventtap.keyStroke({"cmd"}, "f12")
--  end
--end
--hs.hotkey.bind({"cmd"}, "\\", activate_1password)



--caffeine = hs.menubar.new()
--function setCaffeineDisplay(state)
--  if state then
--    caffeine:setTitle("AWAKE")
--  else
--    caffeine:setTitle("SLEEPY")
--  end
--end
--
--function caffeineClicked()
--  setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
--end
--
--if caffeine then
--  caffeine:setClickCallback(caffeineClicked)
--  setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
--end


-- https://www.hammerspoon.org/docs/index.html
-- https://www.hammerspoon.org/docs/hs.screen.html
local hs = hs

---------------------------------------------------------------------
local macScreen = hs.screen.find('37D8832A-2D66-02CA-B9F7-8F30A301B230')
local wideScreen  = hs.screen.find('27CD3411-A050-25B2-0857-D6964E3302DB')
---------------------------------------------------------------------



for _, v in pairs(hs.screen.allScreens()) do
   print(v:getUUID())
end

print(wideScreen)






-- Mirror Screen Menu -----------------------------------------------
local isMirrored = false
local mirrorScreenMenu = hs.menubar.new()

local function toggleScreenMirror()
  if isMirrored then
    isMirrored = not macScreen:mirrorStop()
    mirrorScreenMenu:setTitle("🪞🖥")
  else
    isMirrored = macScreen:mirrorOf(wideScreen)
    mirrorScreenMenu:setTitle("!🪞🖥")
  end
  --print('isMirrored:', isMirrored)
end

if mirrorScreenMenu then
  mirrorScreenMenu:setTitle("🪞🖥")
  mirrorScreenMenu:setClickCallback(toggleScreenMirror)
  --mirrorScreenMenu:setClickCallback(changeScreenResolution)
end
---------------------------------------------------------------------




-- 2304 x 960 Screen Menu -------------------------------------------------
local isOriginalResolution = true
local switch960pMenu = hs.menubar.new()
local function toggleScreenResolution()
  if isOriginalResolution then
    -- set 960
    --local worked = wideScreen:setMode(2304, 960, 2, 60, 7)
    --print('worked:', worked)
    isOriginalResolution = false
  else
    -- set original
    wideScreen:setMode(3840, 1600, 1, 60, 7)
    isOriginalResolution = true
  end
end

if switch960pMenu then
  switch960pMenu:setTitle("🎮")
  switch960pMenu:setClickCallback(toggleScreenResolution)
end
---------------------------------------------------------------------

--print('macScreen: ', macScreen)
--print('wideScreen: ', wideScreen)

--macScreen:mirrorOf(wideScreen)
--macScreen:mirrorStop()

--print('macScreen: ', macScreen)
--print('wideScreen: ', wideScreen)
