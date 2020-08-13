-- AI_Statue.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Statue_Wait.frm",
        Func    = "Statue_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "Statue_Check_Targeting",
                DelayFrame          = 110,
            },

            -- 타겟지움
            {
                AICheckFrame        = 120,
                AIFunc              = "Statue_Check_ReleaseTarget",
                DelayFrame          = 400,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 30,
                AIFunc              = "Statue_Check_TurnToTarget",
                DelayFrame          = 120,
            },

            -- 걷기
            {
                AICheckFrame        = 150,
                AIFunc              = "Statue_Check_Walk",
                DelayFrame          = 200,
            },

            -- 점프업
            {
                AICheckFrame        = 55,
                AIFunc              = "Statue_Check_JumpUp",
                DelayFrame          = 440,
            },        

            -- 점프다운
            {
                AICheckFrame        = 55,
                AIFunc              = "Statue_Check_JumpDown",
                DelayFrame          = 440,
            },

			-- 자이언트 웜 소환
            {
                AICheckFrame        = 1100,
                AIFunc              = "Statue_Check_Attack02",
                DelayFrame          = 1100,
            },
            
			-- 섬광탄
            {
                AICheckFrame        = 80,
                AIFunc              = "Statue_Check_Attack03",
                DelayFrame          = 500,
            },


			-- 라이트닝 웹
            {
                AICheckFrame        = 100,
                AIFunc              = "Statue_Check_Attack04",
                DelayFrame          = 750,
				DelayFrame1			= 500,
				DelayFrame2			= 250,
				DelayFrame3			= 250,
            },

			-- 3발이
            {
                AICheckFrame        = 45,
                AIFunc              = "Statue_Check_Attack05",
                DelayFrame          = 90,
            },

            -- 어슬렁대기(이동)
            {
                AICheckFrame        = 110,
                AIFunc              = "Statue_Check_Idle",
                DelayFrame          = 220,
            },
            
        },
    },

	-- WAIT TO RUN
    {
        ID      = "WALK_READY",
        Motion  = "Statue_Wait_Run.frm",
        Func    = "Statue_WalkReadyFunc",
    },
    
    -- RUN TO WAIT
    {
        ID      = "WALK_END",
        Motion  = "Statue_Run_Wait.frm",
        Func    = "Statue_WalkEndFunc",
    },
    
    -- 이동
    {
        ID              = "WALK",
        Motion          = "Statue_Run.frm",
        Func            = "Statue_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Statue_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "Statue_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "Statue_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "Statue_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- 점프업
            {
                AICheckFrame        = 30,
                AIFunc              = "Statue_Check_JumpUp",
                DelayFrame          = 150,
            },        
            -- 점프다운
            {
                AICheckFrame        = 40,
                AIFunc              = "Statue_Check_JumpDown",
                DelayFrame          = 200,
            },
			-- 3발이
            {
                AICheckFrame        = 20,
                AIFunc              = "Statue_Check_Attack05",
                DelayFrame          = 40,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "Statue_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
     -- 어슬렁대기
    {
        ID              = "IDLE",
        Motion          = "Statue_Walk.frm",
        Func            = "Statue_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Statue_IdleMoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 30,
                AIFunc              = "Statue_Check_Targeting",
                DelayFrame          = 30,
            },
            -- 어슬렁대기(멈춤)
            {
                AICheckFrame        = 220,
                AIFunc              = "Statue_Check_Idle_Stop",
                DelayFrame          = 220,
            },
        }
    },
        
    -- 자폭
    {
        ID      = "ATTACK01",
        Motion  = "Statue_Attack01.frm",
        Func    = "Statue_Attack01Func",
    },
    
    -- 소환
    {
        ID      = "ATTACK02",
        Motion  = "Statue_Attack02.frm",
        Func    = "Statue_Attack02Func",
    },
    
    -- 섬광 유도탄
    {
        ID      = "ATTACK03",
        Motion  = "Statue_Attack03.frm",
        Func    = "Statue_Attack03Func",
    },
    
    -- 3발이
    {
        ID      = "ATTACK05",
        Motion  = "Statue_Attack03.frm",
        Func    = "Statue_Attack05Func",
    },
    
    -- 라이트닝 웹
    {
        ID      = "ATTACK04",
        Motion  = "Statue_Attack04.frm",
        Func    = "Statue_Attack04Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Statue_Jump.frm",
        Func    = "Statue_JumpFunc",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Statue_Damage_Up.frm",
        Func    = "Statue_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Statue_Damage_Middle.frm",
        Func    = "Statue_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Statue_Damage_Down.frm",
        Func    = "Statue_DamageFunc",
    },

    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "Statue_Down_Up01.frm",
        Func    = "Statue_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Statue_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "Statue_Down_Up02.frm",
        Func    = "Statue_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Statue_Down_Up03.frm",
        Func    = "Statue_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Statue_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Statue_Down_Middle.frm",
        Func    = "Statue_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Statue_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "Statue_Down_Middle.frm",
        Func    = "Statue_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Statue_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Statue_Down_Special01.frm",
        Func    = "Statue_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Statue_Down_Special02.frm",
        Func    = "Statue_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Statue_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Statue_Die.frm",
        Func    = "Statue_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    -- 드라마용 죽기
    {
        ID      = "DIE_LANDING_DRAMA",
        Motion  = "Statue_Down_Middle.frm",
        Func    = "Statue_DieLandingDramaFunc",
        IsFallDownMotion    = TRUE,
    },
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Statue_Standup.frm",
        Func    = "Statue_StandupFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Statue_Stone.frm",
        Func    = "Statue_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Statue_Stone.frm",
        Func    = "Statue_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Statue_Stone.frm",
		Func	= "Statue_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnStatue_Land",
    Die     = "OnStatue_Die",
    Damage  = "OnStatue_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitStatue( iMonsterIndex )
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
    
    pMonster:RegisterSummonMonsterType( MON_GIANT_WORM )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Statue_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- 걷기 레디 상태
