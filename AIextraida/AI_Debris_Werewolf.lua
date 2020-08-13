-- AI_werewolf.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "werewolf_Wait.frm",
        Func    = "werewolf_WaitFunc",

        Trigger =
        {
        
			-- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "werewolf_Check_Targeting",
                DelayFrame          = 40,
            },

            -- 타겟지움
            {
                AICheckFrame        = 300,
                AIFunc              = "werewolf_Check_ReleaseTarget",
                DelayFrame          = 200,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 15,
                AIFunc              = "werewolf_Check_TurnToTarget",
                DelayFrame          = 10,
            },

            -- 달리기 [50%]
            {
                AICheckFrame        = 40,
                AIFunc              = "werewolf_Check_Run",
                DelayFrame          = 160,
            },

            -- 점프업
            {
                AICheckFrame        = 65,
                AIFunc              = "werewolf_Check_JumpUp",
                DelayFrame          = 35,
            },        

            -- 점프다운
            {
                AICheckFrame        = 45,
                AIFunc              = "werewolf_Check_JumpDown",
                DelayFrame          = 35,
            },

			-- 클로 어택 [50%]
            {
                AICheckFrame        = 20,
                AIFunc              = "werewolf_Check_Attack01",
                DelayFrame          = 130,
            },

            -- 점핑 크로(Up) [50%]
            {
                AICheckFrame        = 25,
                AIFunc              = "werewolf_Check_Attack02_UP",
                DelayFrame          = 65,
            },

            -- 점핑 크로(Down) [50%]
            {
                AICheckFrame        = 10,
                AIFunc              = "werewolf_Check_Attack02_DOWN",
                DelayFrame          = 40,
            },

            -- 울버린 스트라이크 [50%]
            {
                AICheckFrame        = 30,
                AIFunc              = "werewolf_Check_Attack03",
                DelayFrame          = 90,
            },

        },
    },

    -- 이동
    {
        ID              = "RUN",
        Motion          = "werewolf_run.frm",
        Func            = "werewolf_runFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "werewolf_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 30,
                AIFunc              = "werewolf_Check_Targeting",
                DelayFrame          = 30,
            },
            -- 타겟지움
            {
                AICheckFrame        = 200,
                AIFunc              = "werewolf_Check_ReleaseTarget",
                DelayFrame          = 100,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 10,
                AIFunc              = "werewolf_Check_TurnToTarget",
                DelayFrame          = 15,
            },
            -- 점프다운
            {
                AICheckFrame        = 22,
                AIFunc              = "werewolf_Check_JumpDown",
                DelayFrame          = 10,
            },
            -- 점핑 크로(Up) [50%]
            {
                AICheckFrame        = 25,
                AIFunc              = "werewolf_Check_Attack02_UP",
                DelayFrame          = 35,
            },

            -- 점핑 크로(Down) [50%]
            {
                AICheckFrame        = 10,
                AIFunc              = "werewolf_Check_Attack02_DOWN",
                DelayFrame          = 10,
            },
            -- 멈추기
            {
                AICheckFrame        = 5,
                AIFunc              = "werewolf_Check_Stop",
                DelayFrame          = 25,
            },
        }
    },
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "werewolf_Attack01.frm",
        Func    = "werewolf_Attack01Func",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK02",
        Motion  = "werewolf_Attack02_01.frm",
        Func    = "werewolf_Attack02Func",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK02_DOWN",
        Motion  = "werewolf_Attack02_02.frm",
        Func    = "werewolf_Attack02DownFunc",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK02_LANDING",
        Motion  = "werewolf_Attack02_03.frm",
        Func    = "werewolf_Attack02LandingFunc",
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK03",
        Motion  = "werewolf_Attack03.frm",
        Func    = "werewolf_Attack03Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "werewolf_Jump_Up.frm",
        Func    = "werewolf_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "werewolf_Jump_Down.frm",
        Func    = "werewolf_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "werewolf_Jump_Landing.frm",
        Func    = "werewolf_ToWait",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "werewolf_Damage_Middle.frm",
        Func    = "werewolf_DamageFunc",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "werewolf_Die.frm",
        Func    = "werewolf_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "werewolf_stone.frm",
        Func    = "werewolf_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "werewolf_stone.frm",
        Func    = "werewolf_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "werewolf_stone.frm",
		Func	= "werewolf_HoldFunc",
	},
}

