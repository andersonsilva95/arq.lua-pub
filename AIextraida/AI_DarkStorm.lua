-- AI_DarkStorm.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "storm_sisters_Wait.frm",
        Func    = "DarkStorm_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "DarkStorm_Targeting",
                DelayFrame          = 100,
            },
            -- 타겟지움
            {
                AICheckFrame        = 150,
                AIFunc              = "DarkStorm_Check_ReleaseTarget",
                DelayFrame          = 250,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "DarkStorm_Check_TurnToTarget",
                DelayFrame          = 20,
            },

            -- 걷기
            {
                AICheckFrame        = 40,
                AIFunc              = "DarkStorm_Check_Walk",
                DelayFrame          = 60,
            },
            -- 점프다운
            {
                AICheckFrame        = 30,
                AIFunc              = "DarkStorm_Check_JumpDown",
                DelayFrame          = 120,
            },
			-- 자매야 영원할래?
            {
                AICheckFrame        = 10,
                AIFunc              = "DarkStorm_Check_Attack01",
                DelayFrame          = 500,
            },
            -- 단검 던지기~
            {
                AICheckFrame        = 100,
				AICheckFrame1       = 50,
				AICheckFrame2       = 5,
				AICheckFrame3       = 5,
                AIFunc              = "DarkStorm_Check_Attack02",
                DelayFrame          = 200,
            },
            -- 점프공격
            {
                AICheckFrame        = 50,
                AIFunc              = "DarkStormStorm_Check_JumpAtk",
                DelayFrame          = 250,
            },
            -- 다크 컷
            {
                AICheckFrame        = 90,
                AIFunc              = "DarkStorm_Check_Attack03",
                DelayFrame          = 50,
            },

            -- 어쌔신
            {
                AICheckFrame        = 100,
                AIFunc              = "DarkStorm_Check_Attack04",
                DelayFrame          = 400,
				DelayFrame1			= 300,
				DelayFrame2			= 200,
				DelayFrame3			= 200,
            },

            -- 폭발 토템
            {
                AICheckFrame        = 250,
                AIFunc              = "DarkStorm_Check_Attack05",
                DelayFrame          = 450,
				DelayFrame1			= 300,
				DelayFrame2			= 150,
				DelayFrame3			= 150,
            },

        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "storm_sisters_run.frm",
        Func            = "storm_sisters_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "DarkStorm_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 10,
                AIFunc              = "DarkStorm_Targeting",
                DelayFrame          = 40,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "DarkStorm_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- 단검 던지기~
            {
                AICheckFrame        = 30,
                AIFunc              = "DarkStorm_Check_Attack02",
                DelayFrame          = 80,
            },
            -- 점프공격
            {
                AICheckFrame        = 15,
                AIFunc              = "DarkStormStorm_Check_JumpAtk",
                DelayFrame          = 105,
            },

            -- 점프다운
            {
                AICheckFrame        = 22,
                AIFunc              = "DarkStorm_Check_JumpDown",
                DelayFrame          = 28,
            },
            -- 멈추기
            {
                AICheckFrame        = 3,
                AIFunc              = "DarkStorm_Check_Stop",
                DelayFrame          = 60,
            },
        }
    },
        
    -- 자매여 영원하라~
    {
        ID      = "ATTACK01",
        Motion  = "storm_sisters_Attack01.frm",
        Func    = "DarkStorm_Attack01Func",
    },
    
    -- 단검 던지기
    {
        ID      = "ATTACK02",
        Motion  = "storm_sisters_Attack02.frm",
        Func    = "DarkStorm_Attack02Func",
    },
    
    -- 다크 컷
    {
        ID      = "ATTACK03",
        Motion  = "storm_sisters_dark_attack03.frm",
        Func    = "DarkStorm_Attack03Func",
    },
    
    -- 어쌔신
    {
        ID      = "ATTACK04",
        Motion  = "storm_sisters_dark_attack04_01.frm",
        Func    = "DarkStorm_Attack04Func",
    },
    
    -- 어쌔신
    {
        ID      = "ATTACK04_ATK",
        Motion  = "storm_sisters_dark_attack04_02.frm",
        Func    = "DarkStorm_Attack04AtkFunc",
    },
    
    -- 폭발 토템
    {
        ID      = "ATTACK05",
        Motion  = "storm_sisters_Attack05.frm",
        Func    = "DarkStorm_Attack05Func",
    },
    
    -- 부활
    {
        ID      = "REVIVAL",
        Motion  = "storm_sisters_jump.frm",
        Func    = "DarkStormStorm_RevivalFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "storm_sisters_jump_up.frm",
        Func    = "DarkStorm_JumpFunc",
    },
    
    -- 점프 ATK
    {
        ID      = "JUMPATK",
        Motion  = "storm_sisters_jump.frm",
        Func    = "DarkStormStorm_JumpAtkFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "storm_sisters_jump_down.frm",
        Func    = "DarkStorm_JumpDownFunc",
    },

    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "storm_sisters_Jump_Landing.frm",
        Func    = "DarkStorm_ToWait",
    },

    -- 데미지 중
    {
        ID      = "DAMAGE",
        Motion  = "storm_sisters_damage_middle.frm",
        Func    = "DarkStorm_DamageFunc",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "storm_sisters_die.frm",
        Func    = "DarkStorm_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    {
        ID      = "DIE_PRETEND",
        Motion  = "storm_sisters_die.frm",
        Func    = "DarkStorm_DiePretendFunc",
        IsFallDownMotion    = TRUE,
    },

    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "storm_sisters_stone.frm",
        Func    = "DarkStorm_IceCurseFunc",
    },
}

