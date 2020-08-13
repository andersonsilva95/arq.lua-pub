-- AI_Elizabeth.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Elizabeth_Wait.frm",
        Func    = "Elizabeth_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Elizabeth_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 330,
                AIFunc              = "Elizabeth_Check_ReleaseTarget",
                DelayFrame          = 550,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 35,
                AIFunc              = "Elizabeth_Check_TurnToTarget",
                DelayFrame          = 35,
            },
            -- 근접공격
            {
                AICheckFrame        = 110,
                AIFunc              = "Elizabeth_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 점프공격
            {
                AICheckFrame        = 400,
                AIFunc              = "Elizabeth_JumpAttack",
                DelayFrame          = 550,
            },
            
            -- 그라운드 브레이크
            {
                AICheckFrame        = 220,
                AIFunc              = "Elizabeth_Check_Attack04",
                DelayFrame          = 330,
            },
			
			-- 롤링어택
            {
                AICheckFrame        = 500,
                AIFunc              = "Elizabeth_Check_Attack05",
                DelayFrame          = 500,
            },
			
            -- 걷기
            {
                AICheckFrame        = 75,
                AIFunc              = "Elizabeth_Check_Walk",
                DelayFrame          = 110,
            },            
            -- 하이점프
            {
                AICheckFrame        = 55,
                AIFunc              = "Elizabeth_Check_HighJump",
                DelayFrame          = 55,
            },
            -- 점프다운
            {
                AICheckFrame        = 55,
                AIFunc              = "Elizabeth_Check_JumpDown",
                DelayFrame          = 55,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "Elizabeth_Walk.frm",
        Func    = "Elizabeth_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Elizabeth_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "Elizabeth_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "Elizabeth_Check_TurnToTarget",
                DelayFrame          = 55,
            },       
            -- 근접공격
            {
                AICheckFrame        = 75,
                AIFunc              = "Elizabeth_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 하이점프
            {
                AICheckFrame        = 35,
                AIFunc              = "Elizabeth_Check_HighJump",
                DelayFrame          = 55,
            },
            -- 점프다운
            {
                AICheckFrame        = 55,
                AIFunc              = "Elizabeth_Check_JumpDown",
                DelayFrame          = 55,
            },
        }
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Elizabeth_Attack01.frm",
        Func    = "Elizabeth_Attack01Func",
    },
    
    -- 배치기
    {
        ID      = "ATTACK02",
        Motion  = "Elizabeth_Attack02.frm",
        Func    = "Elizabeth_Attack02Func",
    },
    
    -- 땅찍기
    {
        ID      = "ATTACK04",
        Motion  = "Elizabeth_Attack04.frm",
        Func    = "Elizabeth_Attack04Func",
    },
	
	-- 롤링어택
    {
        ID      = "ATTACK05",
        Motion  = "Elizabeth_Attack05.frm",
        Func    = "Elizabeth_Attack05Func",
    },
    
    -- 점프공격
    {
        ID      = "JUMPATTACK",
        Motion  = "Elizabeth_JumpAttack.frm",
        Func    = "Elizabeth_JumpAttackFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Elizabeth_Process_Jump",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 점프공격_착지
    {
        ID      = "JUMPATTACK_LANDING",
        Motion  = "Elizabeth_JumpAttack_Landing.frm",
        Func    = "Elizabeth_JumpAttackLandingFunc",
    },
        
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Elizabeth_Jump.frm",
        Func    = "Elizabeth_JumpFunc",
    },
    
    -- 점프 착지
    {
        ID      = "JUMP_LANDING",
        Motion  = "Elizabeth_Jump_Landing.frm",
        Func    = "Elizabeth_JumpLandingFunc",
    },
    

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Elizabeth_Damage_Up.frm",
        Func    = "Elizabeth_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Elizabeth_Damage_Middle.frm",
        Func    = "Elizabeth_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Elizabeth_Damage_Down.frm",
        Func    = "Elizabeth_DamageFunc",
    },
    
    -- 다운 상01
    {
        ID      = "DOWN_UP01",
        Motion  = "Elizabeth_Down_Up01.frm",
        Func    = "Elizabeth_DownUp01Func",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Elizabeth_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "Elizabeth_Down_Up02.frm",
        Func    = "Elizabeth_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Elizabeth_Down_Up03.frm",
        Func    = "Elizabeth_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Elizabeth_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
     -- 다운 스페셜 
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Elizabeth_Down_Special.frm",
        Func    = "Elizabeth_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Elizabeth_StandUp.frm",
        Func    = "Elizabeth_StandUpFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Elizabeth_Die.frm",
        Func    = "Elizabeth_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Elizabeth_Die02.frm",
        Func    = "Elizabeth_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 회피
    {
        ID      = "AVOID",
        Motion  = "Elizabeth_Avoid.frm",
        Func    = "Elizabeth_AvoidFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Elizabeth_Check_Attack02",
                DelayFrame          = 0,
            },
        }
    },    
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Elizabeth_Stone.frm",
        Func    = "Elizabeth_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Elizabeth_Stone.frm",
        Func    = "Elizabeth_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Elizabeth_Stone.frm",
		Func	= "Elizabeth_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnElizabeth_Land",
    Die     = "OnElizabeth_Die",
    Damage  = "OnElizabeth_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitElizabeth( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Elizabeth_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

