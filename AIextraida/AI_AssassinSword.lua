-- AI_AssassinSword.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "AssassinSword_Wait.frm",
        Func    = "AssassinSword_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "AssassinSword_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 330,
                AIFunc              = "AssassinSword_Check_ReleaseTarget",
                DelayFrame          = 660,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "AssassinSword_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 달리기
            {
                AICheckFrame        = 55,
                AIFunc              = "AssassinSword_Check_Run",
                DelayFrame          = 75,
            },
            -- 공격01
            {
                AICheckFrame        = 15,
                AIFunc              = "AssassinSword_Check_Attack01",
                DelayFrame          = 75,
            },
            -- 공격02
			{
                AICheckFrame        = 165,
                AIFunc              = "AssassinSword_Check_Attack02",
                DelayFrame          = 165,
            },
			-- 점프공격
			{
                AICheckFrame        = 110,
                AIFunc              = "AssassinSword_Check_JumpAttack",
                DelayFrame          = 110,
            },
            -- 하이점프
            {
                AICheckFrame        = 55,
                AIFunc              = "AssassinSword_Check_HighJump",
                DelayFrame          = 55,
            },
            -- 점프다운
            {
                AICheckFrame        = 220,
                AIFunc              = "AssassinSword_Check_JumpDown",
                DelayFrame          = 220,
            },
            -- 어슬렁대기(이동)
            {
                AICheckFrame        = 110,
                AIFunc              = "AssassinSword_Check_Idle",
                DelayFrame          = 110,
            },
        }
    },

    -- 어슬렁대기
    {
        ID      = "IDLE",
        Motion  = "AssassinSword_Walk.frm",
        Func    = "AssassinSword_IdleFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "AssassinSword_IdleMoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "AssassinSword_Check_Targeting",
                DelayFrame          = 110,
            },

            -- 어슬렁대기(멈춤)
            {
                AICheckFrame        = 440,
                AIFunc              = "AssassinSword_Check_Idle_Stop",
                DelayFrame          = 440,
            },
        }
    },

    -- 달리기
    {
        ID      = "RUN",
        Motion  = "AssassinSword_Run.frm",
        Func    = "AssassinSword_RunFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "AssassinSword_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "AssassinSword_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 330,
                AIFunc              = "AssassinSword_Check_ReleaseTarget",
                DelayFrame          = 660,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 35,
                AIFunc              = "AssassinSword_Check_TurnToTarget",
                DelayFrame          = 35,
            },
            -- 공격01
            {
                AICheckFrame        = 15,
                AIFunc              = "AssassinSword_Check_Attack01",
                DelayFrame          = 55,
            },
			-- 점프공격
			{
                AICheckFrame        = 110,
                AIFunc              = "AssassinSword_Check_JumpAttack",
                DelayFrame          = 110,
            },
             -- 정지
            {
                AICheckFrame        = 55,
                AIFunc              = "AssassinSword_Check_RunStop",
                DelayFrame          = 110,
            },
        }
    },

    -- 공격01
    {
        ID      = "ATTACK01",
        Motion  = "AssassinSword_Attack01.frm",
        Func    = "AssassinSword_Attack01Func",
    },
    -- 공격02
    {
        ID      = "ATTACK02",
        Motion  = "AssassinSword_Attack02.frm",
        Func    = "AssassinSword_Attack02Func",
    },	
    -- 반격
    {
        ID      = "ATTACK03",
        Motion  = "AssassinSword_Attack03.frm",
        Func    = "AssassinSword_Attack03Func",
    },
	-- 막기
    {
        ID      = "DEFFENSE",
        Motion  = "AssassinSword_Deffense.frm",
        Func    = "AssassinSword_DeffenseFunc",
    },
	-- 점프공격
    {
        ID      = "JUMPATTACK",
        Motion  = "AssassinSword_JumpAttack.frm",
        Func    = "AssassinSword_JumpAttackFunc",
    },    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "AssassinSword_Jump.frm",
        Func    = "AssassinSword_JumpFunc",
    },
    
    -- 화살방어
    {
        ID      = "DEFENCE_ARROW",
        Motion  = "AssassinSword_DeffenseArrow.frm",
        Func    = "AssassinSword_Defence_ArrowFunc",
    },

    -- 하이점프
    {
        ID      = "HIGHJUMP",
        Motion  = "AssassinSword_Jump.frm",
        Func    = "AssassinSword_HighJumpFunc",
    },
    
    -- 점프착지
    {
        ID      = "JUMP_LANDING",
        Motion  = "AssassinSword_Jump.frm",
        Func    = "AssassinSword_JumpLandingFunc",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "AssassinSword_Damage_Up.frm",
        Func    = "AssassinSword_DamageFunc",
    },

    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "AssassinSword_Damage_Middle.frm",
        Func    = "AssassinSword_DamageFunc",
    },

    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "AssassinSword_Damage_Down.frm",
        Func    = "AssassinSword_DamageFunc",
    },

    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "AssassinSword_Down_Up01.frm",
        Func    = "AssassinSword_DownUpFunc",

        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "AssassinSword_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },

    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "AssassinSword_Down_Up02.frm",
        Func    = "AssassinSword_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },

	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "AssassinSword_Down_Up03.frm",
        Func    = "AssassinSword_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "AssassinSword_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "AssassinSword_Down_Middle.frm",
        Func    = "AssassinSword_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "AssassinSword_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "AssassinSword_Down_Down.frm",
        Func    = "AssassinSword_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "AssassinSword_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "AssassinSword_Down_Special01.frm",
        Func    = "AssassinSword_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },

    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "AssassinSword_Down_Special02.frm",
        Func    = "AssassinSword_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "AssassinSword_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 죽기
    {
        ID      = "DIE",
        Motion  = "AssassinSword_Die01.frm",
        Func    = "AssassinSword_DieFunc",
        IsFallDownMotion    = TRUE,
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "AssassinSword_Die02.frm",
        Func    = "AssassinSword_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽은척 하기
    {
        ID                  = "DIE_PRETEND",
        Motion              = "AssassinSword_Die02.frm",
        Func                = "AssassinSword_DiePretendFunc",
        IsFallDownMotion    = TRUE,
    },

    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "AssassinSword_Standup.frm",
        Func    = "AssassinSword_StandupFunc",
    },
	
	-- 기상공격
    {
        ID      = "STANDUP_ATTACK",
        Motion  = "AssassinSword_StandupAttack.frm",
        Func    = "AssassinSword_StandupAttackFunc",
    },

    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "AssassinSword_Stone.frm",
        Func    = "AssassinSword_StoneCurseFunc",
    },

    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "AssassinSword_Stone.frm",
        Func    = "AssassinSword_IceCurseFunc",
    },
	-- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "AssassinSword_Stone.frm",
		Func	= "AssassinSword_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnAssassinSword_Land",
    Die     = "OnAssassinSword_Die",
    Damage  = "OnAssassinSword_Damage",
    DefenceArrow = "OnAssassinSword_DefenceArrow",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitAssassinSword( iMonsterIndex )
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
function AssassinSword_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end


