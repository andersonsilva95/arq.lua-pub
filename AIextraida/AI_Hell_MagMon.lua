-- AI_hell_prisoner.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "hell_prisoner_wait.frm",
        Func    = "hell_prisoner_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "hell_prisoner_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "hell_prisoner_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 35,
                AIFunc              = "hell_prisoner_Check_TurnToTarget",
                DelayFrame          = 35,
            },
            -- 근접공격
            {
                AICheckFrame        = 25,
                AIFunc              = "hell_prisoner_Check_Attack01",
                DelayFrame          = 55,
            },
            -- 박치기공격
            {
                AICheckFrame        = 75,
                AIFunc              = "hell_prisoner_Check_Attack02",
                DelayFrame          = 220,
            },
            -- 점프공격
            {
                AICheckFrame        = 55,
                AIFunc              = "hell_prisoner_Check_Attack03",
                DelayFrame          = 220,
            },
            -- 하이점프
            {
                AICheckFrame        = 55,
                AIFunc              = "hell_prisoner_Check_HighJump",
                DelayFrame          = 55,
            },
            -- 점프다운
            {
                AICheckFrame        = 55,
                AIFunc              = "hell_prisoner_Check_JumpDown",
                DelayFrame          = 55,
            },
            -- 걷기
            {
                AICheckFrame        = 55,
                AIFunc              = "hell_prisoner_Check_Walk",
                DelayFrame          = 75,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "hell_prisoner_Walk.frm",
        Func    = "hell_prisoner_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "hell_prisoner_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "hell_prisoner_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "hell_prisoner_Check_TurnToTarget",
                DelayFrame          = 55,
            },            
            -- 근접공격
            {
                AICheckFrame        = 15,
                AIFunc              = "hell_prisoner_Check_Attack01",
                DelayFrame          = 110,
            },
			-- 점프공격
            {
                AICheckFrame        = 55,
                AIFunc              = "hell_prisoner_Check_Attack03",
                DelayFrame          = 220,
            },
			-- 박치기공격
            {
                AICheckFrame        = 75,
                AIFunc              = "hell_prisoner_Check_Attack02",
                DelayFrame          = 220,
            },
            -- 하이점프
            {
                AICheckFrame        = 35,
                AIFunc              = "hell_prisoner_Check_HighJump",
                DelayFrame          = 75,
            },
            -- 점프다운
            {
                AICheckFrame        = 55,
                AIFunc              = "hell_prisoner_Check_JumpDown",
                DelayFrame          = 55,
            },
        }
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "hell_prisoner_attack02.frm",
        Func    = "hell_prisoner_Attack01Func",
    },
    
    -- Rolling Attack Start!!
    {
        ID      = "ATTACK02_1",
        Motion  = "hell_prisoner_attack01_A.frm",
        Func    = "hell_prisoner_Attack02Func1",
    },
    
    {
        ID      = "ATTACK02_2",
        Motion  = "hell_prisoner_attack01_B.frm",
        Func    = "hell_prisoner_Attack02Func2",
    },
    
    {
        ID      = "ATTACK02_3",
        Motion  = "hell_prisoner_attack01_C.frm",
        Func    = "hell_prisoner_Attack02Func3",
    },
    -- Rolling Attack End
    
    
    -- 점프공격
    {
        ID      = "ATTACK03",
        Motion  = "hell_prisoner_Attack03.frm",
        Func    = "hell_prisoner_Attack03Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "hell_prisoner_Jump01.frm",
        Func    = "hell_prisoner_JumpFunc",
    },
    
    -- 점프 착지
    {
        ID      = "JUMP_LANDING",
        Motion  = "hell_prisoner_Jump02.frm",
        Func    = "hell_prisoner_JumpLandingFunc",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "hell_prisoner_Damage_Up.frm",
        Func    = "hell_prisoner_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "hell_prisoner_Damage_Middle.frm",
        Func    = "hell_prisoner_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "hell_prisoner_Damage_Down.frm",
        Func    = "hell_prisoner_DamageFunc",
    },

    -- 다운 상01
    {
        ID      = "DOWN_UP01",
        Motion  = "hell_prisoner_Down_Up01.frm",
        Func    = "hell_prisoner_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "hell_prisoner_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "hell_prisoner_Down_Up02.frm",
        Func    = "hell_prisoner_DownUpFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "hell_prisoner_Down_Up03.frm",
        Func    = "hell_prisoner_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "hell_prisoner_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    --[[
    -- 다운 중 
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "hell_prisoner_Down_Middle.frm",
        Func    = "hell_prisoner_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "hell_prisoner_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하 
    {
        ID      = "DOWN_DOWN",
        Motion  = "hell_prisoner_Down_Middle.frm",
        Func    = "hell_prisoner_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "hell_prisoner_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
     -- 다운 스페셜 
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "hell_prisoner_Down_Up01.frm",
        Func    = "hell_prisoner_DownFunc",
        IsFallDownMotion    = TRUE,
    },
    ]]
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "hell_prisoner_Standup.frm",
        Func    = "hell_prisoner_StandupFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "hell_prisoner_Die01.frm",
        Func    = "hell_prisoner_Die01Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "hell_prisoner_Die02.frm",
        Func    = "hell_prisoner_Die02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "hell_prisoner_Stone.frm",
        Func    = "hell_prisoner_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "hell_prisoner_Stone.frm",
        Func    = "hell_prisoner_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "hell_prisoner_Stone.frm",
		Func	= "hell_prisoner_HoldFunc",
	},
  
}

