-- Title: TouchAndReact
-- Name: Tristan Royer
-- Course: ICS2O/3C
-- This program displays a button that when I click on it
-- turns another colour and displays text and another object.

-- set background colour
display.setDefault ("background", 153/255, 204/255, 255/255)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png",198 , 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true 

-- create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png",198,96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked!",0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false

--create the Check mark, set its position and make it invisible
local checkMark = display.newImageRect("Images/checkmark.png",150,200)
checkMark.x = display.contentWidth/3
checkMark.y = display.contentHeight/2
checkMark.isVisible = false

-- locals for sound
local correctSound = audio.loadSound("Sounds/Correct Answer Sound Effect.mp3")
local correctSoundChannel

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear 
-- with the red button, and make the blue button disappear
local function BlueButtonListener(touch)
    if (touch.phase == "began") then
    	blueButton.isVisible = false
    	redButton.isVisible = true
    	textObject.isVisible = true
    	checkMark.isVisible = true
        correctSoundChannel = audio.play(correctSound)
    end

    if (touch.phase == "ended") then
        blueButton.isVisible = true
        redButton.isVisible = false
        textObject.isVisible = false
        checkMark.isVisible = false
    end
end



-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear 
-- with the red button, and make the blue button disappear
local function RedButtonListener(touch)
    if (touch.phase == "began") then
    	blueButton.isVisible = true
    	checkMark.isVisible = false
    	redButton.isVisible = false
    	textObject.isVisible = false
    end

    if (touch.phase == "ended") then
        blueButton.isVisible = false
        redButton.isVisible = true
        textObject.isVisible = true
        checkMark.isVisible = true
        correctAnswer = true
        
    end
     
end

 


-- add the respective listeners to each object
blueButton:addEventListener("touch",BlueButtonListener)

redButton:addEventListener("touch",RedButtonListener)


