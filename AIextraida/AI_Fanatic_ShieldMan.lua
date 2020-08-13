-- AI_Fanatic_ShieldMan.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Fanatic_ShieldMan_Wait.frm",
        Func    = "Fanatic_ShieldManSap_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "Fanatic_ShieldMan_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 330,
                AIFunc              = "Fanatic_ShieldMan_Check_ReleaseTarget",
                DelayFrame          = 660,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "Fanatic_ShieldMan_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 달리기
            {
                AICheckFrame        = 15,
                AIFunc              = "Fanatic_ShieldMan_Check_Run",
                DelayFrame          = 60,
            },
            -- 공격01
            {
                AICheckFrame        = 15,
                AIFunc              = "Fanatic_ShieldMan_Check_Attack01",
                DelayFrame          = 90,
            },
            -- 공격02 -방패 밀기 
			{
                AICheckFrame        = 25,
                AIFunc              = "Fanatic_ShieldMan_Check_Attack02",
                DelayFrame          = 55,
            },
            -- 공격03
			{
                AICheckFrame        = 65,
                AIFunc              = "Fanatic_ShieldMan_Check_Attack03",
                DelayFrame          = 130,
            },

            -- 하이점프
            {
                AICheckFrame        = 75,
                AIFunc              = "Fanatic_ShieldMan_Check_HighJump",
                DelayFrame          = 75,
            },
            -- 점프다운
            {
                AICheckFrame        = 220,
                AIFunc              = "Fanatic_ShieldMan_Check_JumpDown",
                DelayFrame          = 220,
            },
            -- 어슬렁대기(이동)
            {
                AICheckFrame        = 110,
                AIFunc              = "Fanatic_ShieldMan_Check_Idle",
                DelayFrame          = 110,
            },
        }
    },

    -- 어슬렁대기
    {
        ID      = "IDLE",
        Motion  = "Fanatic_ShieldMan_Walk.frm",
        Func    = "Fanatic_ShieldMan_IdleFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Fanatic_ShieldMan_IdleMoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "Fanatic_ShieldMan_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 공격03
			{
                AICheckFrame        = 65,
                AIFunc              = "Fanatic_ShieldMan_Check_Attack03",
                DelayFrame          = 100,
            },

            -- 어슬렁대기(멈춤)
            {
                AICheckFrame        = 440,
                AIFunc              = "Fanatic_ShieldMan_Check_Idle_Stop",
                DelayFrame          = 440,
            },
        }
    },

    -- 달리기
    {
        ID      = "RUN",
        Motion  = "Fanatic_ShieldMan_Walk.frm",
        Func    = "Fanatic_ShieldMan_RunFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Fanatic_ShieldMan_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "Fanatic_ShieldMan_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 330,
                AIFunc              = "Fanatic_ShieldMan_Check_ReleaseTarget",
                DelayFrame          = 660,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 35,
                AIFunc              = "Fanatic_ShieldMan_Check_TurnToTarget",
                DelayFrame          = 35,
            },
            -- 공격01
            {
                AICheckFrame        = 15,
                AIFunc              = "Fanatic_ShieldMan_Check_Attack01",
                DelayFrame          = 110,
            },
             -- 정지
            {
                AICheckFrame        = 55,
                AIFunc              = "Fanatic_ShieldMan_Check_RunStop",
                DelayFrame          = 110,
            },
        }
    },

    -- 공격01
    {
        ID      = "ATTACK01",
        Motion  = "Fanatic_ShieldMan_Attack01.frm",
        Func    = "Fanatic_ShieldMan_Attack01Func",
    },
    -- 공격02
    {
        ID      = "ATTACK02",
        Motion  = "Fanatic_ShieldMan_Attack02.frm",
        Func    = "Fanatic_ShieldMan_Attack02Func",
    },
    -- 방패로 반사
    {
        ID      = "ATTACK03",
        Motion  = "Fanatic_ShieldMan_Attack03.frm",
        Func    = "Fanatic_ShieldMan_Attack03Func",
    },
   
    -- 방패로 반사 반격
    {
        ID      = "ATTACK03_COUNTER",
        Motion  = "Fanatic_ShieldMan_Attack03_Conuter.frm",
        Func    = "Fanatic_ShieldMan_Attack03_ConuterFunc",
    },
    
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Fanatic_ShieldMan_Jump.frm",
        Func    = "Fanatic_ShieldMan_JumpFunc",
    },

    -- 하이점프
    {
        ID      = "HIGHJUMP",
        Motion  = "Fanatic_ShieldMan_Jump.frm",
        Func    = "Fanatic_ShieldMan_HighJumpFunc",
    },
    
    --
    {
        ID      = "JUMP_LANDING",
        Motion  = "Fanatic_ShieldMan_Jump.frm",
        Func    = "Fanatic_ShieldMan_JumpLandingFunc",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Fanatic_ShieldMan_Damage_Up.frm",
        Func    = "Fanatic_ShieldMan_DamageFunc",
    },

    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Fanatic_ShieldMan_Damage_Middle.frm",
        Func    = "Fanatic_ShieldMan_DamageFunc",
    },

    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Fanatic_ShieldMan_Damage_Down.frm",
        Func    = "Fanatic_ShieldMan_DamageFunc",
    },

    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "Fanatic_ShieldMan_Down_Up01.frm",
        Func    = "Fanatic_ShieldMan_DownUpFunc",

        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Fanatic_ShieldMan_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },

    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "Fanatic_ShieldMan_Down_Up02.frm",
        Func    = "Fanatic_ShieldMan_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },

	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Fanatic_ShieldMan_Down_Up03.frm",
        Func    = "Fanatic_ShieldMan_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Fanatic_ShieldMan_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Fanatic_ShieldMan_Down_Middle.frm",
        Func    = "Fanatic_ShieldMan_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Fanatic_ShieldMan_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "Fanatic_ShieldMan_Down_Down.frm",
        Func    = "Fanatic_ShieldMan_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Fanatic_ShieldMan_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Fanatic_ShieldMan_Down_Special01.frm",
        Func    = "Fanatic_ShieldMan_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },

    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Fanatic_ShieldMan_Down_Special02.frm",
        Func    = "Fanatic_ShieldMan_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Fanatic_ShieldMan_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Fanatic_ShieldMan_Die01.frm",
        Func    = "Fanatic_ShieldMan_DieFunc",
        IsFallDownMotion    = TRUE,
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Fanatic_ShieldMan_Die02.frm",
        Func    = "Fanatic_ShieldMan_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽은척 하기
    {
        ID                  = "DIE_PRETEND",
        Motion              = "Fanatic_BombMan_Die02.frm",
        Func                = "Fanatic_ShieldMan_DiePretendFunc",
        IsFallDownMotion    = TRUE,
    },


    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Fanatic_ShieldMan_Standup.frm",
        Func    = "Fanatic_ShieldMan_StandupFunc",
    },

    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Fanatic_ShieldMan_Stone.frm",
        Func    = "Fanatic_ShieldMan_StoneCurseFunc",
    },

    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Fanatic_ShieldMan_Stone.frm",
        Func    = "Fanatic_ShieldMan_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Fanatic_ShieldMan_Stone.frm",
		Func	= "Fanatic_ShieldMan_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnFanatic_ShieldMan_Land",
    Die     = "OnFanatic_ShieldMan_Die",
    Damage  = "OnFanatic_ShieldMan_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitFanatic_ShieldMan( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )

    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )

    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
    

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Fanatic_ShieldMan_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end


