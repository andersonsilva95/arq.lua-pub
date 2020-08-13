-- AI_hell_priest.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "hell_priest_Wait.frm",
        Func    = "hell_priest_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame       = 45,
				AICheckFrame1       = 35,
				AICheckFrame2       = 10,
                AIFunc              = "hell_priest_Check_Targeting",
                DelayFrame         = 45,
				DelayFrame1         = 35,
				DelayFrame2         = 20,
            },

            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "hell_priest_Check_ReleaseTarget",
                DelayFrame          = 330,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame       = 40,
				AICheckFrame1       = 20,
				AICheckFrame2       = 10,
                AIFunc              = "hell_priest_Check_TurnToTarget",
                DelayFrame         = 50,
				DelayFrame1         = 15,
				DelayFrame2         = 15,
            },

            -- 걷기
            {
                AICheckFrame        = 80,
                AIFunc              = "hell_priest_Check_Walk",
                DelayFrame          = 30,
            },

            -- 점프업
            {
                AICheckFrame        = 51,
                AIFunc              = "hell_priest_Check_JumpUp",
                DelayFrame          = 100,
            },        
            -- 점프다운
            {
                AICheckFrame        = 52,
                AIFunc              = "hell_priest_Check_JumpDown",
                DelayFrame          = 50,
            },

			-- 근접공격
            {
                AICheckFrame       = 30,
				AICheckFrame1       = 20,
				AICheckFrame2       = 10,
                AIFunc              = "hell_priest_Check_Attack01",
                DelayFrame         = 140,
				DelayFrame1         = 100,
				DelayFrame2         = 55,
            },

            -- 근접공격
            {
                AICheckFrame       = 60,
				AICheckFrame1       = 40,
				AICheckFrame2       = 20,
                AIFunc              = "hell_priest_Check_Attack02",
                DelayFrame         = 180,
				DelayFrame1         = 120,
				DelayFrame2         = 60,
            },

            -- 근접공격
            {
                AICheckFrame       = 220,
				AICheckFrame1       = 200,
				AICheckFrame2       = 150,
                AIFunc              = "hell_priest_Check_Attack03",
                DelayFrame         = 1300,
				DelayFrame1         = 1000,
				DelayFrame2         = 900,
            },
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "hell_priest_move.frm",
        Func            = "hell_priest_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "hell_priest_MoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame       = 45,
				AICheckFrame1       = 35,
				AICheckFrame2       = 10,
                AIFunc              = "hell_priest_Check_Targeting",
                DelayFrame         = 45,
				DelayFrame1         = 35,
				DelayFrame2         = 20,
            },
            -- 타겟지움
            {
                AICheckFrame        = 220,
                AIFunc              = "hell_priest_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame       = 40,
				AICheckFrame1       = 20,
				AICheckFrame2       = 10,
                AIFunc              = "hell_priest_Check_TurnToTarget",
                DelayFrame         = 50,
				DelayFrame1         = 15,
				DelayFrame2         = 15,
            },
            -- 점프업
            {
                AICheckFrame        = 41,
                AIFunc              = "hell_priest_Check_JumpUp",
                DelayFrame          = 80,
            },
			-- 근접공격
            {
                AICheckFrame       = 30,
				AICheckFrame1       = 20,
				AICheckFrame2       = 10,
                AIFunc              = "hell_priest_Check_Attack01",
                DelayFrame         = 140,
				DelayFrame1         = 100,
				DelayFrame2         = 55,
            },
			-- 근접공격
            {
                AICheckFrame       = 60,
				AICheckFrame1       = 40,
				AICheckFrame2       = 20,
                AIFunc              = "hell_priest_Check_Attack02",
                DelayFrame         = 180,
				DelayFrame1         = 120,
				DelayFrame2         = 60,
            },
            -- 점프다운
            {
                AICheckFrame        = 42,
                AIFunc              = "hell_priest_Check_JumpDown",
                DelayFrame          = 40,
            },
            -- 멈추기
            {
                AICheckFrame        = 5,
                AIFunc              = "hell_priest_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },

    -- 타겟팅 힐
    {
        ID      = "ATTACK01",
        Motion  = "hell_priest_Attack01.frm",
        Func    = "hell_priest_Attack01Func",
    },
    
    -- 광역 힐
    {
        ID      = "ATTACK02",
        Motion  = "hell_priest_Attack02.frm",
        Func    = "hell_priest_Attack02Func",
    },
    
    -- 다크 임펙트
    {
        ID      = "ATTACK03",
        Motion  = "hell_priest_Attack03.frm",
        Func    = "hell_priest_Attack03Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "hell_priest_Jump_Up.frm",
        Func    = "hell_priest_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "hell_priest_Jump_Down.frm",
        Func    = "hell_priest_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "hell_priest_Jump_Landing.frm",
        Func    = "hell_priest_ToWait",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "hell_priest_Damage_Up.frm",
        Func    = "hell_priest_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "hell_priest_Damage_Middle.frm",
        Func    = "hell_priest_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "hell_priest_Damage_Down.frm",
        Func    = "hell_priest_DamageFunc",
    },

    -- 다운 상
    {
        ID      = "DOWN_UP01",
        Motion  = "hell_priest_Down_Up01.frm",
        Func    = "hell_priest_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "hell_priest_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 상02
    {
        ID      = "DOWN_UP02",
        Motion  = "hell_priest_Down_Up02.frm",
        Func    = "hell_priest_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- 다운 상 착지
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "hell_priest_Down_Up03.frm",
        Func    = "hell_priest_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "hell_priest_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- 다운 중
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "hell_priest_Down_Middle.frm",
        Func    = "hell_priest_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "hell_priest_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 하
    {
        ID      = "DOWN_DOWN",
        Motion  = "hell_priest_Down_Middle.frm",
        Func    = "hell_priest_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "hell_priest_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- 다운 스페셜
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "hell_priest_Down_Special01.frm",
        Func    = "hell_priest_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 다운 스페셜 착지
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "hell_priest_Down_Special02.frm",
        Func    = "hell_priest_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "hell_priest_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "hell_priest_down_middle.frm",
        Func    = "hell_priest_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기 착지
    {
        ID      = "DIE_FIRST",
        Motion  = "hell_priest_down_middle.frm",
        Func    = "hell_priest_DieLanding1Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "hell_priest_Standup.frm",
        Func    = "hell_priest_StandupFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "hell_priest_Stone.frm",
        Func    = "hell_priest_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "hell_priest_Stone.frm",
        Func    = "hell_priest_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "hell_priest_Stone.frm",
		Func	= "hell_priest_HoldFunc",
	},
}

CallBack =
{
    Land    = "Onhell_priest_Land",
    Die     = "Onhell_priest_Die",
    Damage  = "Onhell_priest_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function Inithell_priest( iMonsterIndex )
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
    
    pMonster:RegisterSummonMonsterType( MON_SKELETON_FIGHTER )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function hell_priest_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function hell_priest_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽었음
function hell_priest_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- 죽기 착지
function hell_priest_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 20 ) then
		pMonster:PlaySound(985008)
		--pMonster:AddDamage(DT_HELL_HOWLING_GHOST)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 죽기 착지
function hell_priest_DieLanding1Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:ToggleRender(false )
		pMonster:EndMonster( false )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function hell_priest_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운 상
function hell_priest_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상2
function hell_priest_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 다운 상3
function hell_priest_DownUp03Func( iMonsterIndex, iFrame )
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
function hell_priest_DownFunc( iMonsterIndex, iFrame )
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
function hell_priest_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- 다운 스페셜 착지
function hell_priest_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function hell_priest_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function hell_priest_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame == 25 ) then
		pMonster:PlaySound(985005)
		pMonster:SetSuperArmor( true )
        pMonster:AddDamage( DT_HELL_PRIEST_HEAL )
    end
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
        pMonster:ReleaseTarget()
    end

end

--  근접공격2 상태
function hell_priest_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame == 40 ) then
		pMonster:PlaySound(985006)
        pMonster:AddDamage(DT_HELL_PRIEST_HEAL_STARTER)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function hell_priest_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 52 ) then
		pMonster:PlaySound(997018)
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocate(DT_LOWER_DARKMAGE_DARKIMPACT_L, -0.4, 0.7 )
		else
			pMonster:AddDamageWithLocate(DT_LOWER_DARKMAGE_DARKIMPACT, -0.4, 0.7 )
		end
	elseif( iFrame == 68 ) then
		pMonster:PlaySound(997018)
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocate(DT_LOWER_DARKMAGE_DARKIMPACT_L, -0.0, 0.9 )
		else
			pMonster:AddDamageWithLocate(DT_LOWER_DARKMAGE_DARKIMPACT, -0.0, 0.9 )
		end
	elseif( iFrame == 84 ) then
		pMonster:PlaySound(997018)
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocate(DT_LOWER_DARKMAGE_DARKIMPACT_L, 0.4, 1.1 )
		else
			pMonster:AddDamageWithLocate(DT_LOWER_DARKMAGE_DARKIMPACT, 0.4, 1.1 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  점프 상태
function hell_priest_JumpFunc( iMonsterIndex, iFrame )
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
function hell_priest_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function hell_priest_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function hell_priest_StoneCurseFunc( iMonsterIndex, iFrame )
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
function hell_priest_IceCurseFunc( iMonsterIndex, iFrame )
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
function hell_priest_HoldFunc( iMonsterIndex, iFrame )
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

function hell_priest_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    local WideBox = KBoundBox()
	WideBox.fTOP = 200
	WideBox.fLEFT = -500
	WideBox.fRIGHT = 500
	WideBox.fBOTTOM = -100
	
	local TallBox = KBoundBox()
	TallBox.fTOP = 500
	TallBox.fLEFT = -200
	TallBox.fRIGHT = 200
	TallBox.fBOTTOM = -400
		
	for i = 0, MAX_MONSTER - 1 do
		local pTarget = g_MyD3D:GetMonster( i )
		if ( pMonster:IsBoxIn( 100,0,WideBox,pTarget ) == true or pMonster:IsBoxIn( 0,0,TallBox,pTarget ) == true ) then		    
			if( pTarget:IsLive() == true and pTarget:GetHP() < pTarget:GetMaxHP() ) then
				pMonster:SetMonsterTargetManual( i );
				pMonster:TurnToTarget()		
				if( pMonster:CheckState( "IDLE" ) == true ) then
					pMonster:SetState( "WAIT" )
				end
				pMonster:ResetDelay()
				break
			end			
		end
    end

    if( pMonster:SetTarget( 100, -400, 360, 400, -360 ) == true ) then
		pMonster:TurnToTarget()
		
        pMonster:ResetDelay()
    end  
end

function hell_priest_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -500, 400, 500, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function hell_priest_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function hell_priest_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--타겟이 몬스터인 경우와 플레이어인 경우를 나누어서 처리 해야 한다.
    if( pMonster:IsTargetMonster() ) then
        if( pMonster:CheckTargetInRange( 150, -800, 400, 650, -100 ) == true ) then
			    pMonster:TurnToTarget()
                pMonster:SetState( "WALK" )
                pMonster:ResetDelay()
        end
    
    else
        --타겟이 플레이어인경우
        if( pMonster:CheckTargetInRange( 150, -800, 600, 850, -600 ) == true and pMonster:CheckTargetInRange( 0, -100, 100, 100, -150 ) == false and pMonster:FloatRand() < 0.7 ) then
			    pMonster:TurnToTarget()
                pMonster:SetState( "WALK" )
                pMonster:ResetDelay()
        end
    end
end

function hell_priest_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -350, 360, 350, -400 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function hell_priest_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function hell_priest_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTargetMonster() == true and pMonster:CheckTargetInRange( 250, -500, 300, 500, -180 ) == true ) then
        local pMonsterTarget = g_MyD3D:GetMonster( pMonster:GetMonsterTarget() )
	    pMonster:SetState( "ATTACK01" )
	    pMonster:ResetDelay()	
    end
end

function hell_priest_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	 if( pMonster:IsTargetMonster() == true and pMonster:CheckTargetInRange( 400, -800, 300, 800, -400 ) == true ) then
        local pMonsterTarget = g_MyD3D:GetMonster( pMonster:GetMonsterTarget() )
	    pMonster:SetState( "ATTACK02" )
	    pMonster:ResetDelay()	
    end
end

function hell_priest_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 150, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function hell_priest_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 360, 200, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		hell_priest_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function hell_priest_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -150, -100, 150, -400 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function hell_priest_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Onhell_priest_Land( iMonsterIndex )
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

function Onhell_priest_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function Onhell_priest_Damage( iMonsterIndex )
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

function hell_priest_Jump( iMonsterIndex )
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

function hell_priest_MoveFail( iMonsterIndex )
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
