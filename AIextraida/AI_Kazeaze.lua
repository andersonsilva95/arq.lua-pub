-- AI_Kazeaze.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Kazeaze_Wait.frm",
        Func    = "Kazeaze_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Kazeaze_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 15,
                AIFunc              = "Kazeaze_Check_TurnToTarget",
                DelayFrame          = 15,
            },

            -- 걷기
            {
                AICheckFrame        = 55,
                AIFunc              = "Kazeaze_Check_Walk",
                DelayFrame          = 55,
            },

            -- 달리기
            {
                AICheckFrame        = 10,
                AIFunc              = "Kazeaze_Check_Run",
                DelayFrame          = 45,
            },

            -- 점프업
            {
                AICheckFrame        = 25,
                AIFunc              = "Kazeaze_Check_JumpUp",
                DelayFrame          = 25,
            },        
            -- 점프다운
            {
                AICheckFrame        = 25,
                AIFunc              = "Kazeaze_Check_JumpDown",
                DelayFrame          = 25,
            },

            -- 근접공격
            {
                AICheckFrame        = 35,
                AIFunc              = "Kazeaze_Check_Attack01",
                DelayFrame          = 55,
            },

            -- 임팩트슬래쉬
            {
                AICheckFrame        = 55,
                AIFunc              = "Kazeaze_Check_Attack03",
                DelayFrame          = 55,
            },            

            -- 파이널스트라이크
            {
                AICheckFrame        = 110,
                AIFunc              = "Kazeaze_Check_Attack04",
                DelayFrame          = 440,
            },            

        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "Kazeaze_Walk.frm",
        Func    = "Kazeaze_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Kazeaze_MoveFail",


        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Kazeaze_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 25,
                AIFunc              = "Kazeaze_Check_TurnToTarget",
                DelayFrame          = 25,
            },
            -- 근접공격
            {
                AICheckFrame        = 55,
                AIFunc              = "Kazeaze_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 달리기
            {
                AICheckFrame        = 10,
                AIFunc              = "Kazeaze_Check_Run",
                DelayFrame          = 55,
            },
            -- 점프업
            {
                AICheckFrame        = 25,
                AIFunc              = "Kazeaze_Check_JumpUp",
                DelayFrame          = 25,
            },        
            -- 점프다운
            {
                AICheckFrame        = 25,
                AIFunc              = "Kazeaze_Check_JumpDown",
                DelayFrame          = 25,
            },
        }
    },
    
    --  달리기
    {
        ID      = "RUN",
        Motion  = "Kazeaze_Run.frm",
        Func    = "Kazeaze_RunFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Kazeaze_MoveFail",


        Trigger =
        {
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 35,
                AIFunc              = "Kazeaze_Check_TurnToTarget",
                DelayFrame          = 35,
            },
			 -- 근접공격02
            {
                AICheckFrame        = 1,
                AIFunc              = "Kazeaze_Check_Attack02",
                DelayFrame          = 55,
            },            
            -- 점프이동
            {
                AICheckFrame        = 15,
                AIFunc              = "Kazeaze_Check_JumpMove",
                DelayFrame          = 75,
            },
            -- 점프업
            {
                AICheckFrame        = 25,
                AIFunc              = "Kazeaze_Check_JumpUp",
                DelayFrame          = 25,
            },            
            -- 점프다운
            {
                AICheckFrame        = 25,
                AIFunc              = "Kazeaze_Check_JumpDown",
                DelayFrame          = 25,
            },		
			-- 멈추기
            {
                AICheckFrame        = 5,
                AIFunc              = "Kazeaze_Check_RunStop",
                DelayFrame          = 55,
            },            
        }
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Kazeaze_Attack01.frm",
        Func    = "Kazeaze_Attack01Func",
    },
    
    -- 근접공격02
    {
        ID      = "ATTACK02",
        Motion  = "Kazeaze_Attack02.frm",
        Func    = "Kazeaze_Attack02Func",
    },
    
    -- 임팩트슬래쉬
    {
        ID      = "ATTACK03",
        Motion  = "Kazeaze_Attack03.frm",
        Func    = "Kazeaze_Attack03Func",
    },
    
    -- 파이널스트라이크
    {
        ID      = "ATTACK04",
        Motion  = "Kazeaze_Attack04.frm",
        Func    = "Kazeaze_Attack04Func",
    },
    
    -- 파이널스트라이크
    {
        ID      = "ATTACK04_LANDING",
        Motion  = "Kazeaze_Attack04_Landing.frm",
        Func    = "Kazeaze_Attack04LandingFunc",
    },
    
     -- 기상공격
    {
        ID      = "STANDUPATTACK",
        Motion  = "Kazeaze_StandUpAttack.frm",
        Func    = "Kazeaze_StandUpAttackFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Kazeaze_Jump.frm",
        Func    = "Kazeaze_JumpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Kazeaze_Check_JumpAttack",
                DelayFrame          = 1,
            },
        }
    },

    -- 점프공격
    {
        ID      = "JUMPATTACK",
        Motion  = "Kazeaze_JumpAttack.frm",
        Func    = "Kazeaze_JumpAttackFunc",
    },
    
    -- 점프이동
    {
        ID      = "JUMPMOVE",
        Motion  = "Kazeaze_DoubleJump.frm",
        Func    = "Kazeaze_JumpMoveFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Kazeaze_Check_DoubleJumpAttack",
                DelayFrame          = 1,
            },
        }
    },

    -- 점프이동공격
    {
        ID      = "JUMPMOVEATTACK",
        Motion  = "Kazeaze_DoubleJumpAttack.frm",
        Func    = "Kazeaze_JumpMoveAttackFunc",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Kazeaze_Damage_Up.frm",
        Func    = "Kazeaze_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Kazeaze_Damage_Down.frm",
        Func    = "Kazeaze_DamageFunc",
    },
    
    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "Kazeaze_Down_Up01.frm",
        Func    = "Kazeaze_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Kazeaze_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "Kazeaze_Down_Up02.frm",
        Func    = "Kazeaze_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Kazeaze_Down_Up03.frm",
        Func    = "Kazeaze_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Kazeaze_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Kazeaze_Down_Middle.frm",
        Func    = "Kazeaze_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Kazeaze_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
	-- 다운 중
    {
        ID      = "DOWN_DOWN",
        Motion  = "Kazeaze_Down_Middle.frm",
        Func    = "Kazeaze_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Kazeaze_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Kazeaze_Down_Special01.frm",
        Func    = "Kazeaze_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Kazeaze_Down_Special02.frm",
        Func    = "Kazeaze_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Kazeaze_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Kazeaze_Stand_Up.frm",
        Func    = "Kazeaze_StandUpFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Kazeaze_Die01.frm",
        Func    = "Kazeaze_DieFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE_LANDING",
        Motion  = "Kazeaze_Die02.frm",
        Func    = "Kazeaze_DieFunc",
    },
    
    -- 회피
    {
        ID      = "AVOID",
        Motion  = "Kazeaze_Avoid.frm",
        Func    = "Kazeaze_AvoidFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Kazeaze_CheckAvoidAttack",
                DelayFrame          = 1,
            },
        }
    },
    
    -- 공중회피
    {
        ID      = "AERIALAVOID",
        Motion  = "Kazeaze_DoubleJump.frm",
        Func    = "Kazeaze_AerialAvoidFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Kazeaze_Stone.frm",
        Func    = "Kazeaze_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Kazeaze_Stone.frm",
        Func    = "Kazeaze_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Kazeaze_Stone.frm",
		Func	= "Kazeaze_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnKazeaze_Land",
    Die     = "OnKazeaze_Die",
    Damage  = "OnKazeaze_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitKazeaze( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

	pMonster:AddTraceParticleToBone( "Kaz_Back_01", 0.5, 7, 5, 5, -0.0, 0.05, false )
	pMonster:AddTraceParticleToBone( "Kaz_Back_02", 0.3, 7, 6, 6, -0.0, 0.05, false )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Kazeaze_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
    

end

-- 걷기 상태
function Kazeaze_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 달리기 상태
function Kazeaze_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

-- 죽는상태
function Kazeaze_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
		pMonster:SetFrameLock( true )
        --pMonster:SetState( "WAIT" )
    end
end

-- 데미지 입은거
function Kazeaze_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function Kazeaze_DownUp01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function Kazeaze_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운
function Kazeaze_DownFunc( iMonsterIndex, iFrame )
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

-- 다운 스페셜
function Kazeaze_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function Kazeaze_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function Kazeaze_StandUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 31 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( 0.008 )
		else
			pMonster:SetSpeedX( -0.008 )
		end	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  근접공격01 상태
function Kazeaze_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 40 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 4.0 )
	elseif( iFrame == 41 ) then
		pMonster:AddDamage( DT_MONSTER_KAZEAZE01_01 )
	elseif( iFrame == 48 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )	
	elseif( iFrame == 61 ) then
		pMonster:AddDamage( DT_MONSTER_KAZEAZE01_02 )
	elseif( iFrame == 81 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.5 )	
	elseif( iFrame == 82 ) then 
		pMonster:AddDamage( DT_MONSTER_KAZEAZE01_03 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격02 상태
function Kazeaze_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 30 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 4.0 )
	elseif( iFrame == 46 ) then
		pMonster:AddDamage( DT_MONSTER_KAZEAZE01_02 )
		pMonster:PlaySound(3)
	elseif( iFrame == 62 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )	
	elseif( iFrame == 65 ) then 
		pMonster:AddDamage( DT_MONSTER_KAZEAZE01_02 )
		pMonster:PlaySound(3)
	elseif( iFrame == 78 ) then 
		pMonster:AddDamage( DT_MONSTER_KAZEAZE01_01 )

	elseif( iFrame == 84 ) then 
		pMonster:AddDamage( DT_MONSTER_KAZEAZE01_01 )
	elseif( iFrame == 90 ) then 
		pMonster:AddDamage( DT_MONSTER_KAZEAZE01_01 )
	elseif( iFrame == 119 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.5 )	
	elseif( iFrame == 122 ) then 
		pMonster:AddDamage( DT_MONSTER_KAZEAZE01_03 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 임팩트슬래쉬 상태
function Kazeaze_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 21 ) then
		--pMonster:SkillReadyEffectNoStop( 0, 0, 0, 0.0 ) 
		pMonster:PlaySound(179)
	elseif( iFrame == 61 ) then 
		pMonster:AddDamage(DT_KAZEAZE_IMPACT_SMASH)
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetState( "WAIT" )
    end