end

-- 어슬렁대기 상태
function Fanatic_ShieldMan_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end

end

-- 달리기 상태
function Fanatic_ShieldMan_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end

end

-- 죽는상태
function Fanatic_ShieldMan_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	    pMonster:PlaySound( 579 )
        pMonster:SetState( "DIE_PRETEND" )
    end
end

-- 죽는상태 착지
function Fanatic_ShieldMan_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )

	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 죽은척!
function Fanatic_ShieldMan_DiePretendFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
        local bFoundMedic = false
        
        for i = 0 , MAX_MONSTER-1 do
			local pTarget = g_MyD3D:GetMonster( i )
			if( pTarget:IsLive() and pTarget:GetMonsterType() == MON_FANATIC_PRIEST ) then
				bFoundMedic = true				
			end		
		end
		
		if ( bFoundMedic == false ) then
			pMonster:EndMonster()
		end
		
		if ( pMonster:GetHP() > 0 ) then
		    pMonster:SetState( "STANDUP" )
		end
		
    end
end

-- 데미지 입은거
function Fanatic_ShieldMan_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function Fanatic_ShieldMan_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function Fanatic_ShieldMan_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운
function Fanatic_ShieldMan_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )

		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_PRETEND" )
		end
    end
end

-- 다운 다운
function Fanatic_ShieldMan_DownDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 7 ) then
		pMonster:SetNoCheckContact( 15 )
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 5 )
		pMonster:SetSpeedY( 0.03 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
			pMonster:SetState( "DOWN_UP01" )
    end
end

-- 다운 스페셜
function Fanatic_ShieldMan_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function Fanatic_ShieldMan_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_PRETEND" )
		end
    end
end

-- 일어나기
function Fanatic_ShieldMan_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 21 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  공격 상태01
function Fanatic_ShieldMan_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame == 34) then
        pMonster:PlaySound( 580 )
        pMonster:PlaySound( 582 )
        pMonster:AddDamage( DT_SHIELDMAN_1_01 )
    elseif( iFrame == 64) then
        pMonster:PlaySound( 580 )
        pMonster:PlaySound( 582 )
        pMonster:AddDamage( DT_SHIELDMAN_1_02 )
	elseif( iFrame == 106) then
	    pMonster:PlaySound( 581 )
	    pMonster:PlaySound( 582 )
		pMonster:AddDamage( DT_SHIELDMAN_1_03 )
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( 0.01 )
		else
			pMonster:SetSpeedX( -0.01 )
	end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end
