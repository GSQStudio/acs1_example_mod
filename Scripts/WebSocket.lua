local tbTable = GameMain:GetMod("TestWebSocket");

function tbTable:OnEnter()		
	--self:Start();
end

function tbTable:Start()
	self.ws = CS.WebSocketSharp.WebSocket("ws://localhost:8080/socket");
	self.ws:OnMessage("+", self.OnMessage);
	self.ws:OnOpen("+", self.OnOpen);
	self.ws:OnClose("+", self.OnClose);
	self.ws:OnError("+", self.OnError);
	self.ws:Connect ();	
	self.ws:SendString ("Hello Server");
	--self.ws:SendByte (Byte);
	--self.ws:SendFileInfo (FileInfo);
	--self.ws:SendStream (Stream,int);
end


function tbTable.OnMessage(obj, e)
	print("OnMessage:"..e.Data);
end

function tbTable.OnOpen()
	print("OnOpen");
end

function tbTable.OnClose(obj, e)
	print("OnClose");
end

function tbTable.OnError(obj, e)
	print("OnError:"..e.Message);
end

function tbTable:OnLeave()
	if self.ws == nil then
		return;
	end
	self.ws:OnMessage("-", self.OnMessage);
	self.ws:OnOpen("-", self.OnOpen);
	self.ws:OnClose("-", self.OnClose);
	self.ws:OnError("-", self.OnError);
	self.ws:Close();
end
		
	 