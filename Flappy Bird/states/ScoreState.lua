--[[
    ScoreState Class
    Author: Franklin Ader
    adereinstein1@gmail.com

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

bronzeMedal = love.graphics.newImage('images/bronzeMedal.png')
silverMedal = love.graphics.newImage('images/silverMedal.png')
goldMedal = love.graphics.newImage('images/goldMedal.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()

    love.graphics.setFont(flappyFont)
    
    if (self.score >= 20) then
        love.graphics.draw(goldMedal, 30, 15)
    elseif (self.score >= 10) then
        love.graphics.draw(silverMedal, 30, 15)
    elseif (self.score >= 5) then
        love.graphics.draw(bronzeMedal, 30, 15)
  
    end

    love.graphics.print('AWARD ', 10, 10)

    love.graphics.printf('Game Over', 0, 64, VIRTUAL_WIDTH, 'center')
    
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end