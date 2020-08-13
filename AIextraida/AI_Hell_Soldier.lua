-- AI_BlackKnight_Spearman.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "BlackKnight_Spearman_Wait.frm",
        Func    = "BlackKnight_Spearman_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame       = 30,
				AICheckFrame1       = 30,
				AICheckFrame2       = 10,
                AIFunc              = "BlackKnight_Spearman_Check_Targeting",
                DelayFrame          = 30,
            },

            -- 타겟지움
            {
                AICheckFrame        = 150,
                AIFunc              = "BlackKnight_Spearman_Check_ReleaseTarget",
                DelayFrame          = 300,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame       = 55,
				AICheckFrame1       = 35,
				AICheckFrame2       = 10,
                AIFunc              = "BlackKnight_Spearman_Check_TurnToTarget",
                DelayFrame1         = 10,
				DelayFrame2         = 10,
				DelayFrame3         = 10,
            },

            -- 걷기
            {
                AICheckFrame        = 60,
                AIFunc              = "BlackKnight_Spearman_Check_Walk",
                DelayFrame          = 60,
            },


            -- 점프업
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackKnight_Spearman_Check_JumpUp",
                DelayFrame          = 100,
            },        
            -- 점프다운
            {
                AICheckFrame        = 70,
                AIFunc              = "BlackKnight_Spearman_Check_JumpDown",
                DelayFrame          = 140,
            },

            -- 어슬렁대기(이동)
            {
                AICheckFrame        = 110,
                AIFunc              = "BlackKnight_Spearman_Check_Idle",
                DelayFrame          = 220,
            },

			-- 근접공격
            {
                AICheckFrame       = 40,
				AICheckFrame1       = 25,
				AICheckFrame2       = 20,
                AIFunc              = "BlackKnight_Spearman_Check_Attack01",
                DelayFrame         = 130,
				DelayFrame1         = 80,
				DelayFrame2         = 40,
            },

            -- 대쉬공격
            {
                AICheckFrame       = 80,
				AICheckFrame1       = 80,
				AICheckFrame2       = 30,
                AIFunc              = "BlackKnight_Spearman_Check_Attack02",
                DelayFrame         = 250,
				DelayFrame1         = 150,
				DelayFrame2         = 100,
            },
			
			-- 불카누스의 독려
            {
                AICheckFrame       = 300,
				AICheckFrame1       = 180,
				AICheckFrame2       = 50,
                AIFunc              = "BlackKnight_Spearman_Check_Attack04",
                DelayFrame         = 990,
				DelayFrame1         = 830,
				DelayFrame2         = 100,
            },
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "BlackKnight_Spearman_Run.frm",
        Func            = "BlackKnight_Spearman_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "BlackKnight_Spearman_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame       = 55,
				AICheckFrame1       = 55,
				AICheckFrame2       = 20,
                AIFunc              = "BlackKnight_Spearman_Check_Targeting",
                DelayFrame         = 110,
				DelayFrame1         = 80,
				DelayFrame2         = 40,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "BlackKnight_Spearman_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackKnight_Spearman_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 점프업
            {
                AICheckFrame        = 75,
                AIFunc              = "BlackKnight_Spearman_Check_JumpUp",
                DelayFrame          = 150,
            },        
            -- 점프다운
            {
                AICheckFrame        = 120,
                AIFunc              = "BlackKnight_Spearman_Check_JumpDown",
                DelayFrame          = 240,
            },

            -- 대쉬공격
            {
                AICheckFrame        = 20,
                AIFunc              = "BlackKnight_Spearman_Check_Attack02",
                DelayFrame         = 400,
				DelayFrame1         = 150,
				DelayFrame2         = 80,
            },

			-- 멈추기
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackKnight_Spearman_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
    
     -- 어슬렁대기
    {
        ID              = "IDLE",
        Motion          = "BlackKnight_Spearman_Walk.frm",
        Func            = "BlackKnight_Spearman_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "BlackKnight_Spearman_IdleMoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame       = 40,
				AICheckFrame1       = 40,
				AICheckFrame2       = 20,
                AIFunc              = "BlackKnight_Spearman_Check_Targeting",
                DelayFrame         = 110,
				DelayFrame1         = 110,
				DelayFrame2         = 30,
            },
            -- 어슬렁대기(멈춤)
            {
                AICheckFrame        = 220,
                AIFunc              = "BlackKnight_Spearman_Check_Idle_Stop",
                DelayFrame          = 100,
            },
			-- 불카누스의 독려
            {
                AICheckFrame       = 300,
				AICheckFrame1       = 180,
				AICheckFrame2       = 50,
                AIFunc              = "BlackKnight_Spearman_Check_Attack04",
                DelayFrame         = 990,
				DelayFrame1         = 830,
				DelayFrame2         = 100,
            },
        }
    },
        
    -- 점프 찍기
    {
        ID      = "ATTACK01",
        Motion  = "hell_soldier_attack01.frm",
        Func    = "BlackKnight_Spearman_Attack01Func",
    },
    
    -- 연속 찌르기
    {
        ID      = "ATTACK02",
        Motion  = "BlackKnight_Spearman_Attack02.frm",
        Func    = "BlackKnight_Spearman_Attack02Func",
    },
    
    -- 기상 공격
    {
        ID      = "STANDUP_ATTACK",
        Motion  = "hell_soldier_attack02.frm",
        Func    = "BlackKnight_Spearman_Attack03Func",
    },
    
    -- 불카누스의 독려
    {
        ID      = "ATTACK04",
        Motion  = "hell_soldier_attack03.frm",
        Func    = "BlackKnight_Spearman_Attack04Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "BlackKnight_Spearman_Jump_Up.frm",
        Func    = "BlackKnight_Spearman_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "BlackKnight_Spearman_Jump_Down.frm",
        Func    = "BlackKnight_Spearman_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "BlackKnight_Spearman_Jump_Landing.frm",
        Func    = "BlackKnight_Spearman_ToWait",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "BlackKnight_Spearman_Damage_Up.frm",
        Func    = "BlackKnight_Spearman_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "BlackKnight_Spearman_Damage_Middle.frm",
        Func    = "BlackKnight_Spearman_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "BlackKnight_Spearman_Damage_Down.frm",
        Func    = "BlackKnight_Spearman_DamageFunc",
    },

    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "BlackKnight_Spearman_Down_Up01.frm",
        Func    = "BlackKnight_Spearman_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "BlackKnight_Spearman_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "BlackKnight_Spearman_Down_Up02.frm",
        Func    = "BlackKnight_Spearman_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "BlackKnight_Spearman_Down_Up03.frm",
        Func    = "BlackKnight_Spearman_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackKnight_Spearman_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "BlackKnight_Spearman_Down_Middle.frm",
        Func    = "BlackKnight_Spearman_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackKnight_Spearman_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "BlackKnight_Spearman_Down_Middle.frm",
        Func    = "BlackKnight_Spearman_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackKnight_Spearman_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "BlackKnight_Spearman_Down_Special01.frm",
        Func    = "BlackKnight_Spearman_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "BlackKnight_Spearman_Down_Special02.frm",
        Func    = "BlackKnight_Spearman_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackKnight_Spearman_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "BlackKnight_Spearman_Die01.frm",
        Func    = "BlackKnight_Spearman_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "BlackKnight_Spearman_Standup.frm",
        Func    = "BlackKnight_Spearman_StandupFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "BlackKnight_Spearman_Stone.frm",
        Func    = "BlackKnight_Spearman_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "BlackKnight_Spearman_Stone.frm",
        Func    = "BlackKnight_Spearman_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "BlackKnight_Spearman_Stone.frm",
		Func	= "BlackKnight_Spearman_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnBlackKnight_Spearman_Land",
    Die     = "OnBlackKnight_Spearman_Die",
    Damage  = "OnBlackKnight_Spearman_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitHell_Soldier( iMonsterIndex )
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
function BlackKnight_Spearman_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function BlackKnight_Spearman_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 어슬렁대기 상태
function BlackKnight_Spearman_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- 죽었음
function BlackKnight_Spearman_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- 죽기 착지
function BlackKnight_Spearman_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(997015)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function BlackKnight_Spearman_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function BlackKnight_Spearman_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function BlackKnight_Spearman_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상3
function BlackKnight_Spearman_DownUp03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 5 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )		
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end    		
    end
