
ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "1560.frm",
        Func    = "Jin_WaitFunc",

    },

	 -- 달리기 
    {
        ID      = "RUN",
        Motion  = "1570.frm",
        Func    = "Jin_RunFunc",        
    },

    -- 선풍각 
    {
        ID      = "ATTACK01",
        Motion  = "1617.frm",
        Func    = "Jin_Attack01Func",
    },    
	
	 -- 버닝모드 준비 
	{
        ID      = "STARTCHARGE",
        Motion  = "Jin_ChargeStart.frm",
        Func    = "Jin_StartChargeFunc",
    },
	
	-- 기모으기 
    {
        ID      = "CHARGE",
        Motion  = "Jin_Charge.frm",
        Func    = "Jin_ChargeFunc",
    },
	
	 -- 버닝모드 체인지
    {
        ID      = "BURN",
        Motion  = "1558.frm",
        Func    = "Jin_BurnFunc",
    },
	
    {
        ID      = "SPECIAL3_1",
        Motion  = "1580.frm",
        Func    = "Jin_Action1580Func",
    },
	{
        ID      = "SPECIAL3_2",
        Motion  = "1604.frm",
        Func    = "Jin_Action1604Func",
    },
	{
        ID      = "SPECIAL3_3",
        Motion  = "1605.frm",
        Func    = "Jin_Action1605Func",
    },
}


-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitJin( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )      
    pMonster:SetInvincible( true )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Jin_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
		
    end
end


function Jin_StartChargeFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
	if( iFrame == 0 ) then 
		pMonster:PlaySound(1160)
	elseif( iFrame == 10 ) then
		pMonster:PlaySound(1192)
		pMonster:AddTraceParticleOffset( "Jin1_Gage_01", 0, 0.08 )
    end
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "CHARGE" )
    end
end


function Jin_ChargeFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "CHARGE" )
    end
end

function Jin_BurnFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )  

	if( iFrame == 6 ) then 		
		pMonster:AddTraceParticleOffset( "Jin1_Gage_Full_01", 0.0, 0.08 )
		pMonster:AddTraceParticleOffset( "Jin1_Gage_Full_02", 0.0, 0.08 )
		pMonster:AddTraceParticleOffset( "Jin1_Burning_01", 0.0, 0.12 )
		pMonster:AddTraceParticleOffset( "Jin1_Burning_02", 0.0, 0.12 )
		pMonster:PlaySound(1161)
	elseif( iFrame == 7 ) then
		g_kCamera:SetEarthQuake(20)	
	end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- 걷기 상태
function Jin_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