CallBack =
{
    Land    = "Onwerewolf_Land",
    Die     = "Onwerewolf_Die",
    Damage  = "Onwerewolf_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function Initwerewolf( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_MIDDLE" )
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_MIDDLE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_MIDDLE" )
    
    pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
    
    pMonster:AddParticle( "Iblis_Teleport_01", 0.0, 0.28 )
    pMonster:AddParticle( "Iblis_Teleport_02", 0.0, 0.28 )
    pMonster:AddParticle( "Iblis_Teleport_03", 0.0, 0.28 )
    pMonster:AddParticle( "Debris_Tel_out", 0.0, 0.28 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function werewolf_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:TurnToTarget()
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function werewolf_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 걷기 상태
function werewolf_runFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

-- 죽기 착지
function werewolf_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(984023)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function werewolf_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function werewolf_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--오른쪽일 경우에는 _R을 붙여야 오른쪽 파티클이 나온다.
    local strParticle = "Werewolf_Hook"
    local xPos = -0.6
	if( pMonster:GetIsRight() ) then
		strParticle = "Werewolf_Hook_R"
		xPos = 0.6
	end
	
	if( iFrame <= 1 ) then
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 51 ) then
        pMonster:AddDamage(DT_DEBRIS_WEREWOLF_ATK1)
		pMonster:AddParticleNoDirection( strParticle, xPos, 0.27 )
		pMonster:PlaySound(984016)
    elseif( iFrame == 68 ) then
        pMonster:AddDamage(DT_DEBRIS_WEREWOLF_ATK1)
		pMonster:AddParticleNoDirection( strParticle, xPos, 0.27 )
		pMonster:PlaySound(984016)
    elseif( iFrame == 81 ) then
        pMonster:AddDamage(DT_DEBRIS_WEREWOLF_ATK1)
		pMonster:AddParticleNoDirection( strParticle, xPos, 0.27 )
		pMonster:PlaySound(984016)
    elseif( iFrame == 98 ) then
        pMonster:AddDamage(DT_DEBRIS_WEREWOLF_ATK1_2)
		pMonster:AddParticleNoDirection( strParticle, xPos, 0.27 )
		pMonster:PlaySound(984016)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  점프 상태
function werewolf_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("ATTACK02_DOWN")
		pMonster:SetFrameLock( false )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 다운 상태