end

-- 다운 미들
function BlackKnight_Spearman_DownFunc( iMonsterIndex, iFrame )
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

-- 다운 스페셜
function BlackKnight_Spearman_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function BlackKnight_Spearman_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end 				
    end
end

-- 일어나기
function BlackKnight_Spearman_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function BlackKnight_Spearman_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 55 ) then
		pMonster:AddDamage(DT_HELL_SOLDIER_JUMP_ATK)
		local posX = 0.38
		local posY = 0.06
		
		pMonster:AddParticle( "Jin1_Special1_Start_01", posX, posY )
		pMonster:AddParticle( "Jin1_Special1_Start_02", posX, posY )
		pMonster:AddParticle( "Jin1_Special1_Start_03", posX, posY )
		pMonster:AddParticle( "Jin1_Special1_Start_04", posX, posY )
		pMonster:AddParticle( "Jin1_Special1_Start_05", posX, posY )
		
		pMonster:PlaySound(985001)
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function BlackKnight_Spearman_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 50 ) then
		pMonster:AddDamage(DT_BLACKKNIGHT_SPEARMAN_ATK2_1)
		pMonster:PlaySound(997012)
	elseif( iFrame == 58 ) then
		pMonster:AddDamage(DT_BLACKKNIGHT_SPEARMAN_ATK2_1)
	elseif( iFrame == 69 ) then
		pMonster:AddDamage(DT_BLACKKNIGHT_SPEARMAN_ATK2_1)
	elseif( iFrame == 86 ) then
		pMonster:AddDamage(DT_BLACKKNIGHT_SPEARMAN_ATK2_2)
		pMonster:PlaySound(997011)
	elseif( iFrame == 91 ) then
		local posX = 0.65
		local posY = 0.2
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "HellArmy_Slash_04", posX, posY )
			pMonster:AddParticle( "HellArmy_Slash_05", posX, posY )
			pMonster:AddParticle( "HellArmy_Slash_06", posX, posY )
		else
			pMonster:AddParticleNoDirection( "HellArmy_Slash_04_R", -posX, posY )
			pMonster:AddParticleNoDirection( "HellArmy_Slash_05_R", -posX, posY )
			pMonster:AddParticleNoDirection( "HellArmy_Slash_06_R", -posX, posY )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격 상태