CallBack =
{
    Land    = "OnDarkStorm_Land",
    Die     = "OnDarkStorm_Die",
    Damage  = "OnDarkStorm_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitDarkStorm( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
    
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
    
    pMonster:RegisterSummonMonsterType( MON_DARK_STORM )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function DarkStorm_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function storm_sisters_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기 착지
function DarkStorm_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(996013)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 죽은척!
function DarkStorm_DiePretendFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 1 ) then
        pMonster:PlaySound(996013)
		pMonster:SetInvincible( true )
		pMonster:InitTimer()
		pMonster:StartTimer()
	elseif( iFrame == pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
        local bFoundMedic = false
        
        for i = 0 , MAX_MONSTER-1 do
			local pTarget = g_MyD3D:GetMonster( i )
			if( pTarget:GetHP() > 0.0 and pTarget:GetMonsterType() == MON_FURIOUS_STORM ) then
				bFoundMedic = true
				break		
			end		
		end
		
		if ( bFoundMedic == false ) then
			pMonster:EndMonster()
		end	
		
		if ( pMonster:GetHP() > 0 ) then
		    pMonster:SetState( "REVIVAL" )
		end
    end
end

-- 데미지 입은거
function DarkStorm_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function DarkStorm_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 0 )
    
	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
    elseif( iFrame == 90 ) then
		local posy = 0.25
		pMonster:AddParticle("Storm_Sisters_Forever_Boom_01", 0.0, posy)
		pMonster:AddParticle("Storm_Sisters_Forever_Boom_02", 0.0, posy)
		pMonster:AddParticle("Storm_Sisters_Forever_Boom_03", 0.0, posy)
		pMonster:PlaySound(996008)
		pMonster:SetHP( pMonster:GetHP() + ( pMonster:GetMaxHP() * 0.1 ) )
		pMon:SetHP( pMonster:GetMaxHP() )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function DarkStorm_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 46 ) then
		pMonster:PlaySound(996009)
		local posx = 0.25
        local posy = 0.40
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Storm_Sisters_Dagger_01", posx,posy  )
			pMonster:AddParticle( "Storm_Sisters_Dagger_02", posx,posy  )
			pMonster:AddParticle( "Storm_Sisters_Dagger_03", posx,posy  )
			pMonster:AddParticle( "Storm_Sisters_Dagger_04", posx,posy  )
			pMonster:AddDamage(DT_STORMSISTERS_THROWING_DAGGER_R)
		else
			pMonster:AddParticleNoDirection( "Storm_Sisters_Dagger_01", -posx,posy  )
			pMonster:AddParticleNoDirection( "Storm_Sisters_Dagger_02_R", -posx,posy  )
			pMonster:AddParticleNoDirection( "Storm_Sisters_Dagger_03_R", -posx,posy  )
			pMonster:AddParticleNoDirection( "Storm_Sisters_Dagger_04", -posx,posy  )
			pMonster:AddDamage(DT_STORMSISTERS_THROWING_DAGGER_L)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function DarkStorm_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 40 ) then
		local posx = 0.22
        local posy = 0.25
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Dark_Storm_Dark_Cut_01", posx,posy  )
			pMonster:AddParticle( "Dark_Storm_Dark_Cut_02", posx,posy  )
			pMonster:AddParticle( "Dark_Storm_Dark_Cut_03", posx,posy  )
			pMonster:AddParticle( "Dark_Storm_Dark_Cut_04", posx,posy  )
			pMonster:AddParticle( "Dark_Storm_Dark_Cut_05", posx,posy  )
		else
			pMonster:AddParticleNoDirection( "Dark_Storm_Dark_Cut_01", -posx,posy  )
			pMonster:AddParticleNoDirection( "Dark_Storm_Dark_Cut_02", -posx,posy  )
			pMonster:AddParticleNoDirection( "Dark_Storm_Dark_Cut_03", -posx,posy  )
			pMonster:AddParticleNoDirection( "Dark_Storm_Dark_Cut_04", -posx,posy  )
			pMonster:AddParticleNoDirection( "Dark_Storm_Dark_Cut_05_R", -posx,posy  )
		end
		pMonster:PlaySound(996011)
		pMonster:AddDamage(DT_STORMSISTERS_DARKCUT)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function DarkStorm_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 42 ) then
		pMonster:SkillReadyEffect( 200, 10, 255, 0.1 )
    elseif( iFrame == pMonster:GetLastFrame() ) then
		local posx = -0.2
        local posy = 0.25
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Storm_Sisters_Shadow_Dash_01", posx,posy  )
			pMonster:AddParticleNoDirection( "Storm_Sisters_Shadow_Dash_02", posx,posy  )
		else
			pMonster:AddParticleNoDirection( "Storm_Sisters_Shadow_Dash_01_R", -posx,posy  )
			pMonster:AddParticleNoDirection( "Storm_Sisters_Shadow_Dash_02_R", -posx,posy  )
		end
		
		fDistX = 0.5
		if( pMonster:GetTargetIsRight() and pMonster:GetTargetX() > fDistX ) then
			pMonster:SetX( pMonster:GetTargetX() - fDistX )
			pMonster:SetIsRight( false )
		else
			pMonster:SetX( pMonster:GetTargetX() + fDistX )
			pMonster:SetIsRight( true )
			
			if( pMonster:GetTargetX() > pMonster:GetStageX() - fDistX ) then
				fDistX = fDistX * -1.0
				pMonster:SetIsRight( true )
			end
		end
		
		pMonster:SetY( pMonster:GetTargetY() )
        pMonster:SetState( "ATTACK04_ATK" )
    end
