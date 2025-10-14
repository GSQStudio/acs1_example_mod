local eventbase = GMod.RPG.R.Event.__worldpartbase

local eTest = GMod.RPG.R.Event:Register("xld_jiguan")

local moveSpeed = 2;

function eTest:NpcEnterWorkSpace(eventp, whohappen, npc, p3)
	if npc.IsSelectInRPG == false then
		return;
	end
	npc.LockStep = true;
	npc:PlayAnimation("Idle");
	print(whohappen);
	local tbdata = GMod.RPGMAP:GetIdInfo(whohappen.ID, true);
	tbdata.jgMoving = true;
	tbdata.jgLockNpc = npc.ID;
	tbdata.jgNextIndex = 0;
	
	
end


function eTest:OnStep(eventp, whohappen, dt, p3)	
	 local tbdata = GMod.RPGMAP:GetIdInfo(whohappen.ID, false);
	 if tbdata == nil or tbdata.jgMoving == false then
		return;
	 end
	 local npc = ThingMgr:FindThingByID(tbdata.jgLockNpc);
	 if npc == nil then
		tbdata.jgMoving = false;
		return;
	 end
	 local pathname = whohappen.rpgIdentity.nick;
	 local path = GMod.RPGMAP:GetPath(pathname);
	 local nextp = GridMgr:Grid2Pos(path[tbdata.jgNextIndex]);
	 local p =  Vector3.MoveTowards(npc.Pos, nextp, moveSpeed * dt);
	 npc:SetPostion(p);
	 whohappen:SetPostion(p);
	 if Vector3.Distance(p, nextp) <= 0.1 then
		if tbdata.jgNextIndex >= path.Count - 1 then
			tbdata.jgMoving = false;
			npc.LockStep = false;
			whohappen:SetPostion(path[0]);

			if (npc.IsMoving) then
				npc:PlayAnimation("Run")
				local curJob = npc.JobEngine.CurJob
				local curtoil = curJob and curJob:GetCurToil()
				if (curtoil ~= nil and curtoil.FindPathFlag ~= nil) then
					curtoil:FindPathFlag()
				end
			end
			return;
		else
			tbdata.jgNextIndex = tbdata.jgNextIndex + 1;
		end
	 end
end