CallBack =
{
    Land    = "Onhell_prisoner_Land",
    Die     = "Onhell_prisoner_Die",
    Damage  = "Onhell_prisoner_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function Inithell_prisoner( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
    
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    --[[
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    --]]
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function hell_prisoner_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

function hell_prisoner_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1100, 900, 1100, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end


-- 걷기 상태
function hell_prisoner_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end

end

--  근접공격 상태
function hell_prisoner_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= 26 and iFrame < 41 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
    elseif( iFrame >= 56 and iFrame < 61 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
    elseif( iFrame >= 71 and iFrame < 91 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
    elseif( iFrame == 106 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
    end
    
    
    if( iFrame == 33 ) then
		pMonster:PlaySound(425)
	elseif( iFrame == 38 ) then
		pMonster:StartAttack( 6, PAR_SMALL_DAMAGE, 0.25, 24, 25, 5 )
	elseif( iFrame == 65 ) then
		pMonster:PlaySound(425)
		pMonster:StartAttack( 7, PAR_BIG_DAMAGE, 0.3, 24, 24, 6 )
	elseif( iFrame == 111 ) then
		pMonster:StartAttack( 8, PAR_BIG_DAMAGE, 0.25, 24, 25, 4 )
	elseif( iFrame == 108 ) then
		pMonster:PlaySound(425)
		pMonster:EarthQuakeWithRange( 25, 0.06, 0.03, 0.25 )
		local posX = 0.4
		local posY = 0.05
		
		pMonster:AddParticle( "Sataniel_Warrior_Crash_01", posX, posY )
		pMonster:AddParticle( "Sataniel_Warrior_Crash_02", posX, posY )
		pMonster:AddParticle( "Sataniel_Warrior_Crash_05", posX, posY )
		pMonster:AddParticle( "Sataniel_Warrior_Crash_06", posX, posY )
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  RollingAttack Implement
function hell_prisoner_Attack02Func1( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:PlaySound(429)
        pMonster:SetSuperArmorFrame( pMonster:GetLastFrame() + 5 )
    elseif( iFrame == pMonster:GetLastFrame() - 7 ) then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK02_2" )
    end
end

function hell_prisoner_Attack02Func2( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if ( pMonster:GetSpeedX() == 0 ) then
        pMonster:SetState( "ATTACK02_3" )    
    end
    
    pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5.0 )
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame % 6 == 0 and pMonster:GetIsContact() == true ) then
		pMonster:AddDamage( DT_MONSTER_MAGMON_BLAZE )
	end
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK02_2" )    
    end
    
    if( iFrame == 7 ) then
        pMonster:StartAttack( 6, PAR_DOWN, 0.3, 0, 0, 5 )
	pMonster:PlaySound( 401 )
    end
end

function hell_prisoner_Attack02Func3( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then		
		pMonster:PlaySound(340)
        pMonster:SetSuperArmor( true )
        pMonster:SetSpeedX( 0 )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(425)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "STANDUP" )
    end
end
--  RollingAttack End

-- 점프공격 상태
function hell_prisoner_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 61 )then
		pMonster:PlaySound(985004)
		pMonster:StartAttack( 11, PAR_BIG_DAMAGE, 0.1, 15, 15, 5 )
		local posX = 0.47
		local posY = 0.2
		pMonster:AddParticle( "HellBeast_Bite_01", posX, posY )
		pMonster:AddParticle( "HellBeast_Bite_02", posX, posY )
	elseif( iFrame == 81 )then
		pMonster:StartAttack( 11, PAR_SMALL_DAMAGE, 0.1, 15, 15, 10 )
		local posX = 0.5
		local posY = 0.23
		pMonster:AddParticle( "HellBeast_Bite_01", posX, posY )
		pMonster:AddParticle( "HellBeast_Bite_02", posX, posY )
	elseif( iFrame == 95 )then
		pMonster:StartAttack( 11, PAR_SMALL_DAMAGE, 0.1, 15, 15, 5 )
		local posX = 0.45
		local posY = 0.2
		pMonster:AddParticle( "HellBeast_Bite_01", posX, posY )
		pMonster:AddParticle( "HellBeast_Bite_02", posX, posY )
	elseif( iFrame == 127 )then
		pMonster:StartAttack( 11, PAR_DOWN, 0.1, 15, 15, 10 )
		local posX = 0.5
		local posY = 0.16
		pMonster:AddParticle( "HellBeast_Bite_01", posX, posY )
		pMonster:AddParticle( "HellBeast_Bite_02", posX, posY )
		pMonster:AddParticle( "Jin01_SP2-2_Finish_02", posX, posY )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndAttack()
        pMonster:SetState( "WAIT" )
    end
end

-- 점프 상태
function hell_prisoner_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 점프착지 상태
function hell_prisoner_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 죽는상태
function hell_prisoner_Die01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:PlaySound(429)
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LANDING" )
    end
end

-- 죽는상태
function hell_prisoner_Die02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function hell_prisoner_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운
function hell_prisoner_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )				
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end		
    end
end

-- 다운 상
function hell_prisoner_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 일어나기
function hell_prisoner_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )        
    end
end


--  스톤커스 걸렸음
function hell_prisoner_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_medium", 3 )
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  아이스커스 걸렸음
function hell_prisoner_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_medium", 3 )
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end


-- 홀드 걸렸음(이펙트)
function hell_prisoner_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Middle", 0.0, 0.12 )
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

function hell_prisoner_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function hell_prisoner_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function hell_prisoner_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function hell_prisoner_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
        pMonster:AddCountValue(1)
		hell_prisoner_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function hell_prisoner_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

   if( pMonster:CheckTargetInRange( 60, -100, -80, 100, -1000 ) == true ) then
        pMonster:AddCountValue(1)
        pMonster:SetNoCheckContact(30)
        pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedY( 0.01 )            
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function hell_prisoner_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 150, 100, -150 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function hell_prisoner_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -200, 50, 300, -200 ) == true and pMonster:GetCountValue() >= 3 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK02_1" )
		pMonster:ResetDelay()
    end
