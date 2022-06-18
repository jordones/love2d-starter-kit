require 'src/state-machine/base-state'

StateMachine = Class{}

function StateMachine:init(states)
  self.states = states
  self.current = BaseState()
end

function StateMachine:update(dt) end

function StateMachine:render() end