end

-- 어슬렁대기 상태
function AssassinSword_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() / 2.0 )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end

end

-- 달리기 상태
function AssassinSword_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end

end

-- 죽는상태
function AssassinSword_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	    pMonster:PlaySound( 1020 )
        pMonster:SetState( "DIE_PRETEND" )
    end
end

-- 죽는상태 착지
function AssassinSword_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )

	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 죽은척!
function AssassinSword_DiePretendFunc( iMonsterIndex, iFrame )
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
function AssassinSword_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 2 ) then		
		pMonster:PlaySound( 1019 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function AssassinSword_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
	elseif( iFrame == 2 ) then		
		pMonster:PlaySound( 1019 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function AssassinSword_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운
function AssassinSword_DownFunc( iMonsterIndex, iFrame )
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
function AssassinSword_DownDownFunc( iMonsterIndex, iFrame )
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
function AssassinSword_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function AssassinSword_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function AssassinSword_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 21 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 기상공격
function AssassinSword_StandupAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 28 ) then
		pMonster:PlaySound(561)
		pMonster:AddDamage( DT_ASSASSIN_SWORD01_01 )
	elseif( iFrame == 38 ) then
		pMonster:PlaySound(561)
		pMonster:AddDamage( DT_ASSASSIN_SWORD03 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  공격 상태01
function AssassinSword_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame == 36) then
        pMonster:PlaySound(561)
        pMonster:PlaySound( 1017 )
        pMonster:AddDamage( DT_ASSASSIN_SWORD01_01 )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
	elseif( iFrame == 56) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
    elseif( iFrame == 68) then
        pMonster:PlaySound(2)
        pMonster:PlaySound(561)
		pMonster:PlaySound( 1017 )
        pMonster:AddDamage( DT_ASSASSIN_SWORD01_02 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  공격 상태02
function AssassinSword_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= 26 and iFrame < 116 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 1.0 )
	end
	
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 36 ) then
		pMonster:PlaySound(1018)
		pMonster:PlaySound(561)
		pMonster:AddDamage( DT_ASSASSIN_SWORD02_01 )
	elseif( iFrame == 51 ) then
		pMonster:PlaySound(561)
		pMonster:AddDamage( DT_ASSASSIN_SWORD02_01 )
	elseif( iFrame == 68 ) then
		pMonster:PlaySound(561)
		pMonster:AddDamage( DT_ASSASSIN_SWORD02_01 )
	elseif( iFrame == 83 ) then
		pMonster:PlaySound(561)
		pMonster:AddDamage( DT_ASSASSIN_SWORD02_01 )
	elseif( iFrame == 98 ) then
		pMonster:PlaySound(561)
		pMonster:AddDamage( DT_ASSASSIN_SWORD02_01 )
	elseif( iFrame == 113 ) then
		pMonster:PlaySound(561)
		pMonster:AddDamage( DT_ASSASSIN_SWORD01_02 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  공격 상태03
function AssassinSword_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 2 ) then
		pMonster:AddDamage( DT_DEFENCE )    
		pMonster:PlaySound(754)
	elseif( iFrame == 44 ) then
		pMonster:PlaySound(561)
		pMonster:AddDamage( DT_ASSASSIN_SWORD01_02 )
    elseif ( iFrame == pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  막기
function AssassinSword_DeffenseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 2 ) then
		pMonster:AddDamage( DT_DEFENCE )    
		pMonster:PlaySound(754)
    elseif ( iFrame == pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프공격 상태
function AssassinSword_JumpAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= 16 and iFrame < 41 ) then		
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.5 )
		
		if( iFrame == 16 ) then
			pMonster:SetNoCheckContact(30)
			pMonster:SetSpeedY( 0.025 )
		elseif( iFrame == 38 ) then
			pMonster:PlaySound(561)
			pMonster:AddDamage( DT_ASSASSIN_SWORD01_01 )
		end
	elseif( iFrame == 51 ) then
		pMonster:PlaySound(561)
		pMonster:AddDamage( DT_ASSASSIN_SWORD01_02 )
    elseif ( iFrame == pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 화살 방어
function AssassinSword_Defence_ArrowFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( 3 == iFrame ) then
        pMonster:AddDamage( DT_DEFENCE )    
		pMonster:PlaySound(12)
        pMonster:AddCountValue( 1 )   
    elseif( pMonster:GetLastFrame() == iFrame ) then
        pMonster:SetState( "WAIT" )
    end
end


--  점프 상태
function AssassinSword_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "JUMP" )
    end

