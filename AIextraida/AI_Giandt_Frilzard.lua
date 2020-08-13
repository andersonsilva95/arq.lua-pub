-- AI_Giant_Frilzard.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Giant_Frilzard_Wait.frm",
        Func    = "Giant_Frilzard_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Giant_Frilzard_Check_Targeting",
                DelayFrame          = 40,
            },

            -- 타겟지움
            --{
            --    AICheckFrame        = 350,
            --    AIFunc              = "Giant_Frilzard_Check_ReleaseTarget",
            --    DelayFrame          = 150,
            --},

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "Giant_Frilzard_Check_TurnToTarget",
                DelayFrame          = 10,
            },

            -- 걷기
            {
                AICheckFrame        = 20,
                AIFunc              = "Giant_Frilzard_Check_Walk",
                DelayFrame          = 20,
            },

            -- 점프업
            {
                AICheckFrame        = 21,
                AIFunc              = "Giant_Frilzard_Check_JumpUp",
                DelayFrame          = 40,
            },

            -- 점프다운
            {
                AICheckFrame        = 22,
                AIFunc              = "Giant_Frilzard_Check_JumpDown",
                DelayFrame          = 20,
            },

            -- 어슬렁대기(이동)
            {
                AICheckFrame        = 220,
                AIFunc              = "Giant_Frilzard_Check_Idle",
                DelayFrame          = 110,
            },

			-- 테일 앤 투스
            {
                AICheckFrame        = 10,
                AIFunc              = "Giant_Frilzard_Check_Attack01",
                DelayFrame          = 110,
            },

            -- 하드 러닝 [80%]
            {
                AICheckFrame        = 30,
                AIFunc              = "Giant_Frilzard_Check_Attack02",
                DelayFrame          = 200,
            },

            -- 컨퓨전 웨이브
            {
                AICheckFrame        = 20,
                AIFunc              = "Giant_Frilzard_Check_Attack03",
                DelayFrame          = 150,
            },

		},
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Giant_Frilzard_move.frm",
        Func            = "Giant_Frilzard_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Giant_Frilzard_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 30,
                AIFunc              = "Giant_Frilzard_Check_Targeting",
                DelayFrame          = 30,
            },
            -- 타겟지움
            --{
            --    AICheckFrame        = 200,
            --    AIFunc              = "Giant_Frilzard_Check_ReleaseTarget",
            --    DelayFrame          = 200,
            --},
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 15,
                AIFunc              = "Giant_Frilzard_Check_TurnToTarget",
                DelayFrame          = 10,
            },
            -- 점프업
            {
                AICheckFrame        = 21,
                AIFunc              = "Giant_Frilzard_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- 점프다운
            {
                AICheckFrame        = 22,
                AIFunc              = "Giant_Frilzard_Check_JumpDown",
                DelayFrame          = 20,
            },

			-- 멈추기
            {
                AICheckFrame        = 5,
                AIFunc              = "Giant_Frilzard_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
    
     -- 어슬렁대기
    {
        ID              = "IDLE",
        Motion          = "Giant_Frilzard_move.frm",
        Func            = "Giant_Frilzard_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Giant_Frilzard_IdleMoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 60,
                AIFunc              = "Giant_Frilzard_Check_Targeting",
                DelayFrame          = 40,
            },
            -- 어슬렁대기(멈춤)
            {
                AICheckFrame        = 300,
                AIFunc              = "Giant_Frilzard_Check_Idle_Stop",
                DelayFrame          = 100,
            },
        }
    },
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Giant_Frilzard_Attack01.frm",
        Func    = "Giant_Frilzard_Attack01Func",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK02",
        Motion  = "Giant_Frilzard_Attack02.frm",
        Func    = "Giant_Frilzard_Attack02Func",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK03",
        Motion  = "Giant_Frilzard_Attack03.frm",
        Func    = "Giant_Frilzard_Attack03Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Giant_Frilzard_Jump_Up.frm",
        Func    = "Giant_Frilzard_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "Giant_Frilzard_Jump_Down.frm",
        Func    = "Giant_Frilzard_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "Giant_Frilzard_Jump_Landing.frm",
        Func    = "Giant_Frilzard_ToWait",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Giant_Frilzard_Damage_Up.frm",
        Func    = "Giant_Frilzard_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Giant_Frilzard_Damage_Middle.frm",
        Func    = "Giant_Frilzard_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Giant_Frilzard_Damage_Down.frm",
        Func    = "Giant_Frilzard_DamageFunc",
    },

    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "Giant_Frilzard_Down_Up01.frm",
        Func    = "Giant_Frilzard_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Giant_Frilzard_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "Giant_Frilzard_Down_Up02.frm",
        Func    = "Giant_Frilzard_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Giant_Frilzard_Down_Up03.frm",
        Func    = "Giant_Frilzard_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Giant_Frilzard_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Giant_Frilzard_Down_Middle.frm",
        Func    = "Giant_Frilzard_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Giant_Frilzard_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "Giant_Frilzard_Down_Middle.frm",
        Func    = "Giant_Frilzard_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Giant_Frilzard_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Giant_Frilzard_Down_Special01.frm",
        Func    = "Giant_Frilzard_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Giant_Frilzard_Down_Special02.frm",
        Func    = "Giant_Frilzard_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Giant_Frilzard_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Giant_Frilzard_down_middle.frm",
        Func    = "Giant_Frilzard_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Giant_Frilzard_Standup.frm",
        Func    = "Giant_Frilzard_StandupFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Giant_Frilzard_Stone.frm",
        Func    = "Giant_Frilzard_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Giant_Frilzard_Stone.frm",
        Func    = "Giant_Frilzard_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Giant_Frilzard_Stone.frm",
		Func	= "Giant_Frilzard_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnGiant_Frilzard_Land",
    Die     = "OnGiant_Frilzard_Die",
    Damage  = "OnGiant_Frilzard_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitGiant_Frilzard( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )

    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_DOWN" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )

	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Giant_Frilzard_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Giant_Frilzard_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 어슬렁대기 상태
