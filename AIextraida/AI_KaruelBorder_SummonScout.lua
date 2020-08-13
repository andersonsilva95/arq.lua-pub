-- AI_KaruelBorder_SummonScout.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Mon_Scout_f_Wait.frm",
        Func    = "KaruelBorderSummonScout_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "KaruelBorderSummonScout_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 100,
                AIFunc              = "KaruelBorderSummonScout_Check_ReleaseTarget",
                DelayFrame          = 50,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderSummonScout_Check_TurnToTarget",
                DelayFrame          = 15,
            },
            -- 걷기
            {
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderSummonScout_Check_Walk",
                DelayFrame          = 110,
            },
            -- 점프업
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderSummonScout_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- 점프다운
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderSummonScout_Check_JumpDown",
                DelayFrame          = 20,
            },
            -- 어슬렁대기(이동)
            {
                AICheckFrame        = 40,
                AIFunc              = "KaruelBorderSummonScout_Check_Idle",
                DelayFrame          = 55,
            },
			-- Attack01
            {
                AICheckFrame        = 25,
                AIFunc              = "KaruelBorderSummonScout_Check_Attack01",
                DelayFrame          = 55,
            },
			-- Attack02
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderSummonScout_Check_Attack02",
                DelayFrame          = 90,
            },
			-- Attack03
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderSummonScout_Check_Attack03",
                DelayFrame          = 110,
            },
        }
    },
    
    -- 이동
    {
        ID              = "WALK",
        Motion          = "Mon_Scout_f_Run.frm",
        Func            = "KaruelBorderSummonScout_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "KaruelBorderSummonScout_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderSummonScout_Check_Targeting",
                DelayFrame          = 40,
            },
            -- 타겟지움
            {
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderSummonScout_Check_ReleaseTarget",
                DelayFrame          = 110,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderSummonScout_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- 점프업
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderSummonScout_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- 점프다운
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderSummonScout_Check_JumpDown",
                DelayFrame          = 20,
            },
			-- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderSummonScout_Check_Stop",
                DelayFrame          = 40,
            },
			-- 어슬렁대기(이동)
            {
                AICheckFrame        = 40,
                AIFunc              = "KaruelBorderSummonScout_Check_Idle",
                DelayFrame          = 160,
            },
        }
    },

    -- 어슬렁대기
    {
        ID              = "IDLE",
        Motion          = "Mon_Scout_f_Run.frm",
        Func            = "KaruelBorderSummonScout_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "KaruelBorderSummonScout_IdleMoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 40,
                AIFunc              = "KaruelBorderSummonScout_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 심심하니깐 방향도 한번씩 바꿔주고.
			{
                AICheckFrame        = 40,
                AIFunc              = "KaruelBorderSummonScout_Check_Turnning",
                DelayFrame          = 110,
            },
            -- 어슬렁대기(멈춤)
            {
                AICheckFrame        = 30,
                AIFunc              = "KaruelBorderSummonScout_Check_Idle_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- Attack01
    {
        ID      = "ATTACK01",
        Motion  = "Mon_Scout_f_Attack01.frm",
        Func    = "KaruelBorderSummonScout_Attack01Func",
    },
    
    -- Attack02
    {
        ID      = "ATTACK02",
        Motion  = "Mon_Scout_f_Attack02.frm",
        Func    = "KaruelBorderSummonScout_Attack02Func",
    },
	
    -- Attack03
    {
        ID      = "ATTACK03",
        Motion  = "Mon_Scout_f_Attack03.frm",
        Func    = "KaruelBorderSummonScout_Attack03Func",
    },
    
    -- 점프 올라가는 중
    {
        ID      = "JUMP",
        Motion  = "Mon_Scout_f_Jump_up.frm",
        Func    = "KaruelBorderSummonScout_JumpFunc",
    },
    
    -- 점프 떨어지는 중
    {
        ID      = "JUMP_DOWN",
        Motion  = "Mon_Scout_f_Jump_down.frm",
        Func    = "KaruelBorderSummonScout_JumpDownFunc",
    },
    
    -- 점프 바닥에 착지
    {
        ID      = "JUMP_LANDING",
        Motion  = "Mon_Scout_f_Jump_landing.frm",
        Func    = "KaruelBorderSummonScout_ToWait",
    },
    
    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Mon_Scout_f_Damage_up.frm",
        Func    = "KaruelBorderSummonScout_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Mon_Scout_f_Damage_middle.frm",
        Func    = "KaruelBorderSummonScout_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Mon_Scout_f_Damage_down.frm",
        Func    = "KaruelBorderSummonScout_DamageFunc",
    },

    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "Mon_Assassin_f_Down_up01.frm",
        Func    = "KaruelBorderSummonScout_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "KaruelBorderSummonScout_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "Mon_Assassin_f_Down_up02.frm",
        Func    = "KaruelBorderSummonScout_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Mon_Assassin_f_Down_up03.frm",
        Func    = "KaruelBorderSummonScout_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "KaruelBorderSummonScout_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Mon_Assassin_f_Down_Middle.frm",
        Func    = "KaruelBorderSummonScout_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "KaruelBorderSummonScout_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "Mon_Assassin_f_Down_Down.frm",
        Func    = "KaruelBorderSummonScout_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "KaruelBorderSummonScout_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Mon_Assassin_f_Down_Special01.frm",
        Func    = "KaruelBorderSummonScout_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Mon_Assassin_f_Down_Special02.frm",
        Func    = "KaruelBorderSummonScout_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "KaruelBorderSummonScout_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Mon_Assassin_f_Down_Middle.frm",
        Func    = "KaruelBorderSummonScout_DieFunc",
        IsFallDownMotion    = TRUE,
    },

    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Mon_Scout_f_Stand_up.frm",
        Func    = "KaruelBorderSummonScout_StandupFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Mon_Assassin_f_Stone.frm",
        Func    = "KaruelBorderSummonScout_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Mon_Assassin_f_Stone.frm",
        Func    = "KaruelBorderSummonScout_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Mon_Assassin_f_Stone.frm",
		Func	= "KaruelBorderSummonScout_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnKaruelBorderSummonScout_Land",
    Die     = "OnKaruelBorderSummonScout_Die",
    Damage  = "OnKaruelBorderSummonScout_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitKaruelBorder_SummonScout( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
	pMonster:RegistReaction( ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     	"DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, 	"DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   	"DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, 	ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, 	ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, 	ATTACKDIR_DOWN,     "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, 	ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, 	ATTACKDIR_NORMAL,   "ICECURSE" )
	
	pMonster:SetInitAI( true )
	pMonster:SetCountValue( 0 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function KaruelBorderSummonScout_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( TRUE )

	if( pMonster:GetY() < -1 ) then
		pMonster:SetState( "DIE" )
	end
	
	if( pMonster:GetInitAI() ) then
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_01", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_02", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_03", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_04", 0.0, 0.0 )
		pMonster:SetInitAI( false )
		--g_kCamera.WideMode = 7
	end
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function KaruelBorderSummonScout_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 어슬렁대기 상태
function KaruelBorderSummonScout_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- Attack01
function KaruelBorderSummonScout_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 54 ) then
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Hide_01", 0.15, 0.12 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Hide_02", 0.15, 0.12 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Hide_03", 0.15, 0.12 )
		pMonster:PlaySound(992006)
	elseif( iFrame == 55 ) then
		fDistX = 0.2
		if( pMonster:GetTargetIsRight() and pMonster:GetTargetX() > fDistX ) then
			pMonster:SetX( pMonster:GetTargetX() - fDistX )
			pMonster:SetIsRight( true )
		else
			pMonster:SetX( pMonster:GetTargetX() + fDistX )
			pMonster:SetIsRight( false )
			
			if( pMonster:GetTargetX() > pMonster:GetStageX() - fDistX ) then
				fDistX = fDistX * -1.0
				pMonster:SetIsRight( true )
			end
		end
		
		pMonster:SetY( pMonster:GetTargetY() )
	elseif( iFrame == 85 ) then
		if( 2 <= g_MyD3D:GetDungeonLevel() ) then
			pMonster:AddDamage(DT_KARUELBORDER_SCOUT_ATTACK01_ADDEFF)
		else
			pMonster:AddDamage(DT_KARUELBORDER_SCOUT_ATTACK01)
		end

		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Blackwood_Assassin_Scratch", 0.18, 0.18 )
		else
			pMonster:AddParticleNoDirection( "Blackwood_Assassin_Scratch_R", -0.18, 0.18 )
		end
		pMonster:PlaySound(992005)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

