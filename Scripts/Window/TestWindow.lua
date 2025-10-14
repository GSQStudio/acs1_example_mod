local SimpleWindow = GameMain:GetMod("SimpleWindow");--先注册一个新的MOD模块
local tbWindow = SimpleWindow:CreateWindow("TestWindow");
function tbWindow:OnInit()
	self.window.contentPane =  UIPackage.CreateObject("TestUI", "NewWindow");
	self:SetTitle("窗口测试")
	self:SetSize(500,500)
	self:AddButton("Bnt1","Test",100,50);
	self:AddButton("Bnt2","Test2",100,100);
	self:SetHtml([=[
		<a href='xxx'>link text</a><br>
		<input type='button' value='标题' name='BntHtml'/><br>
		<p align='center'><img src='Spr/Building/building_test.png'/></p>
	]=]);
end

function tbWindow:OnShowUpdate()
	
end

function tbWindow:OnShown()

end

function tbWindow:OnUpdate()

end

function tbWindow:OnHide()

end

-- 事件类型 "onClick","onKeyDown","onClickLink","onRightClick","onClickLink"
function tbWindow:OnObjectEvent(t,obj,context)
	print(t,obj,obj.name)
	if t == "onClick" then
		world:ShowMsgBox(obj.name.." Clicked","onClick");
		if obj.name == "Bnt1" then
			
		end
	end
	if t == "onClickLink" then
		world:ShowMsgBox(context.data.." Clicked","onClickLink");
	end
end