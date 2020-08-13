-- AI_DoTaGuardianTower.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "CurseStone_Wait.frm",
        Func    = "DoTaGuardianTower_WaitFunc",
		
        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "DotaGuardianTower_Check_Targeting",
                DelayFrame          = 10,
            },

			-- 미사일 발사
            {
                AICheckFrame        = 27,
                AIFunc              = "DotaGuardianTower_Check_Attack01",
                DelayFrame          = 55,
            },    
		},
    },

    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "CurseStone_Wait.frm",
        Func    = "DoTaGuardianTower_ATK",
    },
	
	-- 죽음
    {
        ID      = "DIE",
        Motion  = "CurseStone_Die.frm",
        Func    = "DoTaGuardianTower_DieFunc",
    },
}

CallBack =
{
    Die     	= "OnDoTaGuardianTower_Die",
    Damage  	= "OnDoTaGuardianTower_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitDoTaGuardianTower( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	pMonster:SetCountValue(0)
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function DoTaGuardianTower_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	pMonster:SetIsRight( pMonster:GetDotaGateIsRight() )
	
    if( pMonster:GetInitAI() ) then
        if( 0 == pMonster.Team ) then
	        pMonster:AddParticleModel("GuardianTower_Serdin_1", -0.04, 0.34, 0, 0.6, 1.0, true)
	        pMonster:AddParticleModel("GuardianTower_Serdin_2", -0.04, 0.34, 0, 0.3, 0.6, true)
	        pMonster:AddParticleModel("GuardianTower_Serdin_3", -0.04, 0.34, 0, 0.0, 0.3, true)    
        else
	        pMonster:AddParticleModel("GuardianTower_Canaban_1", -0.04, 0.34, 0, 0.6, 1.0, true)
	        pMonster:AddParticleModel("GuardianTower_Canaban_2", -0.04, 0.34, 0, 0.3, 0.6, true)
	        pMonster:AddParticleModel("GuardianTower_Canaban_3", -0.04, 0.34, 0, 0.0, 0.3, true)    
        end
        pMonster:SetInitAI( false )
    end

    if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:ReleaseTarget()
        pMonster:SetState( "WAIT" )
    end
end

-- 죽었음
function DoTaGuardianTower_DieFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame == pMonster:GetLastFrame() - 1 ) then
		pMonster:AddParticle("Dota_Tower_Boom_01", 0.0, 0.5 )
		pMonster:AddParticle("Dota_Tower_Boom_02", 0.0, 0.5 )
		--pMonster:AddParticle("Dota_Tower_Boom_03", 0.0, 0.33 )
		pMonster:AddParticle("Dota_Tower_Boom_04", 0.0, 0.5 )
		pMonster:AddParticle("Dota_Tower_Boom_04", 0.0, 1.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:EndMonster(false, true)
        pMonster:SetFrameLock( true )
    end
end

-- 공격
function DoTaGuardianTower_ATK( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	local posY
    local angle
	
	pMonster:SetIsRight( pMonster:GetDotaGateIsRight() )
	pMonster:AddCountValue(-1)

--[[
	if( pMonster:GetCountValue() <= 0 ) then
		pMonster:ResetDelay()
        pMonster:SetState( "WAIT" )
	elseif( pMonster:GetCountValue() == 1 ) then
		angle = pMonster:GetAngleToTarget()
		if( pMonster:GetX() > pMonster:GetTargetX() ) then
			angle = angle * -1.0
		else
			angle = angle - 3.141592
		end		
		
        if( 0 == pMonster.Team ) then
			pMonster:AddDamageWithLocateAngle( DT_DOTA_STATIC_GUARDIAN_SERDIN, 0.0, 1.0, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_DOTA_STATIC_GUARDIAN_CANABAN, 0.0, 1.0, false, angle )
		end
	elseif( pMonster:GetCountValue() == 2 ) then
		posY = 1.0
		pMonster:PlaySound(984028)
        if( 0 == pMonster.Team ) then
			pMonster:AddParticle("Dota_ShotR_01", 0.0, posY)
			pMonster:AddParticle("Dota_ShotR_04", 0.0, posY)
		else
			pMonster:AddParticle("Dota_ShotB_01", 0.0, posY)
			pMonster:AddParticle("Dota_ShotB_04", 0.0, posY)
		end
		pMonster:ComputeAngleToTarget( 0.0, 1.0 ) -- 타겟으로의 각도를 계산
	end
--]]

    if( iFrame == 5 ) then
		posY = 1.0
		pMonster:PlaySound(984028)
        if( 0 == pMonster.Team ) then
			pMonster:AddParticle("Dota_ShotR_01", 0.0, posY)
			pMonster:AddParticle("Dota_ShotR_04", 0.0, posY)
		else
			pMonster:AddParticle("Dota_ShotB_01", 0.0, posY)
			pMonster:AddParticle("Dota_ShotB_04", 0.0, posY)
		end
		pMonster:ComputeAngleToTarget( 0.0, 1.0 ) -- 타겟으로의 각도를 계산
	elseif( iFrame == 6 ) then
		angle = pMonster:GetAngleToTarget()
		if( pMonster:GetX() > pMonster:GetTargetX() ) then
			angle = angle * -1.0
		else
			angle = angle - 3.141592
		end		
		
        if( 0 == pMonster.Team ) then
			pMonster:AddDamageWithLocateAngle( DT_DOTA_STATIC_GUARDIAN_SERDIN, 0.0, 1.0, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_DOTA_STATIC_GUARDIAN_CANABAN, 0.0, 1.0, false, angle )
		end
	elseif( iFrame == 55 ) then
		posY = 1.0
		pMonster:PlaySound(984028)
        if( 0 == pMonster.Team ) then
			pMonster:AddParticle("Dota_ShotR_01", 0.0, posY)
			pMonster:AddParticle("Dota_ShotR_04", 0.0, posY)
		else
			pMonster:AddParticle("Dota_ShotB_01", 0.0, posY)
			pMonster:AddParticle("Dota_ShotB_04", 0.0, posY)
		end
	elseif( iFrame == 56 ) then
		pMonster:SetTarget( 0, -1000, 500, 1000, -400 )
		pMonster:ComputeAngleToTarget( 0.0, 1.0 ) -- 타겟으로의 각도를 계산
		angle = pMonster:GetAngleToTarget()
		if( pMonster:GetX() > pMonster:GetTargetX() ) then
			angle = angle * -1.0
		else
			angle = angle - 3.141592
		end	
		
        if( 0 == pMonster.Team ) then
			pMonster:AddDamageWithLocateAngle( DT_DOTA_STATIC_GUARDIAN_SERDIN, 0.0, 1.0, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_DOTA_STATIC_GUARDIAN_CANABAN, 0.0, 1.0, false, angle )
		end		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:ResetDelay()
        pMonster:SetState( "WAIT" )
    end

end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------
function DotaGuardianTower_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -1000, 1000, 1000, -500 ) == true ) then
        pMonster:ResetDelay()
    end
end

function DotaGuardianTower_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -900, 500, 900, -400 ) == true ) then
		pMonster:SetCountValue(9)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end
-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnDoTaGuardianTower_Die( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function OnDoTaGuardianTower_Damage( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetIsRight( true )
	
	
end