end

--  하이점프 상태
function AssassinSword_HighJumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    
    if( pMonster:GetIsContact() == true ) then
        pMonster:SetState( "JUMP_LANDING" )
    end
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

function AssassinSword_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  스톤커스 걸렸음
function AssassinSword_StoneCurseFunc( iMonsterIndex, iFrame )
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
function AssassinSword_IceCurseFunc( iMonsterIndex, iFrame )
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
function AssassinSword_HoldFunc( iMonsterIndex, iFrame )
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

function AssassinSword_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -300 ) == true ) then
		pMonster:TurnToTarget()

		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end

        pMonster:ResetDelay()
    end
end

function AssassinSword_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -600, 600, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end

function AssassinSword_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function AssassinSword_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -150 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "RUN" )
		pMonster:ResetDelay()
    end
end

function AssassinSword_Check_RunStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -160, 150, 160, -200 ) == true or pMonster:CheckTargetInRange( 400, -300, 200, 300, -250 ) == false ) then
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
    end
end

function AssassinSword_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function AssassinSword_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckTargetInRange( 120, -120, 130, 120, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function AssassinSword_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckTargetInRange( 300, -300, 120, 300, -100 ) == true and pMonster:GetCountValue() >= 3 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function AssassinSword_Check_JumpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckTargetInRange( 300, -100, 120, 100, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "JUMPATTACK" )
		pMonster:ResetDelay()
    end
end

function AssassinSword_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if ( pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
        if( pMonster:CheckTargetInRange( 100, -100, 400, 100, 120 ) == true) then
		    AssassinSword_Jump( iMonsterIndex )
		    pMonster:SetState( "HIGHJUMP" )
		    pMonster:ResetDelay()
        end
    end
end

function AssassinSword_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 100, -100, -40, 100, -300 ) == true ) then
		pMonster:SetNoCheckContact(25)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function AssassinSword_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		if( pMonster:CheckTargetInRange( 120, -120, 160, 120, -100 ) == true ) then
			if ( pMonster:FloatRand() < 0.4) then
				pMonster:SetState( "STANDUP_ATTACK" )				
			else
				pMonster:SetState( "STANDUP" )
			end			
		else
			pMonster:SetState( "STANDUP" )
		end
    end
