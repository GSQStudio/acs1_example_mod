--演示神通
local tbTable = GameMain:GetMod("MagicHelper");--获取神通模块 这里不要动
local tbMagic = tbTable:GetMagic("Example_Magic");--创建一个新的神通class

--注意-
--神通脚本运行的时候有两个固定变量
--self.bind 执行神通的npcObj
--self.magic 当前神通的数据，也就是定义在xml里的数据

function tbMagic:Init()
end

--神通是否可用
function tbMagic:EnableCheck(npc)
	return true;
end


--目标合法检测 首先会通过magic的SelectTarget过滤，然后再通过这里过滤
--k位置 t对象
function tbMagic:TargetCheck(k, t)	
	return true;
end

--开始施展神通
--IDs是一个List<int> 如果目标是非对象，里面的值就是地点key，如果目标是物体，值就是对象ID，否则为nil
--IsThing 目标类型是否为物体
function tbMagic:MagicEnter(IDs, IsThing)
	self.curIndex = 0;
	self.jump = 0;
	self.grids = IDs;
end

--神通施展过程中，需要返回值
--返回值  0继续 1成功并结束 -1失败并结束
function tbMagic:MagicStep(dt, duration)	
	self:SetProgress(self.curIndex/self.grids.Count);--设置施展进度 主要用于UI显示
	self.jump = self.jump + dt;	
	if self.jump >= 0.1 then
		local key = self.grids[self.curIndex];
		if self:CreateMine(key) then
			self.jump = 0;
		end		
		self.curIndex = self.curIndex + 1;	
		if self.curIndex >= self.grids.Count then
			return 1;
		end		
	end
	return 0;
end

--施展完成/失败 success是否成功
function tbMagic:MagicLeave(success)
	if success == true then
		world:ShowStoryBox("成功施展了演示神通", "演示神通",{"我懂了","我没懂"},
			function(s)
				if s == 0 then
					return nil;
				end
				return "再看看吧";				
			end
		);
	end
	self.grids = nil;
end

--存档 如果没有返回空 有就返回Table(KV)
function tbMagic:OnGetSaveData()
	return {
	Index = self.curIndex,
	Jump = self.jump
	};
end

--读档 tbData是存档数据 IDs和IsThing同进入
function tbMagic:OnLoadData(tbData,IDs, IsThing)	
	self.grids = IDs;
	self.curIndex = tbData.Index or 0;
	self.jump = tbData.Jump or 0;	
end

function tbMagic:CreateMine(key)
	if Map:CheckGridWalkAble(key, false) == false then
		return false;
	end
	local g_emPlantKind = CS.XiaWorld.g_emPlantKind;
	local Things = Map.Things;
	local oldbuilding = Things:GetThingAtGrid(key, 4);
	if oldbuilding == nil then
		local oldplant = Things:GetThingAtGrid(key, 3);
		if oldplant ~= nil then
			if oldplant.def.Plant.Kind ~= g_emPlantKind.Mine then
				ThingMgr:RemoveThing(oldplant, false, false);
			else
				return false;
			end
		end
		local olditem = Things:GetThingAtGrid(key, 2);
		ThingMgr:AddPlantThing(key, "RockBrown",nil); 
		world:PlayEffect(34, key, 5);
		if olditem ~= nil then
			olditem:PickUp();
			Map:DropItem(olditem, key);
		end
		return true;
	end		
	return false;
end
