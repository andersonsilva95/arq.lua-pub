-- AI_NagasiMon.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "NagasiMon_Wait.frm",
        Func    = "NagasiMon_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "NagasiMon_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 330,
                AIFunc              = "NagasiMon_Check_ReleaseTarget",
                DelayFrame          = 550,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 35,
                AIFunc              = "NagasiMon_Check_TurnToTarget",
                DelayFrame          = 35,
            },
            -- 근접공격
            {
                AICheckFrame        = 25,
                AIFunc              = "NagasiMon_Check_Attack01",
                DelayFrame          = 55,
            },
            -- 플라잉임팩트
            {
                AICheckFrame        = 75,
                AIFunc              = "NagasiMon_Check_Attack02",
                DelayFrame          = 75,
            },
            -- 파이어드랜스
            {
                AICheckFrame        = 55,
                AIFunc              = "NagasiMon_Check_Attack03",
                DelayFrame          = 165,
            },            
            -- 하이점프
            {
                AICheckFrame        = 75,
                AIFunc              = "NagasiMon_Check_HighJump",
                DelayFrame          = 75,
            },
            -- 점프다운
            {
                AICheckFrame        = 75,
                AIFunc              = "NagasiMon_Check_JumpDown",
                DelayFrame          = 75,
            },
            -- 걷기
            {
                AICheckFrame        = 55,
                AIFunc              = "NagasiMon_Check_Walk",
                DelayFrame          = 55,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "NagasiMon_Walk.frm",
        Func    = "NagasiMon_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "NagasiMon_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "NagasiMon_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "NagasiMon_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 근접공격
            {
                AICheckFrame        = 15,
                AIFunc              = "NagasiMon_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 파이어드랜스
            {
                AICheckFrame        = 55,
                AIFunc              = "NagasiMon_Check_Attack03",
                DelayFrame          = 220,
            },
            -- 하이점프
            {
                AICheckFrame        = 75,
                AIFunc              = "NagasiMon_Check_HighJump",
                DelayFrame          = 75,
            },
            -- 점프다운
            {
                AICheckFrame        = 75,
                AIFunc              = "NagasiMon_Check_JumpDown",
                DelayFrame          = 75,
            },
        }
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "NagasiMon_Attack01.frm",
        Func    = "NagasiMon_Attack01Func",
    },
    
    -- 플라잉임팩트
    {
        ID      = "ATTACK02",
        Motion  = "NagasiMon_Attack02.frm",
        Func    = "NagasiMon_Attack02Func",
    },
    
    -- 파이어드랜스
    {
        ID      = "ATTACK03",
        Motion  = "NagasiMon_Attack03.frm",
        Func    = "NagasiMon_Attack03Func",
    },
	
	-- 반격
    {
        ID      = "ATTACK04",
        Motion  = "NagasiMon_Attack04.frm",
        Func    = "NagasiMon_Attack04Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "NagasiMon_Jump.frm",
        Func    = "NagasiMon_JumpFunc",
    },
    
    -- 점프 착지
    {
        ID      = "JUMP_LANDING",
        Motion  = "NagasiMon_Jump_Landing.frm",
        Func    = "NagasiMon_JumpLandingFunc",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "NagasiMon_Damage_Up.frm",
        Func    = "NagasiMon_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "NagasiMon_Damage_Middle.frm",
        Func    = "NagasiMon_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "NagasiMon_Damage_Down.frm",
        Func    = "NagasiMon_DamageFunc",
    },
    
    -- 다운 상01
    {
        ID      = "DOWN_UP01",
        Motion  = "NagasiMon_Down_Up01.frm",
        Func    = "NagasiMon_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "NagasiMon_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "NagasiMon_Down_Up02.frm",
        Func    = "NagasiMon_DownUpFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "NagasiMon_Down_Up03.frm",
        Func    = "NagasiMon_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "NagasiMon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 중 
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "NagasiMon_Down_Middle.frm",
        Func    = "NagasiMon_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "NagasiMon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하 
    {
        ID      = "DOWN_DOWN",
        Motion  = "NagasiMon_Down_Middle.frm",
        Func    = "NagasiMon_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "NagasiMon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
     -- 다운 스페셜 
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "NagasiMon_Down_Special.frm",
        Func    = "NagasiMon_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "NagasiMon_Standup.frm",
        Func    = "NagasiMon_StandupFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "NagasiMon_Die01.frm",
        Func    = "NagasiMon_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "NagasiMon_Die02.frm",
        Func    = "NagasiMon_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "NagasiMon_Stone.frm",
        Func    = "NagasiMon_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "NagasiMon_Stone.frm",
        Func    = "NagasiMon_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "NagasiMon_Stone.frm",
		Func	= "NagasiMon_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnNagasiMon_Land",
    Die     = "OnNagasiMon_Die",
    Damage  = "OnNagasiMon_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitNagasiMon( iMonsterIndex )
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
function NagasiMon_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function NagasiMon_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
		
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end

end

--  근접공격 상태
function NagasiMon_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 28 ) then
		pMonster:AddDamage( DT_NAGASIMON01 )
		pMonster:PlaySound(2)
		pMonster:PlaySound(1026)
	elseif( iFrame == 31 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  플라잉 임팩트 상태
function NagasiMon_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )	
	elseif( iFrame == 31 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
	elseif( iFrame == 34 ) then
		pMonster:AddDamage( DT_NAGASIMON02_01 )
		pMonster:PlaySound(1)
		pMonster:PlaySound(1027)
	elseif( iFrame == 71 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
	elseif( iFrame == 76 ) then
		pMonster:PlaySound(2)
		pMonster:AddDamage( DT_NAGASIMON02_02_EFFECT )
		pMonster:AddDamage( DT_NAGASIMON02_02 )		
	elseif( iFrame == 86 ) then
		pMonster:SkillReadyEffectNoStop( 200, 200, 200, 0.0 )	
	elseif( iFrame == 96 ) then
		pMonster:AddDamage( DT_NAGASIMON02_03 )	
		pMonster:PlaySound(1)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  파이어드랜스 상태
function NagasiMon_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
		pMonster:PlaySound(1028)
	elseif( iFrame == 31 ) then
		pMonster:SkillReadyEffectNoStop( 200, 200, 200, 0.0 )	
	elseif( iFrame == 61 ) then
		pMonster:AddDamage( DT_NAGASIMON03 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  반격 상태
function NagasiMon_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 38 ) then
		pMonster:AddDamage( DT_NAGASIMON01 )
		pMonster:PlaySound(2)
	elseif( iFrame == 41 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 점프 상태
function NagasiMon_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 점프착지 상태
function NagasiMon_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 죽는상태
function NagasiMon_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:PlaySound(1030)
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function NagasiMon_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운
function NagasiMon_DownFunc( iMonsterIndex, iFrame )
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
function NagasiMon_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
	elseif( iFrame == 3 ) then
		pMonster:PlaySound(1029)
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 스페셜
function NagasiMon_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function NagasiMon_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function NagasiMon_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame < 16 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
	elseif( iFrame == 25 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
	end
	
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )        
    end
end


--  스톤커스 걸렸음
function NagasiMon_StoneCurseFunc( iMonsterIndex, iFrame )
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
function NagasiMon_IceCurseFunc( iMonsterIndex, iFrame )
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
function NagasiMon_HoldFunc( iMonsterIndex, iFrame )
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

function NagasiMon_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function NagasiMon_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1100, 900, 1100, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function NagasiMon_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function NagasiMon_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function NagasiMon_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
        pMonster:AddCountValue(1)
		NagasiMon_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function NagasiMon_Check_JumpDown( iMonsterIndex, iFrame )
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

function NagasiMon_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 120, -130, 150, 130, -150 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function NagasiMon_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -200, 150, 200, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function NagasiMon_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 400, -200, 150, 200, -100 ) == true and pMonster:GetCountValue() >= 3 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function NagasiMon_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function NagasiMon_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnNagasiMon_Land( iMonsterIndex )
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

function OnNagasiMon_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetState( "DIE" )
	end	
end

function OnNagasiMon_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:AddCountValue(1)
	pMonster:SetPushCheck( true )	
	pMonster:SetSpeedX( (pMonster:GetSpeedX() * 9.0 ) / 10.0 )
    pMonster:SetSpeedY( ( pMonster:GetSpeedY() * 9.0 ) / 10.0 )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true ) then
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
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		if( pMonster:FloatRand() < 0.2 and pMonster:GetIsContact() == true ) then
			pMonster:TurnToTarget()			
			pMonster:SetState( "ATTACK04" )
			pMonster:SetSuperArmor( true )
		end
    end
end

function NagasiMon_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function NagasiMon_MoveFail( iMonsterIndex )
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