-- 필살기 1
function Jin_Attack01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetInvincible( true )	
	
	if( iFrame <= 30 ) then
		pMonster:SetSpeedX( -0.006 )	
	end
	
	if( iFrame == 1 )then
		pMonster:SetSpeedX( 0.0 )	
		pMonster:AddDamage( DT_JIN_SPINKICK_ATK1, 0 )		
	elseif( iFrame == 8 ) then
		pMonster:PlaySound(1158)
	elseif( iFrame == 9 ) then
		pMonster:PlaySound(1210)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Jin1_Sunpung_01", 0.0, 0.20 )	
		else
			pMonster:AddParticleNoDirection( "Jin1_Sunpung_01_R", 0.1, 0.20 )	
		end						
	elseif( iFrame == 11 ) then
		pMonster:AddDamage( DT_JIN_SPINKICK_ATK2, 0 )
		pMonster:PlaySound(1158)
	elseif( iFrame == 18 ) then		
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Jin1_Sunpung_01", 0.0, 0.20 )	
		else
			pMonster:AddParticleNoDirection( "Jin1_Sunpung_01_R", 0.10, 0.20 )	
		end		
	elseif( iFrame == 28 ) then
		pMonster:AddDamage( DT_JIN_SPINKICK_ATK3, 0 )					
	elseif( iFrame == 38 ) then
		pMonster:PlaySound(1159)
	elseif( iFrame == 40 ) then		
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Jin1_Sunpung_01", 0.0, 0.20 )	
		else
			pMonster:AddParticleNoDirection( "Jin1_Sunpung_01_R", 0.10, 0.20 )	
		end		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--[[
-- 필살기 1
function Jin_Attack01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetInvincible( true )	
	
	if( iFrame == 18 ) then
		pMonster:AddDamageWithLocate( DT_JIN_SPECIAL2_TEXT_BAEK, 0.0, 0.12 )							
	elseif( iFrame == 20 ) then
		g_kCamera:SetEarthQuake(3)
		pMonster:PlaySound(1204)
		pMonster:AddDamage( DT_JIN_SPECIAL2_ATK1, 0 )
		
		pMonster:AddTraceParticleOffset( "Jin1_Special2_Hit_01", 0.0, 0.02, 5.0 )	
		pMonster:AddTraceParticleOffset( "Jin1_Special1_Upgrade_01", 0.12, 0.02, 5.0 )
		pMonster:AddTraceParticleOffset( "Jin1_Special1_Upgrade_02", 0.12, 0.02, 5.0 )
		pMonster:AddTraceParticleOffset( "Jin1_Special1_Upgrade_03", 0.12, 0.02, 5.0 )			
		pMonster:PlaySound(1166)
	elseif( iFrame == 35 ) then
		g_kCamera:SetEarthQuake(3)
		pMonster:AddDamage( DT_JIN_SPECIAL2_ATK2, 0 )
		
		pMonster:AddTraceParticleOffset( "Jin1_Special2_Hit_01", 0.0, 0.02, 5.0 )	
		pMonster:AddTraceParticleOffset( "Jin1_Special1_Upgrade_01", 0.12, 0.02, 5.0 )
		pMonster:AddTraceParticleOffset( "Jin1_Special1_Upgrade_02", 0.12, 0.02, 5.0 )
		pMonster:AddTraceParticleOffset( "Jin1_Special1_Upgrade_03", 0.12, 0.02, 5.0 )
		pMonster:AddDamageWithLocate( DT_JIN_SPECIAL2_TEXT_HWOA, 0.005, 0.07 )	
		pMonster:PlaySound(1167)				
	elseif( iFrame == 49 ) then
		g_kCamera:SetEarthQuake(3)
		pMonster:AddDamage( DT_JIN_SPECIAL2_ATK3, 0 )	
		
		pMonster:AddTraceParticleOffset( "Jin1_Special2_Hit_01", 0.0, 0.02, 5.0 )
		pMonster:AddTraceParticleOffset( "Jin1_Special1_Upgrade_01", 0.12, 0.02, 5.0 )
		pMonster:AddTraceParticleOffset( "Jin1_Special1_Upgrade_02", 0.12, 0.02, 5.0 )
		pMonster:AddTraceParticleOffset( "Jin1_Special1_Upgrade_03", 0.12, 0.02, 5.0 )
		pMonster:AddDamageWithLocate( DT_JIN_SPECIAL2_TEXT_NAN, 0.065, 0.12 )					
	elseif( iFrame == 51 ) then
		pMonster:PlaySound(1166)
	elseif( iFrame == 66 ) then
		g_kCamera:SetEarthQuake(3)
		pMonster:AddDamage( DT_JIN_SPECIAL2_ATK4, 0 )
		
		pMonster:AddTraceParticleOffset( "Jin1_Special2_Hit_01",  0.0, 0.02, 5.0 )
		pMonster:AddTraceParticleOffset( "Jin1_Special1_Upgrade_01", 0.12, 0.02, 5.0 )
		pMonster:AddTraceParticleOffset( "Jin1_Special1_Upgrade_02", 0.12, 0.02, 5.0 )
		pMonster:AddTraceParticleOffset( "Jin1_Special1_Upgrade_03", 0.12, 0.02, 5.0 )
		pMonster:AddDamageWithLocate( DT_JIN_SPECIAL2_TEXT_MU, 0.1, 0.07 )
	elseif( iFrame == 68 ) then
		pMonster:PlaySound(1168)					
	elseif( iFrame == 105 ) then
		g_kCamera:SetEarthQuake(25)
		pMonster:AddDamage( DT_JIN_SPECIAL2_FINAL_ATK, 0 )		
		pMonster:AddParticleNoDirection( "Jin1_Special1_Finish_01", 0.0, -0.05 )
		pMonster:AddParticleNoDirection( "Jin1_Special1_Finish_02", 0.0, -0.05 )
		pMonster:AddParticleNoDirection( "Jin1_Special1_Finish_03", 0.0, -0.05 )
		pMonster:AddParticleNoDirection( "Jin1_Special1_Finish_04", 0.0, -0.05 )
		pMonster:AddParticleNoDirection( "Jin1_Special1_Finish_05", 0.0, -0.05 )
		pMonster:AddParticleNoDirection( "Jin1_Special1_Finish_06", 0.0, -0.05 )
		pMonster:AddParticleNoDirection( "Jin1_Special1_Finish_07", 0.0, -0.05 )
		pMonster:AddParticleNoDirection( "Jin1_Special1_Finish_08", 0.0, -0.05 )
		pMonster:AddParticleNoDirection( "Jin1_Special1_Finish_09", 0.0, -0.05 )
		pMonster:AddParticleNoDirection( "Jin1_Special1_Finish_10", 0.0, -0.05 )
		pMonster:PlaySound(1172)
	elseif( iFrame == 110 ) then
		pMonster:AddDamage( DT_JIN_SPECIAL2_FINAL_ATK, 0 )			
	elseif( iFrame == 115 ) then
		pMonster:AddDamage( DT_JIN_SPECIAL2_FINAL_ATK, 0 )								
	end	
	 if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end
--]]



