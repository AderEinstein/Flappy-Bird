--[[
    PauseState Class
    Author: Franklin Ader
    adereinstein1@gmail.com

    State used to display the game status when the game is paused from the PlayState
]]

PauseState = Class{__includes = BaseState}

local playButton = love.graphics.newImage('images/playB.png')

function PauseState: init()
    self.score = 0
    self.pipePairs = {}
    self.bird = nil
end
function PauseState: enter(params)
    self.score = params.currentScore
    self.pipePairs = params.currentPipePairs
    self.bird = params.currentBird
    self.timer = params.currentTimer
    self.nextTimer = params.currentNextTimer
    
    -- scrolling = false  -- Optional to add this line since exiting PlayPhase always sets it to False
end

function PauseState: update(dt)
    if love.keyboard.wasPressed('p') then

        sounds['music']:resume() -- Resume Sound when P is pressed in PauseState mode
        sounds['pause']:play()  -- Play Pause Sound Effect
        gStateMachine:change('play', {
            currentScore = self.score,
            currentPipePairs = self.pipePairs,
            currentBird = self.bird,
            currentTimer = self.timer,
            currentNextTimer = self.nextTimer,
        })
    end
end

function PauseState: render()
    for k, pipePair in pairs(self.pipePairs) do
        pipePair:render()
    end

    self.bird:render()

    love.graphics.draw(playButton, VIRTUAL_WIDTH/2 - 55, VIRTUAL_HEIGHT/2 - 55)

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Your Current Score: ' .. tostring(self.score), 0, 50, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press P to Resume', 0, 200, VIRTUAL_WIDTH, 'center')
    
end