end

-- 파이널스트라이크 상태
function Kazeaze_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 5 )
	elseif( iFrame == 9 ) then 
		pMonster:SetNoCheckContact(15)
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -10.0 )	
		pMonster:SetSpeedY( 0.1 )	
		pMonster:SetFly( true )
	elseif( iFrame == 16 ) then 
		pMonster:SetSpeedX( 0.0 )	
		pMonster:SetSpeedY( 0.0 )	
	elseif( iFrame == 61 ) then 
		if( pMonster:GetIsRight() == true ) then
			pMonster:AddDamage( DT_MONSTER_KAZEAZE04_01 )
		else
			pMonster:AddDamageWithAngle( DT_MONSTER_KAZEAZE04_01, -3.1 )
		end
	elseif( iFrame == 67 ) then 
		pMonster:PlaySound(181)
	elseif( iFrame == 71 ) then 
		if( pMonster:GetIsRight() == true ) then
			pMonster:AddDamage( DT_MONSTER_KAZEAZE04_02 )
		else
			pMonster:AddDamageWithAngle( DT_MONSTER_KAZEAZE04_02, -3.1 )
		end
	elseif( iFrame == 81 ) then 
		if( pMonster:GetIsRight() == true ) then
			pMonster:AddDamage( DT_MONSTER_KAZEAZE04_03 )
		else
			pMonster:AddDamageWithAngle( DT_MONSTER_KAZEAZE04_03, -3.1 )
		end
	elseif( iFrame == 91 ) then 
		if( pMonster:GetIsRight() == true ) then
			pMonster:AddDamage( DT_MONSTER_KAZEAZE04_01 )
		else
			pMonster:AddDamageWithAngle( DT_MONSTER_KAZEAZE04_01, -3.1 )
		end
	elseif( iFrame == 96 ) then 
		pMonster:SetNoCheckContact(30)		
		pMonster:SetFly( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

--  파이널스트라이크착지 상태
function Kazeaze_Attack04LandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 )then
		--pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  기상공격
