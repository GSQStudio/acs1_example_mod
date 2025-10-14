local Windows = GameMain:GetMod("Windows");--先注册一个新的MOD模块
local tbWindow = Windows:CreateWindow("SampleWindow");
function tbWindow:OnInit()
	self.window.contentPane =  UIPackage.CreateObject("Sample", "SampleWindow");--载入UI包里的窗口
	self.window.closeButton = self:GetChild("frame"):GetChild("n5");
	local bnt1 = self:GetChild("bnt_1");
	bnt1.title = "RPG测试";
	bnt1.onClick:Add(OnClickRPG);
	local bnt2 = self:GetChild("bnt_2");
	bnt2.onClick:Add(OnClick);
	local bnt3 = self:GetChild("bnt_3");
	bnt3.onClick:Add(OnClick);
	bnt3.icon = "Spr/Object/object_test.png";
	
	local loader = self:GetChild("loader");
	loader.url = "Spr/Building/building_test.png";
	
	local label = self:GetChild("label_1");
	label.text = "这也是一个[color=#FF0000]Label[/color]";
	
	local list = self:GetChild("list");
	for i=1,20 do
		local item = list:AddItemFromPool();
		item.icon = "thing://2,Item_SmallBell,Item_IronBlock";		
		item.title = "物品"..i;
		item.tooltips = "物品"..i;
	end
	list.onClickItem:Add(ClickSelectItem);
	
	self.progressbar = self:GetChild("progressbar_1");
end

function ClickSelectItem(context)
	print('you click',context)
	world:ShowMsgBox(context.data.title.." Clicked","onClick");
end

function OnClick(context)
	print('you click',context)
	world:ShowMsgBox(context.sender.name.." Clicked","onClick");
end
function OnClickRPG(context)
	local npcs = World.map.Things:GetPlayerActiveNpcs()
	RPGMapMgr:EnterRPGWorld({npcs[0]}, "Example_XJ");
end


function tbWindow:OnShowUpdate()
	
end

function tbWindow:OnShown()

end

function tbWindow:OnUpdate(dt)
	local v = self.progressbar.value + 20 * dt;	
	if v > 100 then
		v = 0;
	end
	self.progressbar.value = v;
end

function tbWindow:OnHide()

end

