-- AI_Fire_Hammer_Driller.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Fire_Hammer_Driller_Wait.frm",
        Func    = "Fire_Hammer_Driller_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 50,
                AIFunc              = "Fire_Hammer_Driller_Check_Targeting",
                DelayFrame          = 100,
            },

            -- 타겟지움
            {
                AICheckFrame        = 250,
                AIFunc              = "Fire_Hammer_Driller_Check_ReleaseTarget",
                DelayFrame          = 200,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 40,
                AIFunc              = "Fire_Hammer_Driller_Check_TurnToTarget",
                DelayFrame          = 5,
            },

            -- 걷기
            {
                AICheckFrame        = 10,
                AIFunc              = "Fire_Hammer_Driller_Check_Walk",
                DelayFrame          = 20,
            },

            -- 점프업
            {
                AICheckFrame        = 41,
                AIFunc              = "Fire_Hammer_Driller_Check_JumpUp",
                DelayFrame          = 100,
            },        

            -- 점프다운
            {
                AICheckFrame        = 42,
                AIFunc              = "Fire_Hammer_Driller_Check_JumpDown",
                DelayFrame          = 50,
            },

			-- 드릴 락
            {
                AICheckFrame        = 25,
                AIFunc              = "Fire_Hammer_Driller_Check_Attack01",
                DelayFrame          = 125,
            },

            -- 드릴 그라운드
            {
                AICheckFrame        = 100,
                AIFunc              = "Fire_Hammer_Driller_Check_Attack02",
                DelayFrame          = 400,
            },

        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Fire_Hammer_Driller_move.frm",
        Func            = "Fire_Hammer_Driller_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Fire_Hammer_Driller_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 40,
                AIFunc              = "Fire_Hammer_Driller_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "Fire_Hammer_Driller_Check_ReleaseTarget",
                DelayFrame          = 220,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 30,
                AIFunc              = "Fire_Hammer_Driller_Check_TurnToTarget",
                DelayFrame          = 5,
            },
            -- 점프업
            {
                AICheckFrame        = 41,
                AIFunc              = "Fire_Hammer_Driller_Check_JumpUp",
                DelayFrame          = 100,
            },        
            -- 점프다운
            {
                AICheckFrame        = 42,
                AIFunc              = "Fire_Hammer_Driller_Check_JumpDown",
                DelayFrame          = 50,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "Fire_Hammer_Driller_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Fire_Hammer_Driller_Attack01.frm",
        Func    = "Fire_Hammer_Driller_Attack01Func",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK02",
        Motion  = "Fire_Hammer_Driller_Attack02.frm",
        Func    = "Fire_Hammer_Driller_Attack02Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Fire_Hammer_Driller_Jump_Up.frm",
        Func    = "Fire_Hammer_Driller_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "Fire_Hammer_Driller_Jump_Down.frm",
        Func    = "Fire_Hammer_Driller_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "Fire_Hammer_Driller_Jump_Landing.frm",
        Func    = "Fire_Hammer_Driller_ToWait",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Fire_Hammer_Driller_Damage_Up.frm",
        Func    = "Fire_Hammer_Driller_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Fire_Hammer_Driller_Damage_Middle.frm",
        Func    = "Fire_Hammer_Driller_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Fire_Hammer_Driller_Damage_Down.frm",
        Func    = "Fire_Hammer_Driller_DamageFunc",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "goblin_berserker_die.frm",
        Func    = "Fire_Hammer_Driller_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
        
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Fire_Hammer_Driller_Stone.frm",
        Func    = "Fire_Hammer_Driller_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Fire_Hammer_Driller_Stone.frm",
        Func    = "Fire_Hammer_Driller_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Fire_Hammer_Driller_Stone.frm",
		Func	= "Fire_Hammer_Driller_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnFire_Hammer_Driller_Land",
    Die     = "OnFire_Hammer_Driller_Die",
    Damage  = "OnFire_Hammer_Driller_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitFire_Hammer_Driller( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_DOWN" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

    pMonster:ToggleExtraMesh("DRILL", true)
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Fire_Hammer_Driller_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Fire_Hammer_Driller_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기 착지
function Fire_Hammer_Driller_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(989025)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Fire_Hammer_Driller_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Fire_Hammer_Driller_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:ClearChildMeshOneTimeMotion( "DRILL" )
		pMonster:SetChildMeshMotion("DRILL", "Fire_Hammer_Driller_attack01_weapon", true, true )
	elseif( iFrame == 20 ) then
		pMonster:PlaySound(989026)
	elseif( iFrame == 35 ) then
		pMonster:PlaySound(989027)
	elseif( iFrame == 70 ) then
		local posx = 0.2
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleToChildMeshBone("DRILL", "Driller_Drill", 2, 0.0, posx, 0.0, false )
			pMonster:AddParticleToChildMeshBone("DRILL", "Driller_Drill_Dust", 2, 0.0, posx, 0.0, false )
		else
			pMonster:AddParticleToChildMeshBone("DRILL", "Driller_Drill_R", 2, 0.0, -posx, 0.0, false )
			pMonster:AddParticleToChildMeshBone("DRILL", "Driller_Drill_Dust_R", 2, 0.0, -posx, 0.0, false )
		end
		
		pMonster:AddDamage(DT_FIRE_HAMMER_DRILLER_ATK1)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function Fire_Hammer_Driller_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( pMonster:GetIsRight() == true ) then
		if( iFrame <= 1 ) then
			pMonster:SetSuperArmor( true )
			pMonster:SetChildMeshMotion("DRILL", "Fire_Hammer_Driller_attack02_weapon", true, true )
		elseif( iFrame == 17 ) then
			pMonster:PlaySound(989026)
		elseif( iFrame == 55 ) then
			pMonster:PlaySound(989027)
		elseif( iFrame == 90 ) then
			pMonster:PlaySound(989029)
		elseif( iFrame == 91 ) then
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2, 0.5, 0.05, false, 1.3)
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2, 0.3, 0.05, false, 2.3)
			local posx = 0.07
			local posy = -0.06
			pMonster:AddParticleToChildMeshBone("DRILL", "Driller_Drill_Dust", 2, 0.0, posx, posy, false )
			pMonster:AddParticleToChildMeshBone("DRILL", "Driller_Drill_Under", 2, 0.0, posx, posy, false )
			pMonster:AddParticleToChildMeshBone("DRILL", "Driller_Drill_Under_02", 2, 0.0, posx, posy, false )
			pMonster:AddParticleToChildMeshBone("DRILL", "Driller_Drill_Under_Dust", 2, 0.0, posx, posy, false )
		elseif( iFrame == 106 ) then
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_2, 0.55, 0.05, false, 0.8)
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_3, 0.45, 0.05, false, 1.2)
		elseif( iFrame == 121 ) then
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_4, 0.4, 0.05, false, 2.0)
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_3, 0.3, 0.05, false, 2.3)
		elseif( iFrame == 136 ) then
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_4, 0.45, 0.05, false, 1.3)
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2, 0.3, 0.05, false, 2.5)
		elseif( iFrame == 151 ) then
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_3, 0.55, 0.05, false, 0.8)
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_4, 0.4, 0.05, false, 1.8)
		elseif( iFrame == 166 ) then
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_4, 0.45, 0.05, false, 1.5)
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_4, 0.3, 0.05, false, 2.4)
		elseif( iFrame == 181 ) then
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_4, 0.55, 0.05, false, 0.7)
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_2, 0.3, 0.05, false, 1.65)
		elseif( iFrame >= pMonster:GetLastFrame() ) then
			pMonster:SetState( "WAIT" )
		end
	else
		if( iFrame <= 1 ) then
			pMonster:SetSuperArmor( true )
			pMonster:SetChildMeshMotion("DRILL", "Fire_Hammer_Driller_attack02_weapon", true, true )
		elseif( iFrame == 17 ) then
			pMonster:PlaySound(989026)
		elseif( iFrame == 55 ) then
			pMonster:PlaySound(989027)
		elseif( iFrame == 90 ) then
			pMonster:PlaySound(989029)
		elseif( iFrame == 91 ) then
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2, 0.5, 0.05, false, -1.3)
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2, 0.3, 0.05, false, -2.3)
			local posx = -0.07
			local posy = -0.045
			pMonster:AddParticleToChildMeshBone("DRILL", "Driller_Drill_Dust_R", 2, 0.0, posx, posy, false )
			pMonster:AddParticleToChildMeshBone("DRILL", "Driller_Drill_Under_R", 2, 0.0, posx, posy, false )
			pMonster:AddParticleToChildMeshBone("DRILL", "Driller_Drill_Under_02_R", 2, 0.0, posx, posy, false )
			pMonster:AddParticleToChildMeshBone("DRILL", "Driller_Drill_Under_Dust_R", 2, 0.0, posx, posy, false )
		elseif( iFrame == 106 ) then
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_2, 0.55, 0.05, false, -0.8)
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_3, 0.45, 0.05, false, -1.2)
		elseif( iFrame == 121 ) then
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_4, 0.4, 0.05, false, -2.0)
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_3, 0.3, 0.05, false, -2.3)
		elseif( iFrame == 136 ) then
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_4, 0.45, 0.05, false, -1.3)
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2, 0.3, 0.05, false, -2.5)
		elseif( iFrame == 151 ) then
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_3, 0.55, 0.05, false, -0.8)
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_4, 0.4, 0.05, false, -1.8)
		elseif( iFrame == 166 ) then
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_4, 0.45, 0.05, false, -1.5)
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_4, 0.3, 0.05, false, -2.4)
		elseif( iFrame == 181 ) then
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_4, 0.55, 0.05, false, -0.7)
			pMonster:AddDamageWithLocateAngle(DT_FIRE_HAMMER_DRILLER_ATK2_2, 0.3, 0.05, false, -1.65)
		elseif( iFrame >= pMonster:GetLastFrame() ) then
			pMonster:SetState( "WAIT" )
		end
	end