function Statue_WalkReadyFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 걷기 끝 상태
function Statue_WalkEndFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Statue_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
    if( iFrame == 2 ) then
		local posx = -0.15
		if( pMonster:GetIsRight() == false ) then
			posx = 0.15
		end
		
		pMonster:AddTraceParticleToBone( "Statue_Buster_01", 1.0, 34, 0, 0, posx, 0.0 )
		pMonster:AddTraceParticleToBone( "Statue_Buster_02", 1.0, 34, 0, 0, posx, 0.0 )
		pMonster:AddTraceParticleToBone( "Statue_Buster_03", 1.0, 34, 0, 0, posx, 0.0 )
		
		pMonster:AddTraceParticleToBone( "Statue_Buster_01", 1.0, 23, 0, 0, posx, 0.0 )
		pMonster:AddTraceParticleToBone( "Statue_Buster_02", 1.0, 23, 0, 0, posx, 0.0 )
		pMonster:AddTraceParticleToBone( "Statue_Buster_03", 1.0, 23, 0, 0, posx, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 어슬렁대기 상태
function Statue_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- 죽었음
function Statue_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- 죽기 착지
function Statue_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetState("ATTACK01")
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        --pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end


-- 드라마용 죽기
function Statue_DieLandingDramaFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 8 ) then		
		pMonster:AddParticle( "BombMon_boom01" )
		pMonster:AddParticle( "BombMon_boom02" )
		pMonster:AddParticle( "BombMon_boom03" )
		pMonster:AddParticle( "BombMon_boom04" )
		pMonster:PlaySound(43)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end
-- 데미지 입은거
function Statue_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function Statue_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function Statue_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상3
function Statue_DownUp03Func( iMonsterIndex, iFrame )
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
function Statue_DownFunc( iMonsterIndex, iFrame )
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
function Statue_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function Statue_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function Statue_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  자폭
function Statue_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:AddTraceParticleOffset( "Statue_Spark_01", 0, 0.3, 1.0)
	elseif( iFrame == 30 ) then
		pMonster:PlaySound(998035)
	elseif( iFrame == 65 ) then
		pMonster:AddDamage( DT_STATUE_SUICIDAL )
    elseif( iFrame >= pMonster:GetLastFrame() ) then	
        pMonster:SetFrameLock( true )
        pMonster:EndMonster()
    end

end

--  자이언트 웜 소환
function Statue_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:SetSpeedX( 0.0)
	if( iFrame == 35 ) then
		local posy = 0.65
		local posy1 = 0.0
		
		pMonster:AddTraceParticleOffset( "Statue_Summon_01", posx, posy, 1.0)
		pMonster:AddTraceParticleOffset( "Statue_Summon_02", posx, posy, 1.0)
		pMonster:AddTraceParticleOffset( "Statue_Summon_03", posx, posy, 1.0)
		pMonster:AddTraceParticleOffset( "Statue_Summon_04", posx, posy, 1.0)
		pMonster:AddTraceParticleOffset( "Statue_Summon_05", posx, posy, 1.0)
		pMonster:AddTraceParticleOffset( "Statue_Summon_06", posx, posy, 1.0)
		pMonster:AddTraceParticleOffset( "Statue_Summon_07", posx, posy, 1.0)
		
		pMonster:AddTraceParticleOffset( "Statue_Summon_Circle_01", posx, posy1, 1.0)
		pMonster:AddTraceParticleOffset( "Statue_Summon_Circle_02", posx, posy1, 1.0)
		pMonster:AddTraceParticleOffset( "Statue_Summon_Circle_03", posx, posy1, 1.0)
		pMonster:AddTraceParticleOffset( "Statue_Summon_Circle_04", posx, posy1, 1.0)
	elseif( iFrame == 45 ) then
		pMonster:PlaySound(998036)
	elseif( iFrame == 113 ) then
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_GIANT_WORM
        pMon.fX = 200
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end