function BlackKnight_Spearman_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 60 ) then
		pMonster:AddDamage(DT_HELL_SOLDIER_STANDUP_ATK)
		local posX = 0.0
		local posY = 0.05
		
		pMonster:AddParticle( "HellArmy_Wake_01", posX, posY )
		pMonster:AddParticle( "HellArmy_Wake_02", posX, posY )
		pMonster:AddParticle( "HellArmy_Wake_03", posX, posY )
		pMonster:AddParticle( "Jin1_Special1_Start_02", posX, posY )
		pMonster:AddParticle( "Jin1_Special1_Start_04", posX, posY )
		pMonster:PlaySound(985003)
	elseif( iFrame == 75 ) then
		pMonster:AddDamage(DT_HELL_SOLDIER_STANDUP_ATK)
	elseif ( iFrame == 90 ) then
		pMonster:AddDamage(DT_HELL_SOLDIER_STANDUP_ATK_DOWN)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  불카누스의 독려
function BlackKnight_Spearman_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:PlaySound(985002)
		pMonster:SetSuperArmorFrame(600)
		pMonster:AddTraceParticleToBone( "Hellarmy_Buff", 1.0, -1, 8, 8, 0.0, 0.18, false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  점프 상태
function BlackKnight_Spearman_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	 if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 다운 상태
function BlackKnight_Spearman_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function BlackKnight_Spearman_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function BlackKnight_Spearman_StoneCurseFunc( iMonsterIndex, iFrame )
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
function BlackKnight_Spearman_IceCurseFunc( iMonsterIndex, iFrame )
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
function BlackKnight_Spearman_HoldFunc( iMonsterIndex, iFrame )
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

function BlackKnight_Spearman_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 600, -800, 200, 800, -600 ) == true or pMonster:SetTarget( 0, -200, 260, 200, -250 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function BlackKnight_Spearman_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 300, -500, 350, 500, -300 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function BlackKnight_Spearman_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function BlackKnight_Spearman_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 500, -200, 350, 250, -250 ) == true and pMonster:FloatRand() < 0.7) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
	end
end

function BlackKnight_Spearman_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 50, -250, 180, 250, -200 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function BlackKnight_Spearman_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function BlackKnight_Spearman_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -150, 50, 150, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function BlackKnight_Spearman_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 50, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function BlackKnight_Spearman_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 350, 200, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		BlackKnight_Spearman_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function BlackKnight_Spearman_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -150, -100, 150, -360 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function BlackKnight_Spearman_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		if( pMonster:CheckTargetInRange( 200, -200, 150, 200, -100 ) == true ) then
			if ( pMonster:FloatRand() < 1.2) then				
				pMonster:SetState( "STANDUP_ATTACK" )				
			else
				pMonster:SetState( "STANDUP" )
			end			
		else
			pMonster:SetState( "STANDUP" )
		end
    end
end

-- 어슬렁대기..  방향 바꾸기 후 이동
function BlackKnight_Spearman_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- 어슬렁대는 중.. 멈추기
function BlackKnight_Spearman_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnBlackKnight_Spearman_Land( iMonsterIndex )
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

function OnBlackKnight_Spearman_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnBlackKnight_Spearman_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
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
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
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
end

function BlackKnight_Spearman_Jump( iMonsterIndex )
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

function BlackKnight_Spearman_MoveFail( iMonsterIndex )
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

function BlackKnight_Spearman_IdleMoveFail( iMonsterIndex )
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