function Kazeaze_StandUpAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 )then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 5 ) then
		pMonster:AddDamage( DT_MONSTER_KAZEAZE05 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프이동 상태
function Kazeaze_JumpMoveFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 )then
		pMonster:SetPushCheck( true )
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프이동공격 상태
function Kazeaze_JumpMoveAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 6 ) then 
		pMonster:PlaySound(1)
	elseif( iFrame == 7 ) then 
		pMonster:AddDamageWithAngle( DT_MONSTER_KAZEAZE03, -1.3 )
	elseif( iFrame == 8 ) then 
		pMonster:AddDamageWithAngle( DT_MONSTER_KAZEAZE03, -1.7 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function Kazeaze_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프공격 상태
function Kazeaze_JumpAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 3 ) then 
		pMonster:PlaySound(2)
	elseif( iFrame == 4 ) then 
		pMonster:AddDamage( DT_MONSTER_KAZEAZE02 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  회피 상태
function Kazeaze_AvoidFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then	
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck( true )
		pMonster:Turn()		
    end
end

--  공중회피 상태
function Kazeaze_AerialAvoidFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then	
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
    end
end

--  석화 상태
function Kazeaze_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Kazeaze_IceCurseFunc( iMonsterIndex, iFrame )
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
function Kazeaze_HoldFunc( iMonsterIndex, iFrame )
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

function Kazeaze_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Kazeaze_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Kazeaze_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 0, -100, 200, 100, -200 ) == false ) then
			pMonster:TurnToTarget()
            pMonster:SetState( "WALK" )
            pMonster:ResetDelay()
    end
