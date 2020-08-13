-- AI_Wendy.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Wendy_Wait.frm",
        Func    = "Wendy_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Wendy_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "Wendy_Check_ReleaseTarget",
                DelayFrame          = 440,
            },

            -- 타겟을 향하여 돌기
            {
                AICheckFrame        = 55,
                AIFunc              = "Wendy_Check_TurnToTarget",
                DelayFrame          = 55,
            },

            -- 걷기
            {
                AICheckFrame        = 55,
                AIFunc              = "Wendy_Check_Walk",
                DelayFrame          = 75,
            },
             -- 하이점프
            {
                AICheckFrame        = 110,
                AIFunc              = "Wendy_Check_HighJump",
                DelayFrame          = 110,
            }, 
            -- 점프다운
            {
                AICheckFrame        = 55,
                AIFunc              = "Wendy_Check_JumpDown",
                DelayFrame          = 110,
            }, 

            -- 근접공격
            {
                AICheckFrame        = 55,
                AIFunc              = "Wendy_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 지진공격
            --{
            --    AICheckFrame        = 55,
            --    AIFunc              = "Wendy_Check_Attack03",
            --    DelayFrame          = 220,
            --},

            -- 프리즌브레스
            {
                AICheckFrame        = 75,
                AIFunc              = "Wendy_Check_Attack04",
                DelayFrame          = 440,
            },

        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "Wendy_Walk.frm",
        Func    = "Wendy_WalkFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Wendy_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향하여 돌기
            {
                AICheckFrame        = 55,
                AIFunc              = "Wendy_Check_TurnToTarget",
                DelayFrame          = 55,
            },  
            -- 근접공격
            {
                AICheckFrame        = 55,
                AIFunc              = "Wendy_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 구르기공격
            {
                AICheckFrame        = 75,
                AIFunc              = "Wendy_Check_Attack02",
                DelayFrame          = 220,
            },
             -- 하이점프
            {
                AICheckFrame        = 35,
                AIFunc              = "Wendy_Check_HighJump",
                DelayFrame          = 75,
            }, 
            -- 점프다운
            {
                AICheckFrame        = 55,
                AIFunc              = "Wendy_Check_JumpDown",
                DelayFrame          = 55,
            }, 
        }
    },

    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Wendy_Attack01.frm",
        Func    = "Wendy_Attack01Func",
    },

    -- 구르기공격
    {
        ID      = "ATTACK02",
        Motion  = "Wendy_Attack02.frm",
        Func    = "Wendy_Attack02Func",
    },
    
    -- 지진공격
    {
        ID      = "ATTACK03",
        Motion  = "Wendy_Attack03.frm",
        Func    = "Wendy_Attack03Func",
    },
    
    -- 프리즌브레스
    {
        ID      = "ATTACK04",
        Motion  = "Wendy_Attack04.frm",
        Func    = "Wendy_Attack04Func",
    },
    
    -- 하이점프 올라가는상태
    {
        ID      = "HIGHJUMP_UP",
        Motion  = "Wendy_Jump_up.frm",
        Func    = "Wendy_HighJumpUpFunc",
    },
    
    -- 하이점프 내려오는상태
    {
        ID      = "HIGHJUMP_DOWN",
        Motion  = "Wendy_Jump_down.frm",
        Func    = "Wendy_HighJumpDownFunc",
    },
    
    -- 하이점프 착지
    {
        ID      = "HIGHJUMP_LANDING",
        Motion  = "Wendy_Jump_landing.frm",
        Func    = "Wendy_HighJumpLandingFunc",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Wendy_Damage_Up.frm",
        Func    = "Wendy_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Wendy_Damage_Middle.frm",
        Func    = "Wendy_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Wendy_Damage_Down.frm",
        Func    = "Wendy_DamageFunc",
    },
    
    -- 다운 상01
    {
        ID      = "DOWN_UP01",
        Motion  = "Wendy_Down_Up01.frm",
        Func    = "Wendy_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Wendy_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "Wendy_Down_Up02.frm",
        Func    = "Wendy_DownUpFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Wendy_Down_Up03.frm",
        Func    = "Wendy_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Wendy_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 중 
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Wendy_Down_middle.frm",
        Func    = "Wendy_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Wendy_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하 
    {
        ID      = "DOWN_DOWN",
        Motion  = "Wendy_Down_Down.frm",
        Func    = "Wendy_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Wendy_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
     -- 다운 스페셜 
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Wendy_Down_Special01.frm",
        Func    = "Wendy_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Wendy_Down_Special02.frm",
        Func    = "Wendy_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Wendy_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Wendy_Standup.frm",
        Func    = "Wendy_StandupFunc",
    },

    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Wendy_Die.frm",
        Func    = "Wendy_DieFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Wendy_Stone.frm",
        Func    = "Wendy_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Wendy_Stone.frm",
        Func    = "Wendy_IceCurseFunc",
    },
    
    -- 홀드상태
    {
        ID      = "HOLD",
        Motion  = "Wendy_Stone.frm",
        Func    = "Wendy_HoldFunc",
    },
}