--  공격 상태02
function Fanatic_ShieldMan_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )

	elseif( iFrame == 31 ) then
	    pMonster:PlaySound( 578 )
	    pMonster:PlaySound( 582 )
		pMonster:AddDamage( DT_SHIELDMAN_2 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function Fanatic_ShieldMan_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "JUMP" )
    end

end

--  하이점프 상태
function Fanatic_ShieldMan_HighJumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    
    if( pMonster:GetIsContact() == true ) then
        pMonster:SetState( "JUMP_LANDING" )
    end
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

function Fanatic_ShieldMan_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end




--  스톤커스 걸렸음
function Fanatic_ShieldMan_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )

        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  아이스커스 걸렸음
function Fanatic_ShieldMan_IceCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE" )
		end
    end
end


-- 홀드 걸렸음(이펙트)
function Fanatic_ShieldMan_HoldFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE" )
		end
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Fanatic_ShieldMan_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -300 ) == true ) then
		pMonster:TurnToTarget()

		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end

        pMonster:ResetDelay()
    end
end

function Fanatic_ShieldMan_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -600, 600, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end

function Fanatic_ShieldMan_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Fanatic_ShieldMan_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 550, -500, 500, 500, -500 ) == true ) then
			pMonster:TurnToTarget()
            pMonster:SetState( "RUN" )
            pMonster:ResetDelay()
    end
end

function Fanatic_ShieldMan_Check_RunStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -160, 140, 160, -200 ) == true or pMonster:CheckTargetInRange( 400, -300, 200, 300, -250 ) == false ) then
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
    end
end

function Fanatic_ShieldMan_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Fanatic_ShieldMan_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckTargetInRange( 100, -140, 180, 180, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end
function Fanatic_ShieldMan_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckTargetInRange( 70, -100, 100, 80, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Fanatic_ShieldMan_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if ( pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
        if( pMonster:CheckTargetInRange( 100, -100, 400, 100, 150 ) == true) then
		    Fanatic_ShieldMan_Jump( iMonsterIndex )
		    pMonster:SetState( "HIGHJUMP" )
		    pMonster:ResetDelay()
        end
    end
end

function Fanatic_ShieldMan_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 100, -100, -80, 100, -300 ) == true ) then
		pMonster:SetNoCheckContact(25)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Fanatic_ShieldMan_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- 어슬렁대기..
function Fanatic_ShieldMan_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
		pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- 어슬렁대는 중.. 멈추기
function Fanatic_ShieldMan_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnFanatic_ShieldMan_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
		pMonster:SetState( "DOWN_UP_LANDING" )
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )
    end
end

function OnFanatic_ShieldMan_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()

		if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.02 )
		else
			pMonster:SetSpeedX( 0.02 )
		end
        pMonster:SetState( "DIE" )
	end

end

function OnFanatic_ShieldMan_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( pMonster:CheckPreState( "ATTACK03" ) ) then
	    if ( pMonster:IsBackAttack() == false ) then
	        pMonster:SetState( "ATTACK02" )
	    end
	else
		pMonster:SetPushCheck( true )
	    pMonster:PlaySound( 577 )
	    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true ) then
	        if( pMonster:IsSuperArmor() == false ) then
	            pMonster:SetNoCheckContact( 5 )
	        end
		end

		if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )
		end

		if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
			pMonster:SetNoCheckContact( 25 )
			if( pMonster:CheckState( "DAMAGE_UP" )) then
				pMonster:SetSpeedX( pMonster:GetSpeedX() / 3 )
				pMonster:SetSpeedY( 0.024 )
				pMonster:SetState( "DOWN_UP01" )
			elseif( pMonster:CheckState( "DOWN_UP01" )) then
				pMonster:SetSpeedY( 0.032 )
				pMonster:SetState( "DOWN_UP01" )
			elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" )) then
				pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
				pMonster:SetSpeedY( 0.02 )
				pMonster:SetState( "DOWN_UP01" )
			elseif( pMonster:CheckState( "DAMAGE_DOWN" )) then
				pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
				pMonster:SetSpeedY( 0.02 )
				pMonster:SetState( "DOWN_UP01" )
			end
		end

		if( pMonster:CheckState( "DOWN_DOWN" ) and pMonster:GetIsContact() == false) then
			if( pMonster:GetIsRight() == true) then
				pMonster:SetSpeedX( -0.025 )
			else
				pMonster:SetSpeedX( 0.025 )
			end
			pMonster:SetNoCheckContact( 5 )
			pMonster:SetSpeedY( -0.04 )
			pMonster:SetState( "DOWN_MIDDLE" )
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )
		end
	end
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		if( pMonster:FloatRand() < 0.1 and pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK02" )
		end
	end

end


function Fanatic_ShieldMan_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()

	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()

	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))

	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Fanatic_ShieldMan_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then
		if( pMonster:GetY() - (0.06) < pMonster:GetTargetY() )then
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.036 )
		else
			pMonster:SetNoCheckContact(12)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.008 )
		end
	end
end

function Fanatic_ShieldMan_IdleMoveFail( iMonsterIndex )
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