function Elizabeth_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1100, 900, 1100, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end


-- 걷기 상태
function Elizabeth_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	
	
	if( iFrame >= 16 and iFrame < 35) then
	    pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
	elseif( iFrame >= 35 and iFrame < 54 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
	elseif( iFrame == 54 ) then
		pMonster:SetSpeedX( 0.0 )
	elseif( iFrame >= 70 and iFrame < 89 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
	elseif( iFrame >= 89 and iFrame < 108 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
	elseif( iFrame == 108 ) then
		pMonster:SetSpeedX( 0.0 )
	end
    
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

--  근접공격01 상태
function Elizabeth_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= 21 and iFrame < 31 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -0.5 )
	elseif( iFrame == 71 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		pMonster:PlaySound(244)
		pMonster:AddDamage( DT_MONSTER_ELIZABETH01 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  배치기 상태
function Elizabeth_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 70 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -2.0 )
		pMonster:AddDamage( DT_MONSTER_ELIZABETH02 )
	elseif( iFrame >= 71 and iFrame <= 71 ) then	
		--pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -2.5 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  땅찍기 상태
function Elizabeth_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 5 ) then
        pMonster:SkillReadyEffectNoStop( 220, 220, 220, 0.0 )
    elseif( iFrame == 76 ) then
		pMonster:PlaySound( "47" )
		pMonster:AddDamage( DT_MONSTER_ELIZABETH03_01 )
		pMonster:AddDamage( DT_MONSTER_ELIZABETH03_02 )
		pMonster:AddDamage( DT_MONSTER_ELIZABETH03_03 )
		pMonster:AddDamage( DT_MONSTER_ELIZABETH03_04 )
		pMonster:AddDamage( DT_MONSTER_ELIZABETH03_05 )
		pMonster:AddParticle( "Broken_Ground03", 0.5, 0.1 )		
		pMonster:AddParticle( "Broken_Ground04", 0.5, 0.1 )		
		pMonster:EarthQuake( 20, 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  롤링어택 상태
function Elizabeth_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 41 ) then
        pMonster:SkillReadyEffectNoStop( 220, 220, 220, 0.0 )
	elseif( iFrame >= 71 and iFrame < 81 ) then				
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 4.0 )
		
		if( iFrame == 71 ) then		
			pMonster:AddDamage( DT_MONSTER_ELIZABETH02 )	
		elseif( iFrame == 76 ) then
			pMonster:AddDamage( DT_MONSTER_ELIZABETH02 )	
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 점프 상태
function Elizabeth_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 점프착지 상태
function Elizabeth_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 점프공격 상태
function Elizabeth_JumpAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 30 ) then
		pMonster:StartText("JUMP")
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 점프공격착지 상태
function Elizabeth_JumpAttackLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 2 ) then			
        pMonster:EarthQuake( 30, 0.06, 0.01 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 죽는상태
function Elizabeth_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Elizabeth_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운
function Elizabeth_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE_LANDING" )
        end
    end
end

-- 다운
function Elizabeth_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE" )
        end
    end
end

-- 다운 상
function Elizabeth_DownUp01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function Elizabeth_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
        pMonster:SetSuperArmorFrame( pMonster:GetLastFrame() + 10 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상3
function Elizabeth_DownUp03Func( iMonsterIndex, iFrame )
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

-- 일어나기
function Elizabeth_StandUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end

-- 회피
function Elizabeth_AvoidFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= 1 and iFrame < 10 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 4.0 )
	elseif( iFrame >= 18 and iFrame < 36 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
	end
	
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
        pMonster:SetInvincible( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck( true )
		pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function Elizabeth_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Elizabeth_IceCurseFunc( iMonsterIndex, iFrame )
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
function Elizabeth_HoldFunc( iMonsterIndex, iFrame )
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

function Elizabeth_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Elizabeth_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Elizabeth_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -200, 600, 200, -600 ) == false ) then
			pMonster:TurnToTarget()
	        pMonster:SetState( "WALK" )
	        pMonster:ResetDelay()
		end
    end
end

function Elizabeth_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 600, 150, 150 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Elizabeth_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Elizabeth_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

   if( pMonster:CheckTargetInRange( 60, -100, -80, 100, -1000 ) == true ) then
        pMonster:SetNoCheckContact(25)
        pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedY( 0.01 )            
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

--  점프공격 상태
function Elizabeth_JumpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:IsTarget() == true ) then
		pMonster:AddCountValue(1)
        pMonster:SetState( "JUMPATTACK" )
        pMonster:ResetDelay()
    end