end

--  
function DarkStorm_Attack04AtkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 20 ) then
		local posx = 0.25
        local posy = 0.25
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Dark_Storm_Assasin_01", -posx,posy  )
			pMonster:AddParticleNoDirection( "Dark_Storm_Assasin_02_R", -posx,posy  )
			pMonster:AddParticleNoDirection( "Dark_Storm_Assasin_03", -posx,posy  )
			pMonster:AddParticleNoDirection( "Dark_Storm_Assasin_04_R", -posx,posy  )
			pMonster:AddParticleNoDirection( "Dark_Storm_Assasin_05_R", -posx,posy  )
		else
			pMonster:AddParticleNoDirection( "Dark_Storm_Assasin_01", posx,posy  )
			pMonster:AddParticleNoDirection( "Dark_Storm_Assasin_02", posx,posy  )
			pMonster:AddParticleNoDirection( "Dark_Storm_Assasin_03", posx,posy  )
			pMonster:AddParticleNoDirection( "Dark_Storm_Assasin_04", posx,posy  )
			pMonster:AddParticleNoDirection( "Dark_Storm_Assasin_05", posx,posy  )
		end
		pMonster:PlaySound(996011)
		pMonster:AddDamage(DT_STORMSISTERS_ASSESIN)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function DarkStorm_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
	elseif( iFrame == 60 ) then
		pMonster:PlaySound(40003)
		pMonster:AddDamage(DT_STORMSISTERS_BOMB_TOTEM)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function DarkStormStorm_RevivalFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1 ) then
		pMonster:AddParticle("Ronan3_SPECIAL2-1_01", 0.0, 0.12)
		pMonster:AddParticle("Ronan3_SPECIAL2-1_02", 0.0, 0.12)
		pMonster:AddParticle("Ronan3_SPECIAL2-1_04", 0.0, 0.12)
		pMonster:InitTimer()
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 59 ) then
		pMonster:AddDamage(DT_STORMSISTERS_JUMPATK)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function DarkStormStorm_JumpAtkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 59 ) then
		pMonster:AddDamage(DT_STORMSISTERS_JUMPATK)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function DarkStorm_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	 if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	       pMonster:SetFrameLock( true )

    end
