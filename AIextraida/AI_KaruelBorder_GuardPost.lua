-- AI_KaruelBorder_GuardPost.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Mon_GuardPos_f_Wait.frm",
        Func    = "KaruelBorderGuardPost_WaitFunc",
		
        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderGuardPost_Check_Targeting",
                DelayFrame          = 10,
            },
            -- 타겟지움
            {
                AICheckFrame        = 30,
                AIFunc              = "KaruelBorderGuardPost_Check_ReleaseTarget",
                DelayFrame          = 50,
            },
			-- 미사일 발사
            {
                AICheckFrame        = 30,
                AIFunc              = "KaruelBorderGuardPost_Check_Attack01",
                DelayFrame          = 55,
            },    
		},
    },

    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Mon_GuardPos_f_Wait.frm",
        Func    = "KaruelBorderGuardPost_ATTACK",
    },
	
	-- 죽음
    {
        ID      = "DIE",
        Motion  = "Mon_GuardPos_f_Wait.frm",
        Func    = "KaruelBorderGuardPost_DieFunc",
    },
}

CallBack =
{
    Die     	= "KaruelBorderGuardPost_Die",
    Damage  	= "KaruelBorderGuardPost_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitKaruelBorder_GuardPost( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	pMonster:SetInitAI( true )
	pMonster:SetIsRight( false )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function KaruelBorderGuardPost_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:GetInitAI() ) then
	    pMonster:AddParticleModel("KaruelBorder_GuardPost", 0.0, 0.362, 0, 0.6, 1.0, true)
	    pMonster:AddParticleModel("KaruelBorder_GuardPost", 0.0, 0.362, 0, 0.3, 0.6, true)
	    pMonster:AddParticleModel("KaruelBorder_GuardPost", 0.0, 0.362, 0, 0.0, 0.3, true)
        pMonster:SetInitAI( false )        
    end

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 죽었음
function KaruelBorderGuardPost_DieFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame == pMonster:GetLastFrame() - 1 ) then
		pMonster:PlaySound(983022)
		pMonster:AddParticle("Dota_Tower_Boom_01", 0.0, 0.5 )
		pMonster:AddParticle("Dota_Tower_Boom_02", 0.0, 0.5 )
		pMonster:AddParticle("Dota_Tower_Boom_04", 0.0, 0.5 )
		pMonster:AddParticle("Dota_Tower_Boom_04", 0.0, 1.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:EndMonster(false, true)
        pMonster:SetFrameLock( true )
    end
end

-- 공격
function KaruelBorderGuardPost_ATTACK( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	if( iFrame == 19 ) then
		local angle = pMonster:ComputeAngleToTarget( 0.0, 0.92 )
		
		if( pMonster:GetX() > pMonster:GetTargetX() ) then
			angle = angle * -1.0
		else
			angle = angle - 3.141592
		end
		if( pMonster:GetX() > pMonster:GetTargetX() ) then
			pMonster:AddDamageWithLocateAngle( DT_KARUELBORDER_GUARDPOST_ATTACK, 0.26, -0.07, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_KARUELBORDER_GUARDPOST_ATTACK, -0.26, -0.07, false, angle )
		end	
		pMonster:PlaySound(90015)
	elseif( iFrame == 23 ) then
			if( pMonster:GetX() > pMonster:GetTargetX() ) then
				pMonster:AddParticle("Dota_ShotB_01", 0.16, 0.85 )
				pMonster:AddParticle("Dota_ShotB_04", 0.16, 0.85 )
			else
				pMonster:AddParticle("Dota_ShotB_01", -0.16, 0.85 )
				pMonster:AddParticle("Dota_ShotB_04", -0.16, 0.85 )
			end	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:ResetDelay()
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------
function KaruelBorderGuardPost_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -600, 700, 600, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function KaruelBorderGuardPost_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -600, 750, 600, -600 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end

function KaruelBorderGuardPost_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -400, 700, 400, -200 ) == true ) then
		pMonster:SetState( "ATTACK01" )
	end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function KaruelBorderGuardPost_Die( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function KaruelBorderGuardPost_Damage( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetIsRight( false )
end