end

function Kazeaze_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 350, -250, 200, 250, -200 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "RUN" )
        pMonster:ResetDelay()
    end
end

function Kazeaze_Check_RunStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 320, -300, 800, 300, -800 ) == false ) then
		pMonster:SetState( "WAIT" )			
		pMonster:ResetDelay()
    end
end

function Kazeaze_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Kazeaze_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 40, 100, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Kazeaze_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 50, 150, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Kazeaze_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 40, 150, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Kazeaze_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange(300, -200, 200, 200, -200 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function Kazeaze_Check_JumpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( iFrame > 20 and pMonster:CheckTargetInRange( 80, -80, 50, 80, -150 ) == true ) then
		pMonster:SetState( "JUMPATTACK" )
		pMonster:ResetDelay()
    end
end

function Kazeaze_Check_DoubleJumpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( iFrame < 40 and iFrame >= 10 and pMonster:CheckTargetInRange( -50, -50, 0, 50, -800 ) == true ) then
		pMonster:SetState( "JUMPMOVEATTACK" )
		pMonster:ResetDelay()
    end
end

function Kazeaze_Check_JumpMove( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 400, -200, 100, 200, -100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetNoCheckContact(50)
		pMonster:SetState( "JUMPMOVE" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5.0 )
		pMonster:SetSpeedY( 0.040 )			
		pMonster:ResetDelay()
	end
end

function Kazeaze_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -300, 600, 300, 40 ) == true and pMonster:GetIsContact() == true ) then
		Kazeaze_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Kazeaze_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 60, -100, -90, 100, -600 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Kazeaze_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		if( pMonster:CheckTargetInRange( 0, -100, 150, 100, -100 ) == true ) then
			pMonster:SetState( "STANDUPATTACK" )
		elseif( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetNoCheckContact(50)
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5.0 )
			pMonster:SetSpeedY( 0.040 )			
			pMonster:SetState( "JUMPMOVE" )
		else
			pMonster:SetState( "STANDUP" )
		end	
    end
end

function Kazeaze_CheckAvoidAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:CheckTargetInRange( 100, -100, 150, 100, -100 ) == true ) then
			pMonster:SetState( "ATTACK03" )
		elseif( pMonster:CheckTargetInRange( 200, -100, 150, 100, -100 ) == true ) then
			pMonster:SetNoCheckContact(50)
			pMonster:SetState( "JUMPMOVE" )
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5.0 )
			pMonster:SetSpeedY( 0.040 )
		else
			pMonster:SetState( "WAIT" )
		end
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnKazeaze_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPATTACK" ) == true or pMonster:CheckState( "JUMPMOVE" ) == true or pMonster:CheckState( "JUMPMOVEATTACK" ) == true or pMonster:CheckState( "AERIALAVOID" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    elseif( pMonster:CheckState( "ATTACK04" ) == true ) then
		pMonster:SetState( "ATTACK04_LANDING" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 80 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 80 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end
end

function OnKazeaze_Die( iMonsterIndex )
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

function OnKazeaze_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end
	
	if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
		pMonster:SetNoCheckContact( 25 )
		--pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
		if( pMonster:CheckState( "DAMAGE_UP" ) or pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.03 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DAMAGE_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.02 )			
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -4.0 )
			pMonster:SetNoCheckContact( 5 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_MIDDLE" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )			
		end	
	end

    if( pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false ) then

		if( pMonster:GetIsContact() == true ) then
			if( pMonster:FloatRand() < 0.05 ) then
				pMonster:SetSpeedX( 0.0 )
				pMonster:SetSpeedY( 0.0 )
				pMonster:TurnToTarget()
				pMonster:SetState( "AVOID" )
			end
		elseif( pMonster:CheckState( "DOWN_UP01" ) == true ) then
			if( pMonster:FloatRand() < 0.01 ) then
				pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5.0 )
				pMonster:SetSpeedY( 0.04 )
				pMonster:TurnToTarget()
				pMonster:SetState( "AERIALAVOID" )
			end
		end
		
		pMonster:SetNoCheckContact( 0 )
    end
    
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
end

function Kazeaze_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	if( fTargetY - fMonY == 0.0 ) then
		fTargetY = fTargetY + 0.01
	end
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.7) + pMonster:FloatAbs((fSpeedX / 2.9)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Kazeaze_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(20)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.018)			
		end
	end
end