end

--  점프 상태
function Fire_Hammer_Driller_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame > 19 and pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
	
	if( iFrame == 19 ) then
		Fire_Hammer_Driller_Jump( iMonsterIndex )
	end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 다운 상태
function Fire_Hammer_Driller_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function Fire_Hammer_Driller_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function Fire_Hammer_Driller_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetInvincible( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end
    end
end

--  아이스커스 걸렸음
function Fire_Hammer_Driller_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end
    end
end


-- 홀드 걸렸음(이펙트)
function Fire_Hammer_Driller_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Small", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Fire_Hammer_Driller_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 300, 400, -300 ) == true ) then
		pMonster:TurnToTarget()
		
        pMonster:ResetDelay()
    end  
end

function Fire_Hammer_Driller_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 200, -600, 400, 600, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Fire_Hammer_Driller_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Fire_Hammer_Driller_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -350, 400, 350, -400 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Fire_Hammer_Driller_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -350, 400, 350, -400 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Fire_Hammer_Driller_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Fire_Hammer_Driller_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 50, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Fire_Hammer_Driller_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -600, 400, 600, -400 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Fire_Hammer_Driller_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 400, 200, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Fire_Hammer_Driller_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, -100, 200, -400 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnFire_Hammer_Driller_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnFire_Hammer_Driller_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnFire_Hammer_Driller_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "ATTACK01" ) == false and pMonster:CheckState( "ATTACK02" ) == false and pMonster:CheckState( "ATTACK03" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		if ( pMonster:FloatRand() < 0.1 and pMonster:GetIsContact() == true and pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
			pMonster:SetState( "ATTACK01" )
			pMonster:TurnToTarget()
		end
	end

    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
end

function Fire_Hammer_Driller_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	if ( (fTargetY - fMonY) == 0.0 ) then
		fTargetY = fMonY + 0.1
	end
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Fire_Hammer_Driller_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			--pMonster:SetSpeedY( 0.025 )
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			--pMonster:SetSpeedY( 0.019 )			
		end
	end
end