end

function Elizabeth_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 150, 150, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Elizabeth_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( iFrame >= (pMonster:GetLastFrame() - 5) and pMonster:CheckTargetInRange( 0, -400, 200, 400, -100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
    end
end

function Elizabeth_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetCountValue() >= 1 ) then
		pMonster:TurnToTarget()
		pMonster:AddCountValue(-1)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function Elizabeth_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 350, -350, 150, 350, -100 ) == true and pMonster:GetCountValue() >= 3) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end

function Elizabeth_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function Elizabeth_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

function Elizabeth_Process_Jump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    --pMonster:SetPushCheck( false )

    if( iFrame == 33 ) then
        pMonster:SetNoCheckContact( 62 )

        iTargetX = pMonster:GetTargetX()
        iTargetY = pMonster:GetTargetY()
        iX       = pMonster:GetX()
        iY       = pMonster:GetY()

        pMonster:SetSpeedX( ( iTargetX - iX ) / 80.0 )

        if( iTargetY - iY >= -0.25 ) and ( iTargetY - iY < 0.25 ) then
            pMonster:SetSpeedY( 0.061 )   -- 동일 y선상에 있을때 이정도가 적당..
        elseif( iTargetY - iY >= 0.25 ) and ( iTargetY - iY < 0.5 ) then
            pMonster:SetSpeedY( 0.066 )   -- 타겟이 조금 높은곳에 있으면..
        elseif( iTargetY - iY >= -0.5 ) and ( iTargetY - iY < -0.25 ) then
            pMonster:SetSpeedY( 0.050 )    -- 타겟이 조금 낮은곳에 있으면..
        elseif( iTargetY - iY >= 0.5 ) then
            pMonster:SetSpeedY( 0.071 )
        elseif( iTargetY - iY < -0.5 ) then
            pMonster:SetSpeedY( 0.042 )
        end

        pMonster:TurnToTarget()
     elseif( iFrame > 71 ) then
		if( pMonster:GetSpeedY() < 0.1 ) then
			pMonster:SetSpeedY( pMonster:GetSpeedY() - 0.0035 )
		end
     end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnElizabeth_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckState( "JUMP" ) == true ) then		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "JUMP_LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 50 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    elseif( pMonster:CheckState( "JUMPATTACK" ) == true ) then
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 1.0 ) / 2.0 )
		pMonster:SetState( "JUMPATTACK_LANDING" )
    end    
end

function OnElizabeth_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetState( "DIE" )
	end	
end

function OnElizabeth_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetPushCheck( true )	
	pMonster:SetSpeedX( 2.0 * pMonster:GetSpeedX() / 3.0 )
    pMonster:SetSpeedY( 2.0 * pMonster:GetSpeedY() / 3.0 )
	
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 50 + (pMonster:FloatRand() * 50) )		
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
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if( pMonster:FloatRand() < 0.04 and pMonster:GetIsContact() == true ) then    
			pMonster:AddCountValue(1)		
			pMonster:SetState( "JUMPATTACK" )
		end
	end
end

function Elizabeth_Jump( iMonsterIndex )
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

function Elizabeth_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
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
