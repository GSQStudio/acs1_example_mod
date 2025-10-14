local tbExample = GameMain:NewMod("Example");--先注册一个新的MOD模块

function tbExample:OnInit()
	print("Example init");
end

function tbExample:OnEnter()
	print("Example enter");
	local itemdef = ThingMgr:GetDef(g_emThingType.Item,"Item_ModTestItem");--获取物品的def数据
	print(itemdef.ThingName);
	--窗口测试
	GameMain:GetMod("Windows"):GetWindow("SampleWindow"):Show();
end

function tbExample:OnSetHotKey()
	print("Example OnSetHotKey");
	
	--ID为快捷键注册时的编码，编码需要是唯一的，不可为空
	--Name为快捷键的名称，会显示到快捷键面板上，需要将本文件转换为UTF-8才可使用中文
	--Type为快捷键所属类别，快捷键会根据类别自动分类，不可为空
	--InitialKey1为快捷键的第一组按键，使用"+"进行连接组合键位，键位请阅读快捷键列表找到所需要的键盘编码，可以为空
	--InitialKey2为快捷键的第二组按键，使用"+"进行连接组合键位，键位请阅读快捷键列表找到所需要的键盘编码，可以为空
	--快捷键有区分大小写，请按快捷键列表的键盘编码输入
	local tbHotKey = { {ID = "Test" , Name = "Mod测试按键" , Type = "Mod", InitialKey1 = "LeftShift+A" , InitialKey2 = "Equals" } };
	
	return tbHotKey;
end

function tbExample:OnHotKey(ID,state)
     
	--ID为快捷键注册时的编码，系统识别快捷键的唯一标识
	--state为快捷键当前操作状态，按下"down"，持续"stay"，离开"up"
	if ID == "Test" and state == "down" then 
       print("=========== Test is down ============="); --在ID和state都对应的情况下，会执行此部分逻辑
    end	   
	
end

function tbExample:OnStep(dt)--请谨慎处理step的逻辑，可能会影响游戏效率
	--print("Example Step"..dt);
end

function tbExample:OnLeave()
	print("Example Leave");
end

function tbExample:OnSave()--系统会将返回的table存档 table应该是纯粹的KV
	print("Example OnSave");
	local tbSave = {a = 1,b = 2,{c = "aa"}};
	return tbSave;
end

function tbExample:OnLoad(tbLoad)--读档时会将存档的table回调到这里
	print("Example OnLoad");
	tbLoad = tbLoad or {a = 0, b = 0};
	print(tbLoad.b);
end

function tbExample:Test(a,b)
	return a+b;
end

function tbExample:NeedSyncData()--切换地图的时候是否会同步数据，请谨慎使用
	 return true;
end

function tbExample:OnSyncLoad(tbData)	--切换地图的时候载入的数据
	print("tbExample OnSyncLoad");
	self.syncdata = tbData;
end

function tbExample:OnSyncSave()	--切换地图时传输的数据
	print("tbExample OnSyncSave");
	return {a=1,b=2};
end

function tbExample:OnAfterLoad()	--读档且所有系统准备完毕后，切换地图后也会调用

end

----------
--访问方式演示 可以直接在Story中调用模块
local tbTest = GameMain:GetMod("Example");
if tbTest ~= nil then
	print(tbTest:Test(1,3));
end

