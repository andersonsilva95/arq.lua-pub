-- AI_Dota_Core.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "CurseStone_Wait.frm",
        Func    = "DotaCore_WaitFunc",
    },
	
	-- 죽음
    {
        ID      = "DIE",
        Motion  = "CurseStone_Die.frm",
        Func    = "DotaCore_DieFunc",
    },
}

CallBack =
{
    Die     	= "OnDotaCore_Die",
    Damage  	= "OnDotaCore_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitDotaCore( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function DotaCore_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:GetInitAI() ) then
        if( 0 == pMonster.Team ) then
            pMonster:AddTraceParticleToBone( "dota_core_serdin", 1.0, 0, 6, 6, 0.0, -0.19, false )
            pMonster:AddTraceParticleToBone( "Dota_CoreR_01", 1.0, 0, 6, 6, 0.04, 0.15, false )
            pMonster:AddTraceParticleToBone( "Dota_CoreR_02", 1.0, 0, 6, 6, 0.04, 0.15, false )         
            pMonster:AddTraceParticleToBone( "Dota_Core", 1.0, 0, 6, 6, 0.04, 0.15, false )
        else
            pMonster:AddTraceParticleToBone( "dota_core_canaban", 1.0, 0, 6, 6, 0.0, -0.19, false )
            pMonster:AddTraceParticleToBone( "Dota_CoreB_01", 1.0, 0, 6, 6, -0.04, 0.15, false )
            pMonster:AddTraceParticleToBone( "Dota_CoreB_02", 1.0, 0, 6, 6, -0.04, 0.15, false )
            pMonster:AddTraceParticleToBone( "Dota_Core", 1.0, 0, 6, 6, -0.04, 0.15, false )
        end
        pMonster:SetInitAI( false )
    end

	if( math.mod( iFrame, 4 ) == 0 ) then
		pMonster:AddDamage( DT_DOTA_CORE_HP_RECOVER )
		pMonster:AddDamage( DT_DOTA_CORE_HP_DRAIN )

        if( 0 == pMonster.Team ) then		
			pMonster:AddDamage( DT_DOTA_SKY_DMG_ZONE_01 )
			pMonster:AddDamage( DT_DOTA_SKY_DMG_ZONE_02 )
			pMonster:AddDamage( DT_DOTA_SKY_DMG_ZONE_03 )
			pMonster:AddDamage( DT_DOTA_SKY_DMG_ZONE_04 )
			pMonster:AddDamage( DT_DOTA_SKY_DMG_ZONE_05 )
			pMonster:AddDamage( DT_DOTA_SKY_DMG_ZONE_06 )
		else
			pMonster:AddDamage( DT_DOTA_SKY_DMG_ZONE_01 )
			pMonster:AddDamage( DT_DOTA_SKY_DMG_ZONE_02 )
			pMonster:AddDamage( DT_DOTA_SKY_DMG_ZONE_03 )
			pMonster:AddDamage( DT_DOTA_SKY_DMG_ZONE_04 )
			pMonster:AddDamage( DT_DOTA_SKY_DMG_ZONE_05 )
			pMonster:AddDamage( DT_DOTA_SKY_DMG_ZONE_07 )
		end
	end
	
	if( iFrame == 3 ) then
		pMonster:SetIsRight( true )
		--pMonster:AddParticle("Stone_Effect_01", 0.0, 0.34 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetState( "WAIT" )
    end
end

-- 죽었음
function DotaCore_DieFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame == pMonster:GetLastFrame() - 1 ) then
        if( 0 == pMonster.Team ) then		
			pMonster:AddParticle("Dota_CoreR_Boom_01", 0.03, 0.27 )
			pMonster:AddParticle("Dota_CoreB_Boom_02", 0.03, 0.27 )
			pMonster:AddParticle("Dota_CoreB_Boom_03", 0.03, 0.27 )
			pMonster:AddParticle("Dota_CoreR_Boom_04", 0.03, 0.27 )
			pMonster:AddParticle("Dota_CoreR_Boom_05", 0.03, 0.27 )
			pMonster:AddParticle("Dota_CoreR_Boom_06", 0.03, 0.27 )
			pMonster:AddParticle("Dota_CoreR_Boom_07", 0.03, 0.27 )
			pMonster:AddParticle("Dota_CoreR_Boom_08", 0.03, 0.27 )
		else
			pMonster:AddParticle("Dota_CoreB_Boom_01", -0.03, 0.27 )
			pMonster:AddParticle("Dota_CoreB_Boom_02", -0.03, 0.27 )
			pMonster:AddParticle("Dota_CoreB_Boom_03", -0.03, 0.27 )
			pMonster:AddParticle("Dota_CoreB_Boom_04", -0.03, 0.27 )
			pMonster:AddParticle("Dota_CoreB_Boom_05", -0.03, 0.27 )
			pMonster:AddParticle("Dota_CoreB_Boom_06", -0.03, 0.27 )
			pMonster:AddParticle("Dota_CoreB_Boom_07", -0.03, 0.27 )
			pMonster:AddParticle("Dota_CoreB_Boom_08", -0.03, 0.27 )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end


-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnDotaCore_Die( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function OnDotaCore_Damage( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetIsRight( true )
	
	
end