end

--  섬광 유도탄
function Statue_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 60 ) then
		pMonster:PlaySound(998037)
		local posy = 0.3
		local posx = 0.5
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Statue_Homing_Shot_01", posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_02", posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_03", posx, posy )
		else
			pMonster:AddParticle( "Statue_Homing_Shot_01_R",posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_02", posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_03_R", posx, posy )
		end
	elseif( iFrame == 63 ) then
		pMonster:AddDamage( DT_STATUE_HOMMING_MISSILE )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  3발이
function Statue_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 55 ) then
		local posy = 0.3
		local posx = 0.5
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Statue_Homing_Shot_01", posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_02", posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_03", posx, posy )
		else
			pMonster:AddParticle( "Statue_Homing_Shot_01_R",posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_02", posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_03_R", posx, posy )
		end
    elseif( iFrame == 60 ) then
		pMonster:PlaySound(998037)
	elseif( iFrame == 63 ) then
	    pMonster:AddDamageWithLocateAngle( DT_STATUE_NORMAL_MISSILE, -0.25, 0.0, false, 0.0 )
	    pMonster:AddDamageWithLocateAngle( DT_STATUE_NORMAL_MISSILE, -0.25, 0.0, false, -0.5 )
	    pMonster:AddDamageWithLocateAngle( DT_STATUE_NORMAL_MISSILE, -0.25, 0.0, false, 0.5 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  라이트닝 웹
function Statue_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 76 ) then
		pMonster:PlaySound(998038)
		
		local fTargetX = pMonster:GetTargetX()
		local fTargetY = pMonster:GetTargetY()
		
		pMonster:AddDamageWithLocate(DT_STATUE_LIGHTNING_WEB, fTargetX, fTargetY, true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  점프 상태
function Statue_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 2 ) then
		local posy = -0.1
		local posx = 0.0
		
		pMonster:AddTraceParticleToBone( "Statue_Buster_Jump_01", 1.0, 34, 0, 0, posx, posy )
		pMonster:AddTraceParticleToBone( "Statue_Buster_Jump_04", 1.0, 34, 0, 0, posx, posy )
		pMonster:AddTraceParticleToBone( "Statue_Buster_Jump_03", 1.0, 34, 0, 0, posx, posy )
		
		pMonster:AddTraceParticleToBone( "Statue_Buster_Jump_01", 1.0, 23, 0, 0, posx, posy )
		pMonster:AddTraceParticleToBone( "Statue_Buster_Jump_04", 1.0, 23, 0, 0, posx, posy )
		pMonster:AddTraceParticleToBone( "Statue_Buster_Jump_03", 1.0, 23, 0, 0, posx, posy )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end

end

--  스톤커스 걸렸음
function Statue_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Statue_IceCurseFunc( iMonsterIndex, iFrame )
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
function Statue_HoldFunc( iMonsterIndex, iFrame )
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

function Statue_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -200 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function Statue_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -500, 520, 500, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Statue_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Statue_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 500, -200, 60, 200, -120 ) == true and pMonster:FloatRand() < 0.5) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK_READY" )
			pMonster:ResetDelay()
	end
end

function Statue_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 160, 200, -240 ) == true ) then
	
		if ( pMonster:FloatRand() < 0.8) then				
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetState( "WALK_END" )
		end
		
		pMonster:ResetDelay()
	end
end

function Statue_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Statue_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:GetSummonedMonsterCount() <= 2 ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:AddCountValue(-5)
		pMonster:ResetDelay()
	end
end

function Statue_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -400, 400, 400, -300 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Statue_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -400, 400, 400, -300 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function Statue_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, 300, 300, -250 ) == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

function Statue_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 520, 200, 160 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Statue_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Statue_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, -150, 200, -400 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function Statue_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 120, -130, 100, 130, -140 ) == true ) then
		if ( pMonster:FloatRand() < 0.6 ) then
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetState( "WAIT" )
		end
		pMonster:ResetDelay()
	end
end


function Statue_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- 어슬렁대기..  방향 바꾸기 후 이동
function Statue_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- 어슬렁대는 중.. 멈추기
function Statue_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnStatue_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
	elseif( pMonster:CheckState( "DIE_LANDING" ) == true ) then
		pMonster:SetState( "ATTACK01" )
    end

	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING" )
	end
end

function OnStatue_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false ) then
		pMonster:TurnToTarget()
		
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.02 )
		else
			pMonster:SetSpeedX( 0.02 )
		end
	
		pMonster:SetState( "DIE_LANDING" )
		
	end
end

function OnStatue_Damage( iMonsterIndex )
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
	
	if ( pMonster:FloatRand() < 0.1 ) then	
		pMonster:SetState( "ATTACK04" )
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor(true)
	end
end

function Statue_Jump( iMonsterIndex )
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

function Statue_MoveFail( iMonsterIndex )
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

function Statue_IdleMoveFail( iMonsterIndex )
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