-- Attack02
function KaruelBorderSummonScout_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 49 ) then
		if( 2 <= g_MyD3D:GetDungeonLevel() ) then
			pMonster:AddDamage(DT_KARUELBORDER_SCOUT_ATTACK01_ADDEFF)
		else
			pMonster:AddDamage(DT_KARUELBORDER_SCOUT_ATTACK01)
		end
		
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Blackwood_Assassin_Scratch", 0.18, 0.18 )
		else
			pMonster:AddParticleNoDirection( "Blackwood_Assassin_Scratch_R", -0.18, 0.18 )
		end
		pMonster:PlaySound(992002)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- Attack03
function KaruelBorderSummonScout_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	if( iFrame == 55 ) then
		pMonster:PlaySound(992002)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Cross_01", 0.2, 0.2 )
		else
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Cross_01_R", -0.2, 0.2 )
		end
		if( 2 <= g_MyD3D:GetDungeonLevel() ) then
			pMonster:AddDamage( DT_KARUELBORDER_SCOUT_ATTACK03_1_ADDEFF )
		else
			pMonster:AddDamage( DT_KARUELBORDER_SCOUT_ATTACK03_1 )
		end
	elseif( iFrame == 67 ) then
		pMonster:PlaySound(992002)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Cross_02", 0.3, 0.2 )
		else
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Cross_02", -0.3, 0.2 )
		end
		if( 2 <= g_MyD3D:GetDungeonLevel() ) then
			pMonster:AddDamage( DT_KARUELBORDER_SCOUT_ATTACK03_2_ADDEFF )
		else
			pMonster:AddDamage( DT_KARUELBORDER_SCOUT_ATTACK03_2 )
		end
	elseif( iFrame == 88 ) then
		pMonster:PlaySound(992002)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Cross_01", 0.2, 0.2 )
		else
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Cross_01_R", -0.2, 0.2 )
		end
		if( 2 <= g_MyD3D:GetDungeonLevel() ) then
			pMonster:AddDamage( DT_KARUELBORDER_SCOUT_ATTACK03_3_ADDEFF )
		else
			pMonster:AddDamage( DT_KARUELBORDER_SCOUT_ATTACK03_3 )
		end
	elseif( iFrame == 110 ) then
		pMonster:PlaySound(992002)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Cross_03", 0.3, 0.2 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Cross_04", 0.3, 0.2 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Cross_05", 0.3, 0.2 )
		else
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Cross_03", -0.3, 0.2 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Cross_04", -0.3, 0.2 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Assassin_Cross_05", -0.3, 0.2 )
		end
		if( 2 <= g_MyD3D:GetDungeonLevel() ) then
			pMonster:AddDamage( DT_KARUELBORDER_SCOUT_ATTACK03_4_ADDEFF )
		else
			pMonster:AddDamage( DT_KARUELBORDER_SCOUT_ATTACK03_4 )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  점프 상태
