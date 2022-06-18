StateMachine = Class{}

function StateMachine:init(states)
  self.states = states
  self.current = BaseState()
end

function StateMachine:change(state, props)
  assert(self.states[state])
  self.current:exit()
  self.current = self.states[state]()
  self.current:enter(props)
end

function StateMachine:update(dt)
  self.current:update(dt)
end

function StateMachine:render()
  self.current:render()
end