function werewolf_Attack02DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function werewolf_Attack02LandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	local strParticle1 = "Werewolf_Jump_01_R"
	local strParticle2 = "Werewolf_Jump_02_R"
	local xPos = -0.12
	
	if( pMonster:GetIsRight() ) then 
		strParticle1 = "Werewolf_Jump_01"
		strParticle2 = "Werewolf_Jump_02"
		xPos = 0.1
	end 
	
    if( iFrame == 4 ) then
		pMonster:AddDamage(DT_DEBRIS_WEREWOLF_ATK2)
		pMonster:AddParticleNoDirection( strParticle1, xPos, 0.2 )
		pMonster:AddParticleNoDirection( strParticle2, xPos, 0.2 )
		pMonster:PlaySound(984015)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function werewolf_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local strParticleScratch = "Werewolf_Scratch"
	local strParticleScratch_R = "Werewolf_Scratch_R"
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	
	elseif( iFrmae == 3 ) then 
		pMonster:PlaySound(984017)
	elseif( iFrame == 60 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( strParticleScratch, 0.0, 0.0 )
		else 
			pMonster:AddParticleNoDirection( strParticleScratch_R, -0.0, 0.0 )
		end
		
		pMonster:AddParticle( "Jin01_IronMT_Under_03", 0.2, 0.0 )
		pMonster:AddParticle( "Jin01_IronMT_Under_04", 0.2, 0.0 )
	elseif( iFrame == 68 ) then
		pMonster:AddDamageWithLocate(DT_DEBRIS_WEREWOLF_ATK3)
		pMonster:PlaySound(984017)
	elseif( iFrame == 70 ) then
		pMonster:SetPushCheck( false )
	elseif( iFrame == 84 ) then
		pMonster:AddDamageWithLocate(DT_DEBRIS_WEREWOLF_ATK3, -1.6, 0.0 , false, not pMonster:GetIsRight() )
		if( not pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( strParticleScratch, 0.0, 0.0 )
		else 
			pMonster:AddParticleNoDirection( strParticleScratch_R, -0.0, 0.0 )
		end
		pMonster:AddParticle( "Jin01_IronMT_Under_03", 0.2, 0.0 )
		pMonster:AddParticle( "Jin01_IronMT_Under_04", 0.2, 0.0 )
		pMonster:PlaySound(984017)
	elseif( iFrame == 99 ) then
		pMonster:AddDamageWithLocate(DT_DEBRIS_WEREWOLF_ATK3, 0.26, 0.0 , false, not pMonster:GetIsRight() )
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( strParticleScratch, 0.0, 0.0 )
		else 
			pMonster:AddParticleNoDirection( strParticleScratch_R, -0.0, 0.0 )
		end
		pMonster:AddParticle( "Jin01_IronMT_Under_03", 0.2, 0.0 )
		pMonster:AddParticle( "Jin01_IronMT_Under_04", 0.2, 0.0 )
		pMonster:PlaySound(984017)
	elseif( iFrame == 120 ) then
		pMonster:AddDamageWithLocate(DT_DEBRIS_WEREWOLF_ATK3_2)
		pMonster:AddParticle( "Overseer_Smash_02", 0.0, 0.0 )
		pMonster:AddParticle( "Overseer_Spin_02", 0.0, 0.0 )
		pMonster:AddParticle( "Werewolf_Spin", 0.0, 0.0 )
		pMonster:PlaySound(984018)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function werewolf_JumpFunc( iMonsterIndex, iFrame )
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
function werewolf_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function werewolf_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function werewolf_StoneCurseFunc( iMonsterIndex, iFrame )
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
function werewolf_IceCurseFunc( iMonsterIndex, iFrame )
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
function werewolf_HoldFunc( iMonsterIndex, iFrame )
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

function werewolf_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -500, 460, 500, -400 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function werewolf_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -800, 510, 800, -500 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function werewolf_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function werewolf_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -300, 450, 300, -400 ) == false and pMonster:FloatRand() < 0.5 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "RUN" )
			pMonster:ResetDelay()
		end
	end
end

function werewolf_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -300, 450, 300, -400 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function werewolf_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function werewolf_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -160, 50, 160, -100 ) == true and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function werewolf_Check_Attack02_UP( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 330, -330, 510, 330, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		if( pMonster:FloatRand() < 0.5 ) then
			werewolf_Jump( iMonsterIndex )
			pMonster:SetState( "ATTACK02" )
			pMonster:ResetDelay()
		end
	end
end

function werewolf_Check_Attack02_DOWN( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 120, -120, -100, 120, -300 ) == true and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "ATTACK02_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function werewolf_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 260, -240, 80, 240, -100 ) == true and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function werewolf_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, 510, 300, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		werewolf_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function werewolf_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, -100, 300, -500 ) == true ) then
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
function Onwerewolf_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    elseif( pMonster:CheckState( "ATTACK02" ) == true or pMonster:CheckState( "ATTACK02_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK02_LANDING" )
    end
end

function Onwerewolf_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function Onwerewolf_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--[[	
	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		if ( pMonster:FloatRand() < 0.05 and pMonster:GetIsContact() == true ) then
			pMonster:SetState( "ATTACK01" )
		end
	end
	--]]

    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
end

function werewolf_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	
	if (fTargetY - fMonY == 0.0) then
		fTargetY = fMonY + 0.01
	end
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function werewolf_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.06) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.036 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.018 )		
		end
	end
end