function KaruelBorderSummonScout_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
	if( pMonster:GetY() < -1 ) then
		pMonster:SetState( "DIE" )
	end
	
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
function KaruelBorderSummonScout_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	if( pMonster:GetY() < -1 ) then
		pMonster:SetState( "DIE" )
	end
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프에서 웨이트로
function KaruelBorderSummonScout_ToWait( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 데미지 상, 중, 하
function KaruelBorderSummonScout_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function KaruelBorderSummonScout_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function KaruelBorderSummonScout_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상 착지, 다운미들
function KaruelBorderSummonScout_DownFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetInvincible( true )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )				
		
		if( pMonster:GetHP() <= 0 ) then
			if( 0 == pMonster:GetCountValue() ) then
				pMonster:PlaySound(607)
				pMonster:AddCountValue( 1 )
			end
			pMonster:EndMonster()
		end		
    end
end

-- 다운 하
function KaruelBorderSummonScout_DownDownFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

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
function KaruelBorderSummonScout_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function KaruelBorderSummonScout_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetInvincible( true )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:EndMonster()
		end        		
    end
end

-- 죽기 착지
function KaruelBorderSummonScout_DieFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(607)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 일어나기
function KaruelBorderSummonScout_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
    
end

--  스톤커스 걸렸음
function KaruelBorderSummonScout_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DOWN_MIDDLE" )
		else
			pMonster:SetState( "WAIT" )
		end
    end
    
