local map = GMod.RPG.R.Map:Register("example_1")
map.LeaveSave = false

function map:OnInit()
	self:AddStep({Duration = 1, Enter = self.InitializationEnter, Step = self.InitializationStep, Leave = self.InitializationLeave});
	self:AddStep({Duration = 10});
	self:AddStep({Duration = -1, Enter = self.FirstFightEnter, Step = self.FirstFightStep, Leave = self.FirstFightLeave});
	self:AddStep({Duration = 5});
	self:AddStep({Duration = -1, Enter = self.SecFightEnter, Step = self.SecFightStep, Leave = self.SecFightLeave});
end


function map:InitializationEnter()
end

function map:InitializationStep(tbStep,dt)
end

function map:InitializationLeave()
end

function map:FirstFightEnter()
	local npcs = self:CallEnemies("Human", 1, CS.XiaWorld.g_emNpcRichLable.Normal, 5, "testtrapgroupA", function(npc) npc.RPGAttackWait = 5 end)
end

function map:FirstFightStep()
	if (self:CheckGroupHasAlive("testtrapgroupA")) then
		return
	end
	self:FinishCurStep()
end

function map:FirstFightLeave()
	print("FirstFightLeave")
end

function map:SecFightEnter()
	print("SecFightEnter")
	local npcs = self:CallEnemies("Human", 13, CS.XiaWorld.g_emNpcRichLable.Normal, 5, "testtrapgroup", function(npc) npc:SetMovePath({1, 30, 300, 130})  end)
end

function map:SecFightStep()
	if (self:CheckGroupHasAlive("testtrapgroup")) then
		return
	end
	self:FinishCurStep()
end

function map:SecFightLeave()
	print("SecFightLeave")
end

function map:OnFinish()
	print("Mission Finish")
end