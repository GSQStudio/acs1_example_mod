local map = GMod.RPG.R.Map:Register("xianlingdao")
map.LeaveSave = false

function map:OnStepEnter(tbStep)
	--print(tbStep.Name.." Enter")
	CS.MapCamera.Instance:LockOSize(5);
end

function map:OnStepStep(tbStep,dt)
	
end

function map:OnStepLeave(tbStep)
	--print(tbStep.Name.." Leave")
end

function  map:OpenRoad()
print("OpenRoad")
	local thingids, things = GMod.RPGMAP:FindObjsInGroup("DoorWall", nil)
	for _,thing in pairs(things) do
		local k = thing.Key;
		ThingMgr:RemoveThing(thing);
		local p = ThingMgr:AddPlantThing(k, "RoadLotus", nil);
		Map:OpenFog(k,1);		
		--p.
	end
	self:SetTempData("RoadOpen",1);
end

function map:OnInit()
	self:AddStep({Duration = -1, Enter = self.OnStepEnter, Step = self.OnStepStep, Leave = self.OnStepLeave});
	
	self:AddMapSkill("skill1")
end


function map:OnFinish()
	print("Mission Finish")
end