function Giant_Frilzard_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- 죽었음
function Giant_Frilzard_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- 죽기 착지
function Giant_Frilzard_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(990007)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Giant_Frilzard_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function Giant_Frilzard_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function Giant_Frilzard_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상3
function Giant_Frilzard_DownUp03Func( iMonsterIndex, iFrame )
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
function Giant_Frilzard_DownFunc( iMonsterIndex, iFrame )
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
function Giant_Frilzard_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function Giant_Frilzard_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function Giant_Frilzard_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Giant_Frilzard_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 51 ) then
		pMonster:AddDamage( DT_GIANT_FRILLZARD_TOOTH )
		pMonster:PlaySound(990008)
		local posx = 0.1
		if( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
		end
		pMonster:AddTraceParticleToBone( "Frillzard_Teeth_01", 1.0, 21, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "Frillzard_Teeth_02", 1.0, 21, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "Frillzard_Teeth_03", 1.0, 21, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "Frillzard_Teeth_04", 1.0, 21, 8, 8, posx, posy, true )
	elseif( iFrame == 101 ) then
		pMonster:AddDamage( DT_GIANT_FRILLZARD_TAIL )
		pMonster:PlaySound(990025)
		pMonster:AddTraceParticleToBone( "Frillzard_Tail_01", 1.0, 43, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "Frillzard_Tail_02", 1.0, 43, 8, 8, posx, posy, true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Giant_Frilzard_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= 72 and iFrame <= 170 ) then
		if( iFrame == 72 ) then
			pMonster:StartAttack( 3, PAR_FRONTDOWN_DROPDAMAGE_LAST, 0.40, 21, 21, 90 )
			pMonster:PlaySound(990009)
		end
		
		if ( math.mod( iFrame, 5 ) == 0 ) then
			local posx = 0.0
			local posy = 0.0
			if ( true == pMonster:GetIsRight() ) then
				pMonster:AddTraceParticleToBone( "Frillzard_Dash_Big", 1.0, -1, 8, 8, posx, posy, true )
				pMonster:AddTraceParticleToBone( "Frillzard_Dash_Big", 1.0, -1, 8, 8, posx + 0.3, posy, true )
			else
				posx = posx * -1.0
				pMonster:AddTraceParticleToBone( "Frillzard_Dash_Big_R", 1.0, -1, 8, 8, posx, posy, true )
				pMonster:AddTraceParticleToBone( "Frillzard_Dash_Big_R", 1.0, -1, 8, 8, posx - 0.3, posy, true )
			end
		end
		
		pMonster:SetSpeedX( pMonster:GetRunSpeed() *4.5 )
	elseif( iFrame == 171 ) then
		pMonster:EndAttack()
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Giant_Frilzard_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 62 ) then
		pMonster:AddDamage( DT_GIANT_FRILLZARD_SPECIAL_ATK )
	elseif( iFrame == 65 ) then
		pMonster:PlaySound(990010)
		local posx = 0.5
		local posy = 0.39
		if ( true == pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_01", 1.0, -1, 8, 8, posx, posy )
			--pMonster:AddTraceParticleToBone( "Frillzard_Wave_02", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_03", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_04", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_05", 1.0, -1, 8, 8, posx, posy )
		else
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_01", 1.0, -1, 8, 8, posx, posy, true )
			--pMonster:AddTraceParticleToBone( "Frillzard_Wave_02_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_03_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_04_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_05_R", 1.0, -1, 8, 8, posx, posy, true )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function Giant_Frilzard_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame > 15 and pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetFrameLock( false )
		pMonster:SetState("JUMP_DOWN")
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
	end
	
	if( iFrame == 15 ) then
		Giant_Frilzard_Jump( iMonsterIndex )
	end
	
	
end

--  점프 다운 상태
function Giant_Frilzard_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function Giant_Frilzard_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame == 5 ) then
		local posx = 0.15
		
		if(pMonster:GetIsRight() == false) then
			posx = posx * -1.0
		end

		pMonster:EarthQuake( 25, 0.06, 0.02 )
		pMonster:AddParticleNoDirection( "Blutus_Earthquake_01", posx, 0.0 )
		pMonster:AddParticleNoDirection( "Blutus_Earthquake_02", posx, 0.0 )
		pMonster:AddParticleNoDirection( "Blutus_Earthquake_03", posx, 0.0 )
		pMonster:AddParticleNoDirection( "Scolpis_Rush_02", posx, 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function Giant_Frilzard_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Giant_Frilzard_IceCurseFunc( iMonsterIndex, iFrame )
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
function Giant_Frilzard_HoldFunc( iMonsterIndex, iFrame )
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

function Giant_Frilzard_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -500, 400, 500, -400 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function Giant_Frilzard_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -800, 500, 800, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Giant_Frilzard_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Giant_Frilzard_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -270, 600, 270, -600 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Giant_Frilzard_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -270, 600, 270, -600 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Giant_Frilzard_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Giant_Frilzard_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	--if( pMonster:CheckTargetInRange( 230, -100, 50, 100, -100 ) == true ) then	-- 전방 전용
	if( pMonster:CheckTargetInRange( 70, -230, 50, 230, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Giant_Frilzard_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 420, -300, 50, 300, -100 ) == true and pMonster:FloatRand() < 0.80 ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Giant_Frilzard_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 320, -170, 300, 170, -200 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Giant_Frilzard_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, 600, 300, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Giant_Frilzard_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -300, -100, 300, -600 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function Giant_Frilzard_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- 어슬렁대기..  방향 바꾸기 후 이동
function Giant_Frilzard_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- 어슬렁대는 중.. 멈추기
function Giant_Frilzard_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnGiant_Frilzard_Land( iMonsterIndex )
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

function OnGiant_Frilzard_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnGiant_Frilzard_Damage( iMonsterIndex )
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
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		if( pMonster:FloatRand() < 0.05 and pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false ) then
			pMonster:TurnToTarget()
			if( pMonster:CheckTargetInRange( 320, -170, 300, 170, -200 ) == true ) then
				pMonster:SetState( "ATTACK03" )
			else
				pMonster:SetState( "ATTACK02" )
			end
		end
	end
end

function Giant_Frilzard_Jump( iMonsterIndex )
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

function Giant_Frilzard_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		end
	end
end

function Giant_Frilzard_IdleMoveFail( iMonsterIndex )
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
