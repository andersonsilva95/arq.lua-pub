-- AI_Carnival_HammerMan.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Goblin_berserker_Wait.frm",
        Func    = "Carnival_HammerMan_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "Carnival_HammerMan_Check_Targeting",
                DelayFrame          = 80,
            },

            -- 타겟지움
            {
                AICheckFrame        = 200,
                AIFunc              = "Carnival_HammerMan_Check_ReleaseTarget",
                DelayFrame          = 200,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 30,
                AIFunc              = "Carnival_HammerMan_Check_TurnToTarget",
                DelayFrame          = 30,
            },

            -- 걷기
            {
                AICheckFrame        = 30,
                AIFunc              = "Carnival_HammerMan_Check_Walk",
                DelayFrame          = 20,
            },

            -- 점프업
            {
                AICheckFrame        = 20,
                AIFunc              = "Carnival_HammerMan_Check_JumpUp",
                DelayFrame          = 30,
            },
            -- 점프다운
            {
                AICheckFrame        = 25,
                AIFunc              = "Carnival_HammerMan_Check_JumpDown",
                DelayFrame          = 50,
            },

            -- 어슬렁대기(이동)
            {
                AICheckFrame        = 165,
                AIFunc              = "Carnival_HammerMan_Check_Idle",
                DelayFrame          = 220,
            },

            -- 화염 포효 [75%]
            {
                AICheckFrame        = 35,
                AIFunc              = "Carnival_HammerMan_Check_Attack04",
                DelayFrame          = 500,
				DelayFrame1			= 400,
				DelayFrame2			= 300,
            },

			-- 해머 스매쉬
            {
                AICheckFrame        = 20,
                AIFunc              = "Carnival_HammerMan_Check_Attack01",
                DelayFrame          = 120,
            },

            -- 해비 크래쉬 스핀
            {
                AICheckFrame        = 40,
                AIFunc              = "Carnival_HammerMan_Check_Attack02",
                DelayFrame          = 200,
            },

            -- 어스퀘이크 [50%]
            {
                AICheckFrame        = 150,
                AIFunc              = "Carnival_HammerMan_Check_Attack03",
                DelayFrame          = 400,
				DelayFrame1			= 350,
				DelayFrame2			= 300,
            },
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Goblin_berserker_walk.frm",
        Func            = "Carnival_HammerMan_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Carnival_HammerMan_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "Carnival_HammerMan_Check_Targeting",
                DelayFrame          = 80,
            },
            -- 타겟지움
            {
                AICheckFrame        = 200,
                AIFunc              = "Carnival_HammerMan_Check_ReleaseTarget",
                DelayFrame          = 200,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 30,
                AIFunc              = "Carnival_HammerMan_Check_TurnToTarget",
                DelayFrame          = 30,
            },
            -- 점프업
            {
                AICheckFrame        = 20,
                AIFunc              = "Carnival_HammerMan_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- 점프다운
            {
                AICheckFrame        = 25,
                AIFunc              = "Carnival_HammerMan_Check_JumpDown",
                DelayFrame          = 50,
            },

			-- 멈추기
            {
                AICheckFrame        = 5,
                AIFunc              = "Carnival_HammerMan_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
    
     -- 어슬렁대기
    {
        ID              = "IDLE",
        Motion          = "Goblin_berserker_Walk.frm",
        Func            = "Carnival_HammerMan_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Carnival_HammerMan_IdleMoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 40,
                AIFunc              = "Carnival_HammerMan_Check_Targeting",
                DelayFrame          = 90,
            },
            -- 어슬렁대기(멈춤)
            {
                AICheckFrame        = 200,
                AIFunc              = "Carnival_HammerMan_Check_Idle_Stop",
                DelayFrame          = 150,
            },
        }
    },
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Goblin_berserker_Attack01.frm",
        Func    = "Carnival_HammerMan_Attack01Func",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK02",
        Motion  = "Goblin_berserker_Attack02.frm",
        Func    = "Carnival_HammerMan_Attack02Func",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK03",
        Motion  = "Goblin_berserker_Attack03.frm",
        Func    = "Carnival_HammerMan_Attack03Func",
    },
    
	 -- 화염포효
    {
        ID      = "ATTACK04",
        Motion  = "hammerman_attack04.frm",
        Func    = "Carnival_HammerMan_Attack04Func",
    },
	
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Goblin_berserker_Jump_Up.frm",
        Func    = "Carnival_HammerMan_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "Goblin_berserker_Jump_Down.frm",
        Func    = "Carnival_HammerMan_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "Goblin_berserker_Jump_Landing.frm",
        Func    = "Carnival_HammerMan_ToWait",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Goblin_berserker_Damage_Up.frm",
        Func    = "Carnival_HammerMan_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Goblin_berserker_Damage_Middle.frm",
        Func    = "Carnival_HammerMan_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Goblin_berserker_Damage_Down.frm",
        Func    = "Carnival_HammerMan_DamageFunc",
    },
	
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Goblin_berserker_Down_Middle.frm",
        Func    = "Carnival_HammerMan_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Carnival_HammerMan_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "Goblin_berserker_Down_Middle.frm",
        Func    = "Carnival_HammerMan_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Carnival_HammerMan_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Goblin_berserker_die.frm",
        Func    = "Carnival_HammerMan_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Goblin_berserker_Standup.frm",
        Func    = "Carnival_HammerMan_StandupFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Goblin_berserker_Stone.frm",
        Func    = "Carnival_HammerMan_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Goblin_berserker_Stone.frm",
        Func    = "Carnival_HammerMan_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Goblin_berserker_Stone.frm",
		Func	= "Carnival_HammerMan_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnCarnival_HammerMan_Land",
    Die     = "OnCarnival_HammerMan_Die",
    Damage  = "OnCarnival_HammerMan_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitCarnival_HammerMan( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_DOWN" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
	
	local MaxHP = pMonster:GetHP()
	local AttackPoint = pMonster:GetAttackPoint()
	if( 31 == pMonster:GetLevel() ) then
		MaxHP = MaxHP *5
		AttackPoint = AttackPoint *1
		pMonster:SetMaxHP( MaxHP )
		pMonster:SetHP( MaxHP )
		pMonster:SetAttackPoint( AttackPoint )
	elseif( 51 == pMonster:GetLevel() ) then
		MaxHP = MaxHP *6
		AttackPoint = AttackPoint *1
		pMonster:SetMaxHP( MaxHP )
		pMonster:SetHP( MaxHP )
		pMonster:SetAttackPoint( AttackPoint )
	else
		MaxHP = MaxHP *35
		AttackPoint = AttackPoint *3.5
		pMonster:SetMaxHP( MaxHP )
		pMonster:SetHP( MaxHP )
		pMonster:SetAttackPoint( AttackPoint )
	end
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Carnival_HammerMan_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= 1 ) then
		pMonster:ToggleExtraMesh("DRILL", true)
	end

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Carnival_HammerMan_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    local posx = -0.5
    if( iFrame == 12 or iFrame == 60 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Blutus_Scratch", posx, 0.0)
		else
			pMonster:AddParticleNoDirection( "Blutus_Scratch_R", -posx, 0.0)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 어슬렁대기 상태
function Carnival_HammerMan_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    local posx = -0.5
    if( iFrame == 12 or iFrame == 60 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Blutus_Scratch", posx, 0.0)
		else
			pMonster:AddParticleNoDirection( "Blutus_Scratch_R", -posx, 0.0)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- 죽었음
function Carnival_HammerMan_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- 죽기 착지
function Carnival_HammerMan_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetSpeedX(0)

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(983019)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Carnival_HammerMan_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 미들
function Carnival_HammerMan_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
    end
    
    if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING" )
	end
end

-- 일어나기
function Carnival_HammerMan_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Carnival_HammerMan_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 63 ) then
		pMonster:AddDamage(DT_FIRE_HAMMER_BERSERKER_HAMMERSMASH)
	--elseif( iFrame == 66 ) then
		pMonster:PlaySound(983025)
		pMonster:PlaySound(91007)
	--elseif( iFrame == 68 ) then
		pMonster:CameraVib( 1, 1.0, 0.1 )
		pMonster:AddParticle( "Blutus_Smash_01", 0.48, 0.0 )
		pMonster:AddParticle( "Blutus_Earthquake_02", 0.48, 0.0 )
		pMonster:AddParticle( "Scolpis_Rush_02", 0.48, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function Carnival_HammerMan_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 55 ) then
		pMonster:PlaySound(994007)
	elseif( iFrame == 80 ) then
		pMonster:PlaySound(994007)
		--pMonster:PlaySound(983018)
		pMonster:AddDamage( DT_MON_HAMMERMAN_ATTACK02 )
	elseif( iFrame == 73 ) then
		pMonster:StartAttack( 7, 3, 0.35, 14, 14, 8)
	elseif( iFrame == 105 ) then
		pMonster:PlaySound(994007)
	elseif( iFrame == 101 ) then
		pMonster:StartAttack( 7, 3, 0.35, 14, 14, 8)
	elseif( iFrame == 130 ) then
		pMonster:PlaySound(994007)
	elseif( iFrame == 130 ) then
		pMonster:StartAttack( 7, 3, 0.35, 14, 14, 8)
	elseif( iFrame == 156 ) then
		pMonster:EndAttack()
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Carnival_HammerMan_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:StartText( "JUMP" )
	elseif( iFrame == 17 ) then
        pMonster:SetNoCheckContact( 60 )

        iTargetX = pMonster:GetTargetX()
        iTargetY = pMonster:GetTargetY()
        iX       = pMonster:GetX()
        iY       = pMonster:GetY()

        pMonster:SetSpeedX( ( iTargetX - iX ) / 80.0 )

        if( iTargetY - iY >= -0.25 ) and ( iTargetY - iY < 0.25 ) then
            pMonster:SetSpeedY( 0.061 )   -- 동일 y선상에 있을때 이정도가 적당..
        elseif( iTargetY - iY >= 0.25 ) and ( iTargetY - iY < 0.5 ) then
            pMonster:SetSpeedY( 0.066 )   -- 타겟이 조금 높은곳에 있으면..
        elseif( iTargetY - iY >= -0.5 ) and ( iTargetY - iY < -0.25 ) then
            pMonster:SetSpeedY( 0.050 )    -- 타겟이 조금 낮은곳에 있으면..
        elseif( iTargetY - iY >= 0.5 ) then
            pMonster:SetSpeedY( 0.071 )
        elseif( iTargetY - iY < -0.5 ) then
            pMonster:SetSpeedY( 0.042 )
        end

        pMonster:TurnToTarget()
	elseif( iFrame > 53 and iFrame < 68 ) then
		if( pMonster:GetSpeedY() < 0.0 ) then
			pMonster:SetSpeedY( pMonster:GetSpeedY() - 0.008 )
		end
    elseif( iFrame == 71 ) then
		pMonster:EarthQuake( 30, 0.06, 0.02 )
    elseif( iFrame == 75 ) then
		pMonster:AddParticle( "Blutus_Earthquake_01", 0.2, -0.1 )
		pMonster:AddParticle( "Blutus_Earthquake_02", 0.2, -0.1 )
		pMonster:AddParticle( "Scolpis_Rush_02", 0.2, -0.1 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  화염포효
function Carnival_HammerMan_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:ClearChildMeshOneTimeMotion( "DRILL" )
		pMonster:SetChildMeshMotion("DRILL", "hammerman_toch_attack04", true, true )
	elseif( iFrame == 56 ) then
		pMonster:SkillReadyEffect( 200, 150, 150, 0.25 )
		pMonster:AddTraceParticleToBone( "Circus_Hmrman_Fire_Spot", 0.5, 23, 8, 8, -0.05, 0.12 )
    elseif( iFrame == 71 ) then

		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Circus_Hmrman_Fire_01", 0.28, 0.305 )
			pMonster:AddParticleNoDirection( "Circus_Hmrman_Fire_02", 0.28, 0.305 )
			pMonster:AddParticleNoDirection( "Circus_Hmrman_Fire_03", 0.28, 0.305 )
			pMonster:AddParticleNoDirection( "Circus_Hmrman_Fire_04", 0.28, 0.305 )
			pMonster:AddParticleNoDirection( "Circus_Hmrman_Fire_05", 0.28, 0.305 )
			pMonster:AddParticleNoDirection( "Circus_Hmrman_Fire_06", 0.25, 0.305 )
		else
			pMonster:AddParticleNoDirection( "Circus_Hmrman_Fire_01_R", -0.3, 0.305 )
			pMonster:AddParticleNoDirection( "Circus_Hmrman_Fire_02_R", -0.3, 0.305 )
			pMonster:AddParticleNoDirection( "Circus_Hmrman_Fire_03_R", -0.3, 0.305 )
			pMonster:AddParticleNoDirection( "Circus_Hmrman_Fire_04_R", -0.3, 0.305 )
			pMonster:AddParticleNoDirection( "Circus_Hmrman_Fire_05_R", -0.3, 0.305 )
		end

		pMonster:AddDamage(DT_MON_HAMMERMAN_FIRE)
		pMonster:AddDamage(DT_MON_HAMMERMAN_FIRE_ONEHIT)
		
		pMonster:PlaySound(983010)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function Carnival_HammerMan_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame > 11 and pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
	
	if( iFrame == 11 ) then
		Carnival_HammerMan_Jump( iMonsterIndex )
	end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 다운 상태
function Carnival_HammerMan_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function Carnival_HammerMan_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function Carnival_HammerMan_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Carnival_HammerMan_IceCurseFunc( iMonsterIndex, iFrame )
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
function Carnival_HammerMan_HoldFunc( iMonsterIndex, iFrame )
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

function Carnival_HammerMan_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -330, 360, 330, -300 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function Carnival_HammerMan_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -550, 360, 550, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Carnival_HammerMan_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Carnival_HammerMan_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -240, 460, 240, -500 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Carnival_HammerMan_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -240, 460, 240, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Carnival_HammerMan_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Carnival_HammerMan_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 120, -120, 50, 120, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Carnival_HammerMan_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 50, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Carnival_HammerMan_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -400, 300, 400, -300 ) == true and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Carnival_HammerMan_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -150, 50, 150, -100 ) == true and pMonster:FloatRand() < 0.75 ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function Carnival_HammerMan_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 400, 200, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Carnival_HammerMan_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Carnival_HammerMan_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -200, -100, 200, -400 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function Carnival_HammerMan_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- 어슬렁대기..  방향 바꾸기 후 이동
function Carnival_HammerMan_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- 어슬렁대는 중.. 멈추기
function Carnival_HammerMan_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnCarnival_HammerMan_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end   
end

function OnCarnival_HammerMan_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnCarnival_HammerMan_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedY( 0.0 )
    pMonster:SetPushCheck( true )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
	
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if ( pMonster:FloatRand() < 0.05 and pMonster:GetIsContact() == true ) then
			if ( pMonster:FloatRand() < 0.5 ) then
				if( pMonster:CheckTargetInRange( 100, -300, 50, 300, -100 ) == true ) then
					pMonster:TurnToTarget()
					pMonster:SetState( "ATTACK02" )
				else
					pMonster:SetState( "ATTACK03" )
				end
			else
				pMonster:SetState( "ATTACK03" )
			end
		end
	end
end

function Carnival_HammerMan_Jump( iMonsterIndex )
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

function Carnival_HammerMan_MoveFail( iMonsterIndex )
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

function Carnival_HammerMan_IdleMoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetIsRight() == true ) then
            pMonster:SetIsRight( false )
            pMonster:SetSpeedX( -0.005 )        
        else
            pMonster:SetIsRight( true )
            pMonster:SetSpeedX( 0.005 )        
        end    
        
        pMonster:SetState( "IDLE" )			        
	end
end