end

-- 어슬렁대기..
function AssassinSword_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
		pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- 어슬렁대는 중.. 멈추기
function AssassinSword_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnAssassinSword_Land( iMonsterIndex )
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

function OnAssassinSword_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()

		if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.015 )
		else
			pMonster:SetSpeedX( 0.015 )
		end
        pMonster:SetState( "DIE" )
	end

end

function OnAssassinSword_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetPushCheck( true )
	
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
		
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		if( pMonster:FloatRand() < 0.2 and pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false ) then
			if( pMonster:CheckTargetInRange( 100, -110, 130, 110, -100 ) == true and pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
				pMonster:SetSuperArmor(true)
				pMonster:SetState( "ATTACK03" )
			elseif( pMonster:CheckTargetInRange( -100, -110, 130, 110, -100 ) == true and pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
				pMonster:TurnToTarget()
				pMonster:SetSuperArmor(true)
				pMonster:SetState( "DEFFENSE" )
			end
		end
	end

end


function OnAssassinSword_DefenceArrow( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( pMonster:CheckState( "WAIT" ) or pMonster:CheckState( "WALK" ) or pMonster:CheckState( "RUN" ) 
        or pMonster:CheckState( "IDLE" ) or pMonster:CheckState( "DEFENCE_ARROW" ) ) then
        pMonster:SetState( "DEFENCE_ARROW" )
    else
        pMonster:DirectMotionInput("DAMAGE_MIDDLE")
        OnAssassinSword_Damage( iMonsterIndex )
    end
end



function AssassinSword_Jump( iMonsterIndex )
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

function AssassinSword_MoveFail( iMonsterIndex )
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

function AssassinSword_IdleMoveFail( iMonsterIndex )
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