end

--  점프 다운 상태
function DarkStorm_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function DarkStorm_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function DarkStorm_StoneCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE_PRETEND" )
		end
    end
end

--  아이스커스 걸렸음
function DarkStorm_IceCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE_PRETEND" )
		end
    end
end


-- 홀드 걸렸음(이펙트)
function DarkStorm_HoldFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE_PRETEND" )
		end
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function DarkStorm_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -1600, 1000, 1600, -1000 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function DarkStorm_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -800, 800, 800, -800 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function DarkStorm_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function DarkStorm_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 800, -500, 1000, 500, -1000 ) == true and pMonster:FloatRand() < 0.8) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
	end
end

function DarkStorm_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 250, -100, 800, 100, -800 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function DarkStorm_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function DarkStorm_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	local pMon = g_MyD3D:GetMonster( 0 )
	
	if( pMon:GetHP() <= 0.0 and pMon:GetTimer() >= 55 * 10 ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function DarkStorm_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 520, -250, 180, 250, -80 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function DarkStorm_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 130, -130, 180, 130, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function DarkStorm_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 100, -1600, 1000, 1600, -1000 ) == true and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function DarkStorm_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:FloatRand() < 0.75 ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

function DarkStormStorm_Check_JumpAtk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 250, -250, 800, 250, 150 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		DarkStorm_Jump( iMonsterIndex )
		pMonster:SetState( "JUMPATK" )
		pMonster:ResetDelay()
	end
end

function DarkStormStorm_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -100, 300, 100, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		DarkStorm_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function DarkStorm_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -400, -120, 400, -1000 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function DarkStorm_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 120, -130, 100, 130, -140 ) == true ) then
		if ( pMonster:FloatRand() < 0.6 ) then
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetState( "WAIT" )
		end
		pMonster:ResetDelay()
	end
end
-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnDarkStorm_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnDarkStorm_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_PRETEND" )
end

function OnDarkStorm_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
	
	if( pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false  )then
		if( pMonster:FloatRand() < 0.1 ) then
			pMonster:SetSuperArmor( true )
			pMonster:TurnToTarget()
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK05" )
			else
				pMonster:SetState( "ATTACK04" )
			end
		end
	end
end

function DarkStorm_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function DarkStorm_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )			
		end
	end
end