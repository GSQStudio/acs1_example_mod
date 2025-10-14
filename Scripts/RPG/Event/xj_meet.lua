local eTest = GMod.RPG.R.Event:Register("xj_meettrap")



function eTest:EnterTrap(eventp, whohappen, npc, p3)
	CS.Wnd_Dlg.Instance:Show("Example_meet", npc, ThingMgr:FindThingByID(10005019), true, "Example");     
end