end

function hell_prisoner_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 400, -200, 150, 200, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function hell_prisoner_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function hell_prisoner_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

  
function hell_prisoner_Process_Jump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 26 ) then
        pMonster:SetNoCheckContact(50)
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.4 )
		pMonster:SetSpeedY( 0.036 )			
     end
end
-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Onhell_prisoner_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckState( "JUMP" ) == true ) then		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "JUMP_LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 1.0 ) / 2.0 )
		pMonster:SetState( "DOWN_UP_LANDING" )
    end    
end

function Onhell_prisoner_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetState( "DIE" )
	end	
end

function Onhell_prisoner_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:AddCountValue(1)
	pMonster:SetPushCheck( true )	
	pMonster:SetSpeedX( ( pMonster:GetSpeedX() * 9.0 ) / 10.0 )
    pMonster:SetSpeedY( ( pMonster:GetSpeedY() * 9.0 ) / 10.0 )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "ATTACK03" ) == true ) then
        if( pMonster:IsSuperArmor() == false ) then
            pMonster:SetNoCheckContact( 5 )
        end
	end
    
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
	end
	
	if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
		if( pMonster:CheckState( "DAMAGE_UP" ) or pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.028 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DAMAGE_DOWN" ) ) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.019 )			
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -2.0 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_UP02" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )			
		end	
	end
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		if( pMonster:FloatRand() < 0.1 and pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false and pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK02_1" )
		end
	end
end

function hell_prisoner_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	local fSpeedX = ( fTargetX - fMonX ) * 1.5
	local fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function hell_prisoner_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.0) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(40)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.042 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.0120)			
		end
	end
end


function hell_prisoner_RollFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
	--[[
		if( pMonster:GetY() - (0.0) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(40)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.042 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.0120)			
		end
	]]--
	    
		--pMonster:SetState( "ATTACK02_3" )
		
	end
end