end

--  아이스커스 걸렸음
function KaruelBorderSummonScout_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DOWN_MIDDLE" )
		else
			pMonster:SetState( "WAIT" )
		end
    end
    
end


-- 홀드 걸렸음(이펙트)
function KaruelBorderSummonScout_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Small", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DOWN_MIDDLE" )
		else
			pMonster:SetState( "WAIT" )
		end
	end
    
end


-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function KaruelBorderSummonScout_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -330, 260, 330, -250 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function KaruelBorderSummonScout_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -500, 400, 500, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function KaruelBorderSummonScout_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function KaruelBorderSummonScout_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -140, 800, 140, -800 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function KaruelBorderSummonScout_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 80, -150, 360, 150, -400 ) == true or pMonster:FloatRand() < 0.05  ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderSummonScout_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function KaruelBorderSummonScout_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -300, 300, 300, -300 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderSummonScout_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -100, 30, 100, -100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderSummonScout_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -180, 30, 180, -100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderSummonScout_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -250, 560, 250, 70 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		KaruelBorderSummonScout_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderSummonScout_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -250, -100, 250, -500 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function KaruelBorderSummonScout_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- 어슬렁대기..  방향 바꾸기 후 이동
function KaruelBorderSummonScout_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- 어슬렁대기.. 방향바꾸기

function KaruelBorderSummonScout_Check_Turnning( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( false == pMonster:IsTarget() and pMonster:FloatRand() < 0.3 ) then
        pMonster:SetIsRight( not pMonster:GetIsRight() )
		pMonster:ResetDelay()
    end
end

-- 어슬렁대는 중.. 멈추기
function KaruelBorderSummonScout_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() or pMonster:FloatRand() < 0.2 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnKaruelBorderSummonScout_Land( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

	if( pMonster:GetY() < -1 ) then
		pMonster:SetState( "DIE" )
	end
	
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

function OnKaruelBorderSummonScout_Die( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and 
        pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and 
        pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and 
        pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()
	
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.02 )
		else
			pMonster:SetSpeedX( 0.02 )
		end	
	
		pMonster:SetState( "DOWN_MIDDLE" )
	end
end

function OnKaruelBorderSummonScout_Damage( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	
	-- 점프 중에 맞았을때
    if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
	
	-- 떠서 떨어지는 중에 맞았을때
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end
		
	-- 뜨는중에 맞았을때
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
    
	-- 다운 중에 맞았을땐 다운미들로
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
    
	-- 반격
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and 
        pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		if( pMonster:FloatRand() < 0.03 and pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK01" )
		end
	end
end

function KaruelBorderSummonScout_Jump( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
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

function KaruelBorderSummonScout_MoveFail( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetRunSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetRunSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )			
		end
    else
		pMonster:SetState( "WAIT" )
		pMonster:SetSpeedX( 0 )
	end
end

function KaruelBorderSummonScout_IdleMoveFail( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )

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