function Jin_Action1580Func(iMonsterIndex, iFrame)
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetInvincible( true )	
	
	local xPos = 0.0
	if( iFrame == 0 ) then				
		xPos = 0.22		
		pMonster:AddParticleNoDirection( "Jin1_special_Upgrade_Effect_01", xPos, 0.16 )
		pMonster:AddParticleNoDirection( "Jin1_special_Upgrade_Effect_02", xPos, 0.16 )
		pMonster:AddParticleNoDirection( "Jin1_special_Upgrade_Effect_03", xPos, 0.16 )
		pMonster:AddParticleNoDirection( "Jin1_special_Upgrade_Effect_04", xPos, 0.16 )
		pMonster:AddParticleNoDirection( "Jin1_special_Upgrade_Effect_05", xPos, 0.16 )
		pMonster:AddParticleNoDirection( "Jin1_special_Upgrade_Effect_06", xPos, 0.16 )
		pMonster:AddParticleNoDirection( "Jin1_special_Upgrade_Effect_07", xPos, 0.16 )
	elseif( iFrame == 46 ) then
		xPos = 0.24		
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_01", xPos, 0.22 )
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_02", xPos, 0.22 )
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_03", xPos, 0.22 )
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_04", xPos, 0.22 )
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_05", xPos, 0.22 )
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_06", xPos, 0.22 )
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_07", xPos, 0.22 )		
		pMonster:AddDamage( DT_JIN_SPECIAL3_BURNNING_ATK1_DRAMA)
		pMonster:PlaySound(1180)
	elseif( iFrame == 53 ) then		
		pMonster:AddDamage( DT_JIN_SPECIAL3_BURNNING_BALL_EFFECT_DRAMA )
		pMonster:AddDamage( DT_JIN_SPECIAL3_BURNNING_ATK1_DRAMA)		
	elseif( iFrame == 60 ) then
		pMonster:AddDamage( DT_JIN_SPECIAL3_BURNNING_ATK1_DRAMA )		
	elseif( iFrame == 67 ) then
		pMonster:AddDamage( DT_JIN_SPECIAL3_BURNNING_ATK1_DRAMA )
	elseif( iFrame == 74 ) then
		pMonster:AddDamage( DT_JIN_SPECIAL3_BURNNING_ATK1_DRAMA )		
	elseif( iFrame == 81 ) then
		pMonster:AddDamage( DT_JIN_SPECIAL3_BURNNING_ATK1_DRAMA )				
	end
	if( iFrame >= pMonster:GetLastFrame() ) then        
		pMonster:SetState( "SPECIAL3_2" )		
	end
end


function Jin_Action1604Func(iMonsterIndex, iFrame) --MID_JIN_SPECIAL3_FORCED2	                =1604--진--필살기3 강화형 모션2
	local pMonster = g_MyD3D:GetMonster(iMonsterIndex)
	
	if( iFrame == 0 ) then
		pMonster:SkillReadyEffectNoStop(0,0,0)
	elseif( iFrame == 30 ) then
		pMonster:SetState( "SPECIAL3_3" )
	end
end

function Jin_Action1605Func(iMonsterIndex, iFrame) --MID_JIN_SPECIAL3_FORCED3	                =1605--진--필살기3 강화형 모션3
	local pMonster = g_MyD3D:GetMonster(iMonsterIndex)	
	
	if( iFrame == 1 ) then
		pMonster:AddDamage( DT_JIN_SPECIAL3_BURNNING_FINAL_ATK1 )
	elseif( iFrame == 4 ) then
		pMonster:PlaySound(1205)
		local xPos = 0.44
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_01", xPos, 0.22 )
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_02", xPos, 0.22 )
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_03", xPos, 0.14 )
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_04", xPos, 0.14 )
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_05", xPos, 0.22 )
		pMonster:PlaySound(1181)
	elseif( iFrame == 8 ) then
		g_kCamera:SetEarthQuake(20)	
	elseif( iFrame == 37 ) then
		-- 여기다가 폭팔	--[[
		xPos = 1.9	
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_01", xPos, 0.24 )
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_02", xPos, 0.24 )
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_03", xPos, 0.16 )
		pMonster:AddParticleNoDirection( "Jin1_special3_Upgrade_Start_04", xPos, 0.16 )
		--]]
		--[[{ "Jin1_special3_Upgrade_Start_01", 20 , 20 , FALSE, 0.0, 0.0, 5, },
		{ "Jin1_special3_Upgrade_Start_02", 15 , 15 , FALSE, 0.0, 0.0, 5, },
		{ "Jin1_special3_Upgrade_Start_03", 100, 100, FALSE, 0.0, 0.0, 5, },
		{ "Jin1_special3_Upgrade_Start_04", 20 , 20 , FALSE, 0.0, 0.0, 5, },--]]	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end