CallBack =
{
    Land    = "OnWendy_Land",
    Die     = "OnWendy_Die",
    Damage  = "OnWendy_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitWendy( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
	pMonster:RegistReaction( ATTACKTYPE_HOLD, ATTACKDIR_NORMAL,   "HOLD" )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Wendy_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Wendy_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 근접공격 상태
function Wendy_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 70 ) then
		pMonster:AddDamage( DT_MONSTER_WENDY01 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 구르기공격 상태
function Wendy_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 53 ) then
	    pMonster:SkillReadyEffectNoStop( 100, 100, 255, 0.0 )
	elseif( iFrame > 71 and iFrame < 110 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5.5 )

		if( iFrame == 76 ) then
			pMonster:AddDamage( DT_MONSTER_WENDY02 )
		end
		
	elseif( iFrame == 130 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 지진공격 상태
function Wendy_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
        pMonster:StartText( "JUMP" )
    elseif( iFrame == 96 ) then
	    pMonster:SkillReadyEffectNoStop( 100, 100, 255, 0.0 )
	elseif( iFrame == 125 ) then
		pMonster:EarthQuake( 30, 0.06, 0.03 )
	elseif( iFrame == 126 ) then
		pMonster:PlaySound( "47", 0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 프리즌브레스 상태
function Wendy_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 60 ) then
	    pMonster:SkillReadyEffectNoStop( 100, 100, 255, 0.0 )
    elseif( iFrame == 75 ) then
	    pMonster:PlaySound(237)
    elseif( iFrame == 90 ) then
        pMonster:AddDamage( DT_MONSTER_WENDY03 )
        pMonster:AddParticle("Wendy_SPECIAL1_01", 0.45, 0.17 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 하이점프 상 
function Wendy_HighJumpUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
        
        
        if( pMonster:GetSpeedY() < 0 ) then
			pMonster:SetState( "HIGHJUMP_DOWN" )
		end 
    end
end

-- 하이점프 하 
function Wendy_HighJumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 하이점프 착지 
function Wendy_HighJumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 죽었음
function Wendy_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1) then
		pMonster:SetInvincible( true )
                pMonster:PlaySound(236)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Wendy_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운
function Wendy_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )				
		
		if( pMonster:GetHP() <= 0 ) then
			--pMonster:SetState( "DIE_LANDING" )
			pMonster:EndMonster()
			pMonster:SetFrameLock( true )
		end		
    end
end

-- 다운 스페셜
function Wendy_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function Wendy_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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

-- 다운 상
function Wendy_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 일어나기
function Wendy_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame < 16 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
	elseif( iFrame == 25 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
	end
	
    if( iFrame <= 1) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:FloatRand() < 0.2 ) then
			pMonster:SetState( "ATTACK02" )
		else
			pMonster:SetState( "WAIT" )        
		end
    end
end


--  스톤커스 걸렸음
function Wendy_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
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
function Wendy_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
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

--  홀드 걸렸음
function Wendy_HoldFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
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
function Wendy_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Wendy_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1100, 900, 1100, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Wendy_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Wendy_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -150, 600, 150, -600 ) == false ) then
			pMonster:TurnToTarget()
            pMonster:SetState( "WALK" )
            pMonster:ResetDelay()
		end
    end
end

function Wendy_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 120, -120, 100, 120, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Wendy_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -200, 140, 200, -240 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Wendy_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -400, 400, 400, -450 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Wendy_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 250, -150, 150, 150, -150 ) == true and pMonster:GetCountValue() >= 3 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function Wendy_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -300, 800, 300, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		OnWendy_Jump( iMonsterIndex  )
		pMonster:SetState( "HIGHJUMP_UP" )
		pMonster:ResetDelay()
    end
end

function Wendy_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, -80, 150, -1000 ) == true ) then
        pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedY( 0.01 )            
        pMonster:SetState( "HIGHJUMP_UP" )
        pMonster:ResetDelay()
    end
end

function Wendy_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function Wendy_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnWendy_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckState( "HIGHJUMP_UP" ) == true or pMonster:CheckState( "HIGHJUMP_DOWN" ) == true ) then
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "HIGHJUMP_LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 1.0 ) / 2.0 )
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )
    end
end

function OnWendy_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "STONECURSE" ) == false ) then
		pMonster:SetState( "DIE" )
	end
end

function OnWendy_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 9.0 ) / 10.0 )
    pMonster:SetSpeedY( ( pMonster:GetSpeedY() * 9.0 ) / 10.0 )
    
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true ) then
        if( pMonster:IsSuperArmor() == false ) then
            pMonster:SetNoCheckContact( 5 )
        end
	end
    
    if( pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DOWN_DOWN" ) ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
	end
	
    if( pMonster:CheckPreState( "DOWN_UP01" ) or pMonster:CheckPreState( "DOWN_UP02") ) then
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
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and  pMonster:CheckState( "HOLD" ) == false ) then
		if ( pMonster:GetIsContact() == true and pMonster:FloatRand() < 0.03 ) then
            pMonster:TurnToTarget()
            pMonster:SetState( "ATTACK02" )
            pMonster:SetSuperArmor(true)
		end
    end
end

function OnWendy_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 3.9)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.0)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.8))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end