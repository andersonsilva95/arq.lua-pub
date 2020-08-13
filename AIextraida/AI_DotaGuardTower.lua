-- AI_DotaGuardTower.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "CurseStone_Wait.frm",
        Func    = "DoTaGuardTower_WaitFunc",
		
        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "DotaGuardTower_Check_Targeting",
                DelayFrame          = 10,
            },
            
			-- 미사일 발사
            {
                AICheckFrame        = 30,
                AIFunc              = "DotaGuardTower_Check_Attack01",
                DelayFrame          = 55,
            },    
		},
    },

    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "CurseStone_Wait.frm",
        Func    = "DoTaGuardTower_ATK",
    },
	
	-- 죽음
    {
        ID      = "DIE",
        Motion  = "CurseStone_Die.frm",
        Func    = "DoTaGuardTower_DieFunc",
    },
}

CallBack =
{
    Die     	= "OnDoTaGuardTower_Die",
    Damage  	= "OnDoTaGuardTower_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitDoTaGuardTower( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function DoTaGuardTower_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    -- 몬스터 파티클 등록
    if( pMonster:GetInitAI() ) then
        if( 0 == pMonster.Team ) then
	        pMonster:AddParticleModel("GuardTower_Serdin_1", 0.0, -0.035, 0, 0.6, 1.0, true)
	        pMonster:AddParticleModel("GuardTower_Serdin_2", 0.0, -0.035, 0, 0.3, 0.6, true)
	        pMonster:AddParticleModel("GuardTower_Serdin_3", 0.0, -0.035, 0, 0.0, 0.3, true)
        else
	        pMonster:AddParticleModel("GuardTower_Canaban_1", 0.0, -0.035, 0, 0.6, 1.0, true)
	        pMonster:AddParticleModel("GuardTower_Canaban_2", 0.0, -0.035, 0, 0.3, 0.6, true)
	        pMonster:AddParticleModel("GuardTower_Canaban_3", 0.0, -0.035, 0, 0.0, 0.3, true)    
        end
        pMonster:SetInitAI( false )        
    end

    if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:ReleaseTarget()
        pMonster:SetState( "WAIT" )
    end
end

-- 죽었음
function DoTaGuardTower_DieFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame == pMonster:GetLastFrame() - 1 ) then
		pMonster:AddParticle("Dota_Tower_Boom_Small_01", 0.0, 0.3 )
		pMonster:AddParticle("Dota_Tower_Boom_Small_02", 0.0, 0.3 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:EndMonster(false, true)
        pMonster:SetFrameLock( true )
    end
end

-- 공격
function DoTaGuardTower_ATK( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    local angle
	
	pMonster:SetIsRight( pMonster:GetDotaGateIsRight() )
	
	if( iFrame == 19 ) then
		pMonster:ComputeAngleToTarget( 0.0, 0.0 ) -- 타겟으로의 각도를 계산
	elseif( iFrame == 20 ) then
		pMonster:PlaySound(984028)
		angle = pMonster:GetAngleToTarget()
		if( pMonster:GetX() > pMonster:GetTargetX() ) then
			angle = angle * -1.0
		else
			angle = angle * 1.0 - 3.141592
		end		
		
        if( 0 == pMonster.Team ) then
			pMonster:AddDamageWithLocateAngle( DT_DOTA_STATIC_GUARD_SERDIN, 0.0, 0.0, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_DOTA_STATIC_GUARD_CANABAN, 0.0, 0.0, false, angle )
		end
	elseif( iFrame == 23 ) then
        if( 0 == pMonster.Team ) then
			pMonster:AddParticle("Dota_ShotR_01", 0.0, 0.35 )
			pMonster:AddParticle("Dota_ShotB_04", 0.0, 0.35 )
		else
			pMonster:AddParticle("Dota_ShotB_01", 0.0, 0.35 )
			pMonster:AddParticle("Dota_ShotB_04", 0.0, 0.35 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:ResetDelay()
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------
function DotaGuardTower_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -1000, 500, 1000, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function DotaGuardTower_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -450, 500, 450, -200 ) == true ) then
		pMonster:SetState( "ATTACK01" )
	end
end
-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnDoTaGuardTower_Die( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function OnDoTaGuardTower_Damage( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetIsRight( true )
	
	
end