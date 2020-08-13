-- AI_thunder_hammer_rifleman.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "thunder_hammer_rifleman_Wait.frm",
        Func    = "thunder_hammer_rifleman_WaitFunc",

        Trigger =
        {
			-- 스나이퍼 샷
            {
                AICheckFrame        = 1,
                AIFunc              = "thunder_hammer_rifleman_Check_Attack",
                DelayFrame          = 165,
				DelayFrame1			= 110,
				DelayFrame2			= 1,
				DelayFrame3			= 1,
            },
		},
    },

    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "thunder_hammer_rifleman_Attack01.frm",
        Func    = "thunder_hammer_rifleman_Attack01Func",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK02",
        Motion  = "thunder_hammer_rifleman_Attack02.frm",
        Func    = "thunder_hammer_rifleman_Attack02Func",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK03",
        Motion  = "thunder_hammer_rifleman_Attack03.frm",
        Func    = "thunder_hammer_rifleman_Attack03Func",
    },
    
    
}

CallBack =
{
    --Land    = "Onthunder_hammer_rifleman_Land",
    --Die     = "Onthunder_hammer_rifleman_Die",
    --Damage  = "Onthunder_hammer_rifleman_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function Initthunder_hammer_rifleman( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetTargetingDelayTime(0)
	pMonster:SetCountValue(math.mod(iMonsterIndex, 3))
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function thunder_hammer_rifleman_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  근접공격 상태
function thunder_hammer_rifleman_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 48 ) then
        angle = 0.522
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		else
			angle = angle
        end
        pMonster:AddDamageWithLocateAngle( DT_THUNDER_HAMMER_RIFLEMAN_BULLET, 0.15, 0.38, false, angle )
    elseif( iFrame == 51 ) then
		pMonster:AddParticle("Ghost_Shooter_Shot_01", 0.22, 0.43)
		pMonster:AddParticle("Ghost_Shooter_Shot_02", 0.22, 0.43)
		
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Ghost_Shooter_Cartridge", 0.2, 0.4, true)
		else
			pMonster:AddParticleNoDirection("Ghost_Shooter_Cartridge_R", 0.05, 0.3, true)
		end
		--pMonster:PlaySound(987017)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격2 상태
function thunder_hammer_rifleman_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 48 ) then
		 angle = 0.0
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		else
			angle = angle
        end
        pMonster:AddDamageWithLocateAngle( DT_THUNDER_HAMMER_RIFLEMAN_BULLET, 0.18, 0.26, false, angle )
    elseif( iFrame == 51 ) then
		pMonster:AddParticle("Ghost_Shooter_Shot_01", 0.22, 0.25)
		pMonster:AddParticle("Ghost_Shooter_Shot_02", 0.22, 0.25)
		
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Ghost_Shooter_Cartridge", 0.25, 0.25, true)
		else
			pMonster:AddParticleNoDirection("Ghost_Shooter_Cartridge_R", 0.0, 0.25, true)
		end
		--pMonster:PlaySound(987017)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격2 상태
function thunder_hammer_rifleman_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 48 ) then
		 angle = -0.55
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		else
			angle = angle
        end
        pMonster:AddDamageWithLocateAngle( DT_THUNDER_HAMMER_RIFLEMAN_BULLET, 0.18, 0.18, false, angle )
    elseif( iFrame == 51 ) then
		pMonster:AddParticle("Ghost_Shooter_Shot_01", 0.22, 0.2)
		pMonster:AddParticle("Ghost_Shooter_Shot_02", 0.22, 0.2)
		
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Ghost_Shooter_Cartridge", 0.2, 0.2, true)
		else
			pMonster:AddParticleNoDirection("Ghost_Shooter_Cartridge_R", -0.05, 0.2, true)
		end
		--pMonster:PlaySound(987017)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------
function thunder_hammer_rifleman_Check_Attack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:AddCountValue(1)	
	pMonster:SetState( "ATTACK0"..pMonster:GetCountValue() )

	if( pMonster:GetCountValue() == 3 ) then
		pMonster:SetCountValue(0)
	end

	pMonster:ResetDelay()
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Onthunder_hammer_rifleman_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    --pMonster:SetPushCheck( true )
end

