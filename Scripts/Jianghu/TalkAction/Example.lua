local tbTable = GameMain:GetMod("JianghuMgr");
local tbTalkAction = tbTable:GetTalkAction("Mod_Example");


--类会复用，如果有局部变量，记得在init里初始化
function tbTalkAction:Init()	
end

function tbTalkAction:GetName(player,target)
	return "演示";
end

function tbTalkAction:GetDesc(player,target)
	return "演示功能";
end


--按钮什么时候可见
function tbTalkAction:CheckActive(player,target)
	return true;
end

--按钮什么时候可用
function tbTalkAction:CheckEnable(player,target)	
	local JHSeed = target.JiangHuSeed;
	local knowdata = JianghuMgr:GetKnowNpcData(JHSeed);
	if knowdata == nil or knowdata.favour < 5 then--好感大于5时可用
		return false;
	end
	return true;
end

function tbTalkAction:Action(player,target)
	self:SetTxt("演示：演示演示演示演示\n接下来会演示回调和自定义选项。", self.TestFinished);
end

function tbTalkAction.TestFinished(player,target)
	print(111)
	tbTalkAction:AddTempActions({
		[1] = {"自定义选项","选项1介绍"},
		[2] = {"选择物品","这个选项演示选择物品"},
		[3] = {"返回", "返回很有必要"},
	},
	function(p, t, index)
		print("选择了选项"..index);
		tbTalkAction:SetTxt("选择了选项"..index, 
		function()
			if index == 3 then
				tbTalkAction:ExitTempAction();
			end		
			if index == 2 then
				tbTalkAction:SelectItem(
				function(p, t ,item)
					if item ~= nil then
						tbTalkAction:SetTxt("选择了:"..item:GetName());
					end
				end);
			end
		end);